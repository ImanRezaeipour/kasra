<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="NewCardReaderDefinition.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.NewCardReaderDefinition"
    ValidateRequest="false" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="../../../App_Utility/Scripts/General.js" type="text/javascript"></script>
    <style type="text/css">
        .General
        {
            font-family: tahoma;
            font-size: 9pt;
            font-weight: normal;
            font-style: normal;
            font-variant: normal;
        }
        .lefttd
        {
            margin: 0px;
            padding: 0px;
            border-width: 1px;
            border-color: #CDD6E1;
            border-bottom-style: solid;
            border-left-style: solid;
            font-family: tahoma;
            font-size: 9pt;
            font-weight: normal;
            font-style: normal;
            font-variant: normal;
        }
        .righttd
        {
            padding: 3px;
            border-width: 1px;
            border-color: #CDD6E1;
            border-bottom-style: solid;
            border-right-style: solid;
            border-left-style: solid;
            vertical-align: middle;
            font-family: tahoma;
            font-size: 9pt;
            font-weight: normal;
            font-style: normal;
            font-variant: normal;
        }
        #Checkbox1
        {
        }
        #Checkbox2
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <table style="padding-right: 15px; width: 500px; height: 100%; vertical-align: top;">
        <tr>
            <td colspan="2" style="height: 1px">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 230px; vertical-align: top">
                <table id="PropertyTable" cellpadding="0" cellspacing="0" style="border-style: none;
                    border-width: 0px; width: 228px; background-color: #FFFFFF;">
                    <tr>
                        <td class="General" colspan="3" style="height: 30px; background-image: url('../../../App_Utility/Images/Titlebar.gif');
                            background-repeat: repeat-x">
                            خصوصیات &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="righttd" style="width: 117px; text-align: right; font-size: 8.5pt;">
                            <span>شماره دستگاه</span>
                        </td>
                        <td class="lefttd" style="width: 117px">
                            <input id="txtCardReaderNo" runat="server" style="padding: 2px; border-width: 0px;
                                border-style: none; width: 100%; text-align: left;" type="text" onblur="OnBlurTxtCardReaderNo(this)" onkeydown="OnKeyDownNum('integer',0)" />
                        </td>
                        <td class="lefttd" rowspan="17" style="width: 5px; background-color: #6B94C8;">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="righttd" style="width: 117px; text-align: right; font-size: 8.5pt;">
                            <span>نوع ارتباط</span>
                        </td>
                        <td class="lefttd" style="width: 117px">
                            <select id="cmbConnectionType" name="D3" style="border-style: none; border-width: 0px;
                                width: 100%; height: 100%;">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="righttd" style="width: 117px; text-align: right; font-size: 8.5pt;">
                            <span>شماره COM</span>
                        </td>
                        <td class="lefttd" style="width: 117px">
                            <input id="txtComPort" style="padding: 2px; border-width: 0px; border-style: none;
                                width: 100%; text-align: left;" type="text" onkeydown="OnKeyDownNum('integer',0)"  />
                        </td>
                    </tr>
                    <tr>
                        <td class="righttd" style="width: 117px; text-align: right; font-size: 8.5pt;">
                            <span>سرعت انتقال</span>
                        </td>
                        <td class="lefttd" style="width: 117px">
                            <select id="cmbBaudRate" runat="server" name="D4" style="border-style: none; border-width: 0px;
                                width: 100%; height: 100%;">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="righttd" style="width: 117px; text-align: right; font-size: 8.5pt;">
                            <span>مدل</span>
                        </td>
                        <td class="lefttd" style="width: 117px">
                            <select id="cmbSystem" runat="server" name="D6" style="border-style: none; border-width: 0px;
                                width: 100%; height: 100%;">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="righttd" style="width: 117px; text-align: right; font-size: 8.5pt;">
                            <span>دستگاه</span>
                        </td>
                        <td class="lefttd" style="width: 117px">
                            <select id="cmbDeviceType" runat="server" name="D5" onchange="onchangeCmbDeviceType(this)"
                                style="border-style: none; border-width: 0px; width: 100%; height: 100%;">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="righttd" style="width: 117px; text-align: right; font-size: 8.5pt;">
                            <span>آدرس IP</span>
                        </td>
                        <td class="lefttd" style="width: 117px">
                            <input id="txtIPAddress" style="padding: 2px; border-width: 0px; border-style: none;
                                width: 100%; text-align: left;" type="text" />
                        </td>
                    </tr>
                    <tr>
                        <td class="righttd" style="width: 117px; text-align: right; font-size: 8.5pt;">
                            <span>طول بلاک</span>
                        </td>
                        <td class="lefttd" style="width: 117px">
                            <select id="cmbBlkLen" runat="server" name="D7" style="border-style: none; border-width: 0px;
                                width: 100%; height: 100%;">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="righttd" style="width: 117px; text-align: right; font-size: 8.5pt;">
                            <span>تنظیم سرعت</span>
                        </td>
                        <td class="lefttd" style="width: 117px">
                            <select runat="server" name="D8" style="border-style: none; border-width: 0px; width: 100%;
                                height: 100%;" id="cmbBaudAdjust">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="righttd" style="width: 117px; text-align: right; font-size: 8.5pt;">
                            <span>UseOnceConnect</span>
                        </td>
                        <td class="lefttd" style="width: 117px">
                            <select runat="server" name="D9" style="border-style: none; border-width: 0px; width: 100%;
                                height: 100%;" id="cmbUseOnceConnect">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="righttd" style="width: 117px; text-align: right; font-size: 8.5pt;">
                            <span>ViaMaster</span>
                        </td>
                        <td class="lefttd" style="width: 117px">
                            <select runat="server" name="D10" style="border-style: none; border-width: 0px; width: 100%;
                                height: 100%;" id="cmbViaMaster">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="righttd" style="width: 117px; text-align: right; font-size: 8.5pt;">
                            <span>ViaType</span>
                        </td>
                        <td class="lefttd" style="width: 117px">
                            <select runat="server" name="D11" style="border-style: none; border-width: 0px; width: 100%;
                                height: 100%;" id="cmbViaType">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="righttd" style="width: 117px; text-align: right; font-size: 8.5pt;">
                            <span>DontUseTapi</span>
                        </td>
                        <td class="lefttd" style="width: 117px">
                            <select runat="server" name="D12" style="border-style: none; border-width: 0px; width: 100%;
                                height: 100%;" id="cmbDontUseTapi">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="righttd" style="width: 117px; text-align: right; font-size: 8.5pt;">
                            <span>زمان خاتمه</span>
                        </td>
                        <td class="lefttd" style="width: 117px">
                            <input id="txtTimeOut" style="padding: 2px; border-width: 0px; border-style: none;
                                width: 100%; text-align: left;" type="text"  />
                        </td>
                    </tr>
                    <tr>
                        <td class="righttd" style="width: 117px; text-align: right; font-size: 8.5pt;">
                            <span>حداکثر تلاش</span>
                        </td>
                        <td class="lefttd" style="width: 117px">
                            <input id="txtMaxRetry" style="padding: 2px; border-width: 0px; border-style: none;
                                width: 100%; text-align: left;" type="text" onkeydown="OnKeyDownNum('integer',0)"  />
                        </td>
                    </tr>
                    <tr>
                        <td class="righttd" style="width: 117px; text-align: right; font-size: 8.5pt;">
                            <span>پخش صدا</span>
                        </td>
                        <td class="lefttd" style="width: 117px">
                            <select runat="server" name="D13" style="border-style: none; border-width: 0px; width: 100%;
                                height: 100%;" id="cmbPlayBeep">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="righttd" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 350px; vertical-align: top">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table cellpadding="0" cellspacing="0" style="border-style: solid; border-width: 1px;
                            width: 100%;">
                            <tr>
                                <td style="width: 15px;">
                                    &nbsp;
                                </td>
                                <td style="width: 90px" class="General">
                                    شرکت سازنده:&nbsp;
                                </td>
                                <td style="text-align: left; width: 67px;">
                                    <select id="cmbBrandName" name="D2" runat="server" style="width: 130px; margin-right: 0px;"
                                        onchange="cmbBrandNameOnchange(this)">
                                        <option></option>
                                    </select>
                                </td>
                                <td style="text-align: left">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; width: 15px;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right">
                                    &nbsp;
                                </td>
                                <td style="text-align: right">
                                    &nbsp;
                                </td>
                                <td style="text-align: right">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15px">
                                    &nbsp;
                                </td>
                                <td style="width: 90px" class="General">
                                    نام کارتخوان :
                                </td>
                                <td style="text-align: left; width: 67px;">
                                    <input id="txteCardReaderName" type="text" runat="server" style="width: 130px" />
                                </td>
                                <td style="text-align: left">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15px">
                                    &nbsp;
                                </td>
                                <td style="width: 90px">
                                    &nbsp;
                                </td>
                                <td style="text-align: left; width: 67px;">
                                    &nbsp;
                                </td>
                                <td style="text-align: left">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15px">
                                    &nbsp;
                                </td>
                                <td style="width: 90px" class="General">
                                    کد کارتخوان :
                                </td>
                                <td style="text-align: left; width: 67px;">
                                    <input id="txtCardReaderCode" disabled="disabled" type="text" runat="server" style="width: 130px" />
                                </td>
                                <td style="text-align: left">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15px">
                                    &nbsp;
                                </td>
                                <td style="width: 90px">
                                    &nbsp;
                                </td>
                                <td style="text-align: left; width: 67px;">
                                    &nbsp;
                                </td>
                                <td style="text-align: left">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15px">
                                    &nbsp;
                                </td>
                                <td style="width: 90px" class="General">
                                    محل نصب:
                                </td>
                                <td style="text-align: left; width: 67px;">
                                    <input id="txtLocation" type="text" runat="server" style="width: 130px" />
                                </td>
                                <td style="text-align: left">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; width: 15px;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right">
                                    &nbsp;
                                </td>
                                <td style="text-align: right">
                                    &nbsp;
                                </td>
                                <td style="text-align: right">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15px">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <table cellpadding="0" cellspacing="0" style="width: 125px">
                                        <tr>
                                            <td style="text-align: left; width: auto">
                                                فعال
                                            </td>
                                            <td style="text-align: left; width: auto;">
                                                <input id="rdoActive" type="radio" name="ActiveStatus" value="1" runat="server" checked />
                                            </td>
                                            <td style="width: 106px; text-align: left;">
                                                غير فعال
                                            </td>
                                            <td style="text-align: left">
                                                <input id="rdoInActive" type="radio" name="ActiveStatus" value="2" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="text-align: left">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15px">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td style="text-align: left">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <div style="display: none">
                            <asp:HiddenField ID="txtCardReaderID" runat="server" />
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtSubmit" runat="server" />
                            <asp:HiddenField ID="xmlStr" runat="server" />
                            <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                            <asp:HiddenField ID="txtConnectionType" runat="server" />
                            <asp:HiddenField ID="txtSystem" runat="server" />
                            <asp:HiddenField ID="XMLcmbConnectionType" runat="server" />
                            <asp:HiddenField ID="XMLcmbSystem" runat="server" />
                            <asp:HiddenField ID="txtmodalPageStatus" runat="server" />
                            <asp:HiddenField ID="XMLCardReaderInfo" runat="server" />
                            
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
<div style="display: none">
<input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                               <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
                    runat="server" />
</div>
   <script src="../../../App_Utility/Scripts/BaseInfo/CardReader/NewCardReaderDefinition.js"
        type="text/javascript"></script>

</asp:Content>
