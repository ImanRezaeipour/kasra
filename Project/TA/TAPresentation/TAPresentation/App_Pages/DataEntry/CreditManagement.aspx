<%@ Page Title="-----------------------------------------------------------------------------------------------------------کارتابل اسناد-------------------------------------------------------------------------------------------------------------------" Language="C#" ValidateRequest="false" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="CreditManagement.aspx.cs"  AsyncTimeout="1800" Inherits="TAPresentation.App_Pages.DataEntry.CreditManagement" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>
<%@ Register src="../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc4" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../App_Utility/Styles/FixGridHeader.css" rel="stylesheet" type="text/css" />
    <style type="text/css" >
        .ReadStyle
        {
            font-weight:bold;
            font-size:14px;
        }
        .fieldsetStyle 
        {
            border-right: lightblue thin inset;
            border-top: #78BED6 thin solid; 
            border-left: #78BED6 thin outset; 
            border-bottom: #78BED6 thin solid;
        }
        .legendStyle
        {
            color: #78BED6
        }
        .DropDownListStyle
        {
            font-weight:bold;
	        font-size: 8pt;
	        font-family: tahoma;
	        background-color: white;
	        border-color: lightsteelblue;
	        height :20px ;
	        width: 180px;
            display: none
        }
        .DivStyle1
        {
            border: thin groove #000000; 
            background-color: #C5D5E9;
            height:1370px; 
            clear: right; 
            clip: rect(auto, auto, auto, auto);
            vertical-align: top; 
            float: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="1800"  runat="server">
    </asp:ScriptManager>
    <table width="100%" height="80%" align="center">
        <tr>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامتر هاي جستجو</legend>
                    <table width="100%" align="right" cellpadding="0" cellspacing="0" >
                        <tr>
                            <td>
                                از تاريخ :
                            </td>
                            <td>
                                <uc2:KCalendar ID="KCalSDate" runat="server" />
                            </td>
                            <td>
                                تا تاريخ :
                            </td>
                            <td>
                                <uc2:KCalendar ID="KCalEDate" runat="server" />
                            </td>
                            <td id="TdRelated">
                                متقاضي :
                            </td>
                            <td id="TdCmbRelatedPerson">
                                <uc4:ComboBox ID="CmbRelatedPerson" runat="server" />
                            </td>
                            <td>
                                نوع :
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="CmbDocType" name="CmbDocType" Style="width: 100px" class="TxtControls"
                                            onchange="OnChangeCmbDocType()" runat="server">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                نام مجوز :
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="CmbType" name="CmbType" Width="180px" class="TxtControls" runat="server">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="CmbCreditGroupCode" name="CmbCreditGroupCode" class="DropDownListStyle"
                                            runat="server">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="CmbAttendance" name="CmbAttendance" class="DropDownListStyle"
                                            runat="server">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="CmbDayContinuation" name="CmbDayContinuation" class="DropDownListStyle"
                                            runat="server">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="CmbMonthlyItem" name="CmbMonthlyItem" class="DropDownListStyle"
                                            runat="server">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="CmbReplaceDetail" name="CmbReplaceDetail" class="DropDownListStyle"
                                            runat="server">
                                        </asp:DropDownList>
                                         <asp:DropDownList ID="CmbDailyItem" name="CmbDailyItem" class="DropDownListStyle"
                                            runat="server">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="CmbDoc" name="CmbDoc" class="DropDownListStyle" runat="server">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                نمايش :
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbShow" onchange="OnChangeCmbShow()" name="CmbShow" Style="width: 143px"
                                    class="TxtControls" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                وضعيت :
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbAction" name="CmbAction" Style="width: 143px" class="TxtControls"
                                    runat="server" >
                                </asp:DropDownList>
                                <asp:DropDownList ID="CmbStatus" name="CmbStatus" Style="width: 143px; display: none"
                                    class="TxtControls" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td id="TdAccepter">
                                تاييد کننده :
                            </td>
                            <td id="TdAccepterPerson">
                                <uc4:ComboBox ID="cmbPersonCode" runat="server" />
                            </td>
                            <td id="TdDepartment">
                                واحد سازماني :
                            </td>
                            <td id="TdCmbDepartment">
                                <asp:DropDownList ID="CmbDepartment" runat="server" Width="143px" CssClass="TxtControls"
                                    onkeypress="return KeySort(this,false)">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="10">
                                <fieldset dir="rtl" class="fieldsetStyle">
                                    <legend class="legendStyle">مرتب سازي بر اساس</legend>
                                    <table align="right">
                                        <tr>
                                            <td style="width: 150px">
                                                <input type="checkbox" id="ChkDate" onclick="OnClickCHK('ChkDate','txtPriorityDate')" />تاريخ :
                                                <input type="text" id="txtPriorityDate" onkeydown="OnKeyDownInt(this)" maxlength="1"
                                                    class="TxtControls" style="width: 20px" onfocus="OnFocusTxtPriority(this)" onblur="OnBlurTxtPriority('txtPriorityDate','ChkDate')"/>
                                                <img src="../../App_Utility/Images/Icons/Up1.gif" id="ImgAscDate" alt="صعودي" onclick="OnClickImgSort('Date',1)"
                                                    style="cursor: hand" />
                                                <img src="../../App_Utility/Images/Icons/Down1.gif" alt="نزولي" id="ImgDescDate"
                                                    onclick="OnClickImgSort('Date',0)" style="cursor: hand; display: none" />
                                            </td>
                                            <td style="width: 150px">
                                                <input type="checkbox" id="ChkPersonID" onclick="OnClickCHK('ChkPersonID','txtPIDPriority')"/>شماره پرسنلي :
                                                <input type="text" id="txtPIDPriority" onkeydown="OnKeyDownInt(this)" maxlength="1"
                                                    class="TxtControls" style="width: 20px;" onfocus="OnFocusTxtPriority(this)" onblur="OnBlurTxtPriority('txtPIDPriority','ChkPersonID')"  />
                                                <img src="../../App_Utility/Images/Icons/Up1.gif" id="ImgAscPID" alt="صعودي" onclick="OnClickImgSort('PID',1)"
                                                    style="cursor: hand" />
                                                <img src="../../App_Utility/Images/Icons/Down1.gif" id="ImgDescPID" alt="نزولي"
                                                    onclick="OnClickImgSort('PID',0)" style="cursor: hand; display: none" />
                                            </td>
                                            <td style="width: 170px">
                                                <input type="checkbox" id="ChkPName" onclick="OnClickCHK('ChkPName','txtPNamePriority')"/>نام و نام خانوادگي :
                                                <input type="text" id="txtPNamePriority" onkeydown="OnKeyDownInt(this)" maxlength="1"
                                                    class="TxtControls" style="width: 20px" onfocus="OnFocusTxtPriority(this)"  onblur="OnBlurTxtPriority('txtPNamePriority','ChkPName')"/>
                                                <img src="../../App_Utility/Images/Icons/Up1.gif" id="ImgAscPName" onclick="OnClickImgSort('PName',1)"
                                                    alt="صعودي" style="cursor: hand" />
                                                <img src="../../App_Utility/Images/Icons/Down1.gif" id="ImgDescPName" alt="نزولي"
                                                    onclick="OnClickImgSort('PName',0)" style="cursor: hand; display: none" />
                                            </td>
                                            <td style="width: 150px">
                                                <input type="checkbox" id="ChkDepartment" onclick="OnClickCHK('ChkDepartment','txtDeptPriority')" />واحد سازماني :
                                                <input type="text" id="txtDeptPriority" onkeydown="OnKeyDownInt(this)" maxlength="1"
                                                    class="TxtControls" style="width: 20px" onfocus="OnFocusTxtPriority(this)" onblur="OnBlurTxtPriority('txtDeptPriority','ChkDepartment')" />
                                                <img src="../../App_Utility/Images/Icons/Up1.gif" id="ImgAscDept" onclick="OnClickImgSort('Dept',1)"
                                                    alt="صعودي" style="cursor: hand" />
                                                <img src="../../App_Utility/Images/Icons/Down1.gif" id="ImgDescDept" onclick="OnClickImgSort('Dept',0)"
                                                    alt="نزولي" style="cursor: hand; display: none" />
                                            </td>
                                            <td style="width: 150px">
                                                <input type="checkbox" id="ChkDocType" onclick="OnClickCHK('ChkDocType','txtDocTypePriority')" />نوع درخواست :
                                                <input type="text" id="txtDocTypePriority"  onkeydown="OnKeyDownInt(this)" maxlength="1"
                                                    class="TxtControls" style="width: 20px" onfocus="OnFocusTxtPriority(this)" onblur="OnBlurTxtPriority('txtDocTypePriority','ChkDocType')" />
                                                <img src="../../App_Utility/Images/Icons/Up1.gif" onclick="OnClickImgSort('DocType',1)"
                                                    id="ImgAscDocType" alt="صعودي" style="cursor: hand" />
                                                <img src="../../App_Utility/Images/Icons/Down1.gif" onclick="OnClickImgSort('DocType',0)"
                                                    id="ImgDescDocType" alt="نزولي" style="cursor: hand; display: none" />
                                            </td>
                                            <td style="width: 150px">
                                                <input type="checkbox" id="ChkDocTime" onclick="OnClickCHK('ChkDocTime','txtDocTimePriority')" />تاريخ
                                                درخواست :
                                                <input type="text" id="txtDocTimePriority" onkeydown="OnKeyDownInt(this)" maxlength="1"
                                                    class="TxtControls" style="width: 20px" onfocus="OnFocusTxtPriority(this)" onblur="OnBlurTxtPriority('txtDocTimePriority','ChkDocTime')" />
                                                <img src="../../App_Utility/Images/Icons/Up1.gif" onclick="OnClickImgSort('DocTime',1)"
                                                    id="ImgAscDocTime" alt="صعودي" style="cursor: hand" />
                                                <img src="../../App_Utility/Images/Icons/Down1.gif" onclick="OnClickImgSort('DocTime',0)"
                                                    id="ImgDescDocTime" alt="نزولي" style="cursor: hand; display: none" />
                                            </td>
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
            <td  align="center">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top"  align="center">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainer" class="DivStyle1" align="center">
                            <cc2:KasraGrid ID="GrdCreditManage" runat="server" OnRowDataBound="Grid_RowDataBound" AllowSorting="true"
                                OnSorting="Grd_Sorting" >
                            </cc2:KasraGrid>
                        </div>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtType" runat="server" />
                        <asp:HiddenField ID="txtID" runat="server" />
                        <asp:HiddenField ID="txtAlertStatus" runat="server" />
                        <asp:HiddenField ID="XMLvDocs" runat="server" />
                        <asp:HiddenField ID="txtGridData" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                         <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
                     <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtCommonCreditCount" runat="server" />
                        <asp:HiddenField ID="txtValidateDelDocGroup" runat="server" />
                        <asp:HiddenField ID="txtMsgDelDocGroup" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit2" runat="server" Text="BtnSubmit" OnClick="Button2_Click" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtKCalSDate" name="txtKCalSDate" runat="server" />
        <input type="text" id="txtKCalEDate" name="txtKCalEDate" runat="server" />
        <input type="text" id="txtSaveXml" name="txtSaveXml" runat="server" />
        <input type="text" id="txtPersonID" name="txtPersonID" runat="server" />
        <input type="text" id="txtCredit" name="txtCredit" runat="server" />
        <input type="text" id="txtNotAcceptDesc" name="txtNotAcceptDesc" runat="server" />
        <input type="text" id="txtOnlineUserName" name="txtOnlineUserName" runat="server" />
        <input type="text" id="txtKCalSFirstDate" name="txtKCalSFirstDate" runat="server" />
        <input type="text" id="txtKCalEFirstDate" name="txtKCalEFirstDate" runat="server" />
        <input type="text" id="txtActionTypeID" name="txtActionTypeID" runat="server" />
        <input type="text" id="txtCreatorPersonID" name="txtCreatorPersonID" runat="server" />
        <input type="text" id="txtAccessBtn" name="txtAccessBtn" runat="server" />
        <input type="text" id="txtFlagNotAccept" name="txtFlagNotAccept" runat="server" />
        <input type="text" id="txtDelTableName" name="txtDelTableName" runat="server" />
        <input type="text" id="txtDelID" name="txtDelID" runat="server" />
        <input type="text" id="txtSortXml" name="txtSortXml" runat="server" />
        <input type="text" id="txtJPersonelID" name="txtJPersonelID" runat="server" />
        <input type="text" id="txtFlagAccess" name="txtFlagAccess" runat="server" />
        <input type="text" id="txtNewWFO" name="txtNewWFO" runat="server" />
    </div>
    <script language="javascript" src="../../App_Utility/Scripts/DataEntry/CreditManagement.js" type="text/javascript"></script>
    <script src="../../App_Utility/Scripts/KeySorting.js" type="text/javascript"></script>
</asp:Content>

