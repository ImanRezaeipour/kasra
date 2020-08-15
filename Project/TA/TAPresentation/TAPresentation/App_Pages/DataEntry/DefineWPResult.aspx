<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="DefineWPResult.aspx.cs" ValidateRequest="false"
    Inherits="TAPresentation.App_Pages.DataEntry.DefineWPResult" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register src="../../App_Utility/MultiDepartment/MultiDepartment.ascx" tagname="MultiDepartment" tagprefix="uc2" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #BtnCloseDiv
        {
            width: 71px;
            height: 24px;
        }
        #BtnUpdate
        {
            width: 71px;
            height: 24px;
        }
        .DivAbsolut
        {
            position: absolute;
        }
        .TableBase
        {
             border: medium groove #C0C0C0;
            background-color: #DBE3F0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="DivResult" class="DivAbsolut" style="top: 325px; left: 113px; display: none;
        right: 196px; width: 645px; height: 95px;">
        <table border="3px" cellpadding="0" cellspacing="0">
            <tr>
                <td class="CssHeaderStyle" align="center">
                    شماره پرسنلي
                </td>
                <td class="CssHeaderStyle" align="center">
                    نام و نام خانوادگي
                </td>
                <td class="CssHeaderStyle" align="center">
                    نوع مجوز
                </td>
                <td class="CssHeaderStyle" align="center">
                    دوره
                </td>
                <td class="CssHeaderStyle" align="center">
                    مدت
                </td>
                <td class="CssHeaderStyle" align="center">
                    توضيحات
                </td>
            </tr>
            <tr id="TRResult" class="CssAlternatingItemStyle">
                <td id="TDCode" align="center" style="width: 20%">
                </td>
                <td id="TDName" align="right" style="width: 20%">
                </td>
                <td id="TDCreditType" align="right" style="width: 20%; height: 25px">
                </td>
                <td id="TDPeriod" align="right" style="width: 20%">
                </td>
                <td id="TDValue" align="center" style="width: 15%">
                </td>
                <td id="TDDescr" align="right" style="width: 25%">
                </td>
            </tr>
            <tr style="height: 30px;" class="BackGround">
                <td colspan="6" align="center" valign="middle">
                    <input type="button" id="BtnCloseDiv" class="CssHeaderStyle" onkeydown="onkeydownArrow(this)"
                        onclick="onclickBtnCloseDiv()" value="   Cancel  " />&nbsp;
                </td>
            </tr>
        </table>
    </div>

    <div align="center"  id="DivPopup" style="border: 2px groove #000000;display:none;text-align:center; position:absolute; width:500px;top:300px; left:100px; height:150px; background-color:White; top: 48px; right: 117px;" >
        <table width="100%";><tr><td style="text-align:center">پرسنل مورد نظر در اين دوره دارای مقدار است </td></tr><tr><td style="text-align:center">براي &nbsp;<span style="color:#009933">ايجاد</span> آيتم جديد گزينه &nbsp;<span style="color:#009933">ايجاد</span> را انتخاب کنيد</td></tr>
        <tr><td style="text-align:center">براي&nbsp;<span style="color:#009933">ويرايش</span>،آيتمي را انتخاب کنيد و  گزينه &nbsp;<span style="color:#009933">ويرايش</span> را بزنيد</td></tr>
        <tr><td style="text-align:center">
            <table id="ItemTable" style="border: 1px ridge #000000">
                <tr>
                    <td class="CssHeaderStyle" style="width:20px">
                    </td>
                    <td class="CssHeaderStyle" style="width:80px">مقدار
                    </td>
                    <td class="CssHeaderStyle" style="width:250px">توضيحات
                    </td>
                </tr>
            </table>
        </td></tr>
        <tr><td style="text-align:center"><input id="BtnNewItem" type="button" style="width:80px" class="CssHeaderStyle" value="ايجاد" onkeydown="OnkeyDownModal(this)" onclick="onclickBtnNewItem()" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="BtnEditItem" style="width:80px"  class="CssHeaderStyle" onkeydown="OnkeyDownModal(this)"  type="button" value="ويرايش" onclick="onclickBtnEditItem()"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input style="width:80px" id="BtnCloseItem" class="CssHeaderStyle" type="button" value="بستن" onkeydown="OnkeyDownModal(this)"  onclick="onclickBtnCloseItem()" /></td></tr></table>
    </div>

    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
       
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmitRefresh" runat="server" OnClick="BtnSubmitRefresh_Click" />

         <asp:Button ID="BtnSendToExcel" runat="server" OnClick="BtnSendToExcel_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnRefreshPersonSubmit" runat="server" OnClick="BtnRefreshPersonSubmit_Click" />
        <input type="hidden" id="txtMenuItemID" runat="server" />
        <input type="hidden" id="txtFlagAccess" runat="server" />
        <!---------------------------------------------------------------------------------------------------------->
        <input type="text" id="TemptxtPersonCode" name="TemptxtPersonCode" runat="server" />
        <input type="text" id="TemptxtPeriodID" name="TemptxtPeriodID" runat="server" />
       
        <input type="text" id="TemptxtCreditType" name="TemptxtCreditType" runat="server" />
        <input type="text" id="TmpValueType" name="TmpValueType" runat="server" />
        <input type="text" id="txtValueSave" name="txtValueSave" runat="server" />
         <input type="text" id="txtWRID" name="txtWRID" runat="server" />
         <input type="text" id="txtCreditType" name="txtCreditType" runat="server" />
         <input type="text" id="txtShowDate" name="txtShowDate" runat="server" />
         <input type="text" id="txtSDate" name="txtSDate" runat="server" />
         <input type="text" id="txtEDate" name="txtEDate" runat="server" />
        <!---------------------------------------------------------------------------------------------------------->
         <input type="text" id="ModalPCode" name="ModalPCode" runat="server" />
          <input type="text" id="ModalName" name="ModalName" runat="server" />
           <input type="text" id="ModalCredit" name="ModalCredit" runat="server" />
            <input type="text" id="ModalWPID" name="ModalWPID" runat="server" />
             <input type="text" id="ModalValue" name="ModalValue" runat="server" />
        <!------------------------------------------------------------------------>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtDelXml" name="txtDelXml" runat="server" />
        <input type="text" id="txtSaveXML" name="txtSaveXML" runat="server" />
       
        <input type="text" id="SaveDeleteItem" name="SaveDeleteItem" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtXmlValueType" name="txtXmlValueType" runat="server" />
        <input type="text" id="txtXmlValueTypeSearch" name="txtXmlValueTypeSearch" runat="server" />
        <input type="text" id="txtDayLength" name="txtDayLength" runat="server" />
        <asp:ScriptManager ID="ScriptManager" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="txtXMLGrid" runat="server" />
                <asp:HiddenField ID="Totalpage" runat="server" />
                <asp:HiddenField ID="txtAlert" runat="server" />
                <asp:HiddenField ID="txtCurPage" runat="server" />
                <asp:HiddenField ID="txtValidate" runat="server" />
                <asp:HiddenField ID="txtSearch" runat="server" />
                <asp:HiddenField ID="lblFrom" runat="server" />
                <asp:HiddenField ID="lblTo" runat="server" />
                <asp:HiddenField ID="lblTotal" runat="server" />
                 <input type="text" id="SaveResult" name="SaveResult" runat="server"  style="display:none"/>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
    <!------------------------------------------------------------------------------------------------------------------>
    <table id="BaseTable" style="width: 100%;" class="TableBase">
        <!--------------------------------آيتم های جستجو----------------------------------------------------------->
        <tr style="width: 100%;" align="center" valign="top">
            <td align="center" style="width: 100%" valign="top">
                <table cellpadding="1" cellspacing="0">
                    <tr>
                        <td>
                            پرسنلي:
                        </td>
                        <td>
                            <input id="txtPersonCodeSearch" runat="server" name="txtPersonCodeSearch" onblur="onblurtxtPersonCode(this)"
                                onkeydown="OnKeyDownInt(this)" style="width: 80px" type="text" class="TxtControls" />
                        </td>
                        <td>
                            نام :
                        </td>
                        <td  align="center">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <input type="text" id="PersonNameSearch" name="PersonNameSearch" runat="server" style="width: 100px"
                                        onblur="onblurtxtPersonNameSearch()" class="TxtControls" />
                                    <input id="ImgRefreshPersonSearch" name="ImgRefreshPersonSearch" class="HeaderStyle"
                                        onclick="onClickImgRefreshPersonSearch(this)" style="width: 20px; cursor: pointer;
                                        height: 22px;" type="button" value="..." />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnRefreshPersonSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                         <td>واحد سازماني:
                        </td>
                        <td><select runat="server" id="CmbDept" class="TxtControls" style="width:120px"></select>   </td>
                        <td>
                            دوره:
                        </td>
                        <td>
                            <select id="CmbPeriodSearch" style="width: 100px;" name="CmbPeriodSearch" runat="server"
                                onchange="javascript:$get(MasterObj+'CmbPeriod').value=this.value" class="TxtControls">
                                <option></option>
                            </select>
                        </td>                       
                        <td>
                            نوع مجوز:
                        </td>
                        <td>
                            <select id="CmbCreditTypeSearch" runat="server" name="CmbCreditTypeSearch" style="width: 100px"
                                class="TxtControls" onchange="RefreshTop()">
                                <option></option>
                            </select>
                        </td>
                        <td>مقدار</td>
                        <td>
                         <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                    <select style="width:95px" id="CmbValueTypeSearch" onkeydown="onKeyDownEnter(this)" class="TxtControls" runat="server" ><option></option></select>
                     </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmitRefresh" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
                    </td>                       
                    </tr>
                </table>
            </td>
        </tr>
        <!--------------------------------نوار ابزار ----------------------------------------------------------->
        <tr align="center" valign="top" style="width: 100%;">
            <td align="center" valign="top">
                <table style="width: 90%;">
                    <tr style="width: 90%;">
                        <td>
                            <uc1:ToolBar ID="OToolBar" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <!--------------------------------گريد----------------------------------------------------------->
        <tr style="width: 100%;" align="center" valign="top">
            <td align="center" valign="top" style="width: 100%; height: 80%">
                <table style="width: 90%; height: 40%">
                    <tr style="width: 100%;">
                        <td style="width: 100%; height: 70%" valign="top">
                            <div>
                                <table id="XTabTable_Header" style="width: 100%; height: 26px;" onmousedown="onclickgrdXTabTable(this)">
                                    <thead id="Header1" style="display: inline">
                                        <tr id="TrHead" align="center" valign="top" style="width: 100%" valign="top">
                                        <td align="center" class="CssHeaderStyle" style="width: 40px;">
                                            روند
                                        </td>
                                            <td align="center" class="CssHeaderStyle" style="width: 10%">
                                                شماره پرسنلي
                                            </td>
                                            <td align="center" class="CssHeaderStyle" style="width: 18%;">
                                                نام و نام خانوادگي
                                            </td>
                                            <td align="center" class="CssHeaderStyle" style="width: 15%;">
                                                نوع مجوز
                                            </td>
                                            <td align="center" class="CssHeaderStyle" style="width: 10%;">
                                                دوره
                                            </td>                                          
                                            <td align="center" class="CssHeaderStyle" style="width: 10%;">
                                                مدت
                                            </td>
                                            <td align="center" class="CssHeaderStyle" style="width: 20%;">
                                                توضيحات
                                            </td>
                                             <td align="center" class="CssHeaderStyle" style="width: 20%;">
                                                واحد سازماني
                                            </td>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                <div id="DivLog" style="width: 100%; height: 80px; display: none; vertical-align: bottom">
                    <table style="width: 100%; height: 80px;">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td colspan="7">
                                            <hr />
                                            <img id="ImgClose" onclick="onclickImgClose()" src="../../App_Utility/Images/Icons/close1.png"
                                                border="0" />
                                        </td>
                                    </tr>
                                </table>
                                <div style="height: 80px; position: relative;" class="BlueScroll">
                                    <table style="width: 100%;">
                                        <tr style="width: 100%;">
                                            <td style="width: 100%;">
                                                <table id="LogTable" style="width: 100%;">
                                                    <tr align="center" valign="top" style="width: 100%">
                                                        <td style="width: 12%" class="RedBackGround">
                                                            شماره پرسنلي
                                                        </td>
                                                        <td style="width: 18%" class="RedBackGround">
                                                            نام و نام خانوادگي
                                                        </td>
                                                        <td style="width: 15%" class="RedBackGround">
                                                            نوع مجوز
                                                        </td>
                                                        <td style="width: 15%" class="RedBackGround">
                                                            دوره
                                                        </td>
                                                        <td style="width: 10%" class="RedBackGround">
                                                            مدت
                                                        </td>
                                                        <td style="width: 20%" class="RedBackGround">
                                                            توضيحات
                                                        </td>
                                                        <td style="width: 10%" class="RedBackGround">
                                                            وضعيت:
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <!-------------------------------آيتم های به روز رسانی و اضافه کردن----------------------------------------------------------->
        <tr style="width: 100%; height: 140px;" align="center" valign="top">
            <td align="center" valign="top">
                <table style=" height: 106px; text-align: justify;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td colspan="8" align="center">
                            <hr class="CssHR" style="width: 60%; height: 2px" size="2"/>
                        </td>
                    </tr>
                    <tr align="center">
                        <td align="right">
                            <input id="ChkPrsId" name="ChkPrsId" runat="server" type="checkbox" />ش پرسنلي:
                        </td>
                        <td align="right">
                            <input id="txtPersonCode" runat="server" name="txtPersonCode" onblur="onblurtxtPersonCode(this)"
                                onkeydown="onKeyDownEnter(this);OnKeyDownInt(this)" style="width: 120px" type="text"
                                class="TxtControls" />
                        </td>
                        <td align="right">
                           &nbsp; نام :
                        </td>
                        <td >
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div style="display: none">
                                        <asp:HiddenField ID="txtAlert1" runat="server" />
                                    </div>
                                    <input type="text" id="PersonName" runat="server" name="PersonName" onkeydown="onKeyDownEnter(this)"
                                        onblur="onblurtxtPersonName()" style="width: 120px" onclick="return PersonName_onclick()"
                                        class="TxtControls" />
                                    <input id="ImgRefreshPerson" class="HeaderStyle" onclick="onClickImgRefreshPersonSearch(this)"
                                        style="width: 25px; cursor: pointer; height: 22px" type="button" value="..." />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnRefreshPersonSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>                     
                        <td align="right">
                            <input id="ChkCreditType" name="ChkCreditType" runat="server" type="checkbox" />
                            نوع مجوز:
                        </td>
                        <td align="right">
                            <select id="CmbCreditType" name="CmbCreditType" style="width: 120px" 
                                runat="server" onkeydown="onKeyDownEnter(this)" class="TxtControls" onchange="Refresh()">
                                <option></option>
                            </select>
                        </td>
                         <td>
                            <input id="ChkPeriod" name="ChkPeriod" runat="server" type="checkbox" />دوره:
                        </td>
                        <td align="right">
                            <select id="CmbPeriod" name="CmbPeriod" style="width: 100px" runat="server" onkeydown="onKeyDownEnter(this)"
                                class="TxtControls">
                                <option></option>
                            </select>
                        </td>
                        
                         <td><input id="ChkValueType" name="ChkValueType" runat="server" type="checkbox" />مقدار&nbsp;</td>
                         <td>
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                         <select style="width:70px" id="CmbValueType" onchange="onchangeCmbValueType(this)" onkeydown="onKeyDownEnter(this)" class="TxtControls" runat="server" ><option></option></select>
                          </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmitRefresh" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel> </td>
                        <td align="right" colspan="1">
                            <input id="ChkValue" name="ChkValue" runat="server" type="checkbox" />                           
                            <input id="txtValue" runat="server" name="txtPersonCode0" onblur="onblurtxtValue(this)"
                                onkeydown="onKeyDownEnter(this);OnKeyDownTimeNew(this)" style="width: 50px" type="text"
                                class="TxtControls" />
                                 
                        </td>
                        
                    </tr>
                    <tr align="right">
                       
                       <td id="tdChkSDate" runat="server"><input id="ChkSDate" name="ChkSDate" runat="server" type="checkbox" />از تاریخ:</td><td id="tdKCalSDate" runat="server">
                        <uc3:KCalendar ID="KCalSDate" runat="server" />
                        </td>
                       <td id="tdChkEDate" runat="server"> <input id="ChkEDate" name="ChkEDate" runat="server" type="checkbox" />تا تاریخ:&nbsp;</td><td id="tdKCalEDate" runat="server">
                        <uc3:KCalendar ID="KCalEDate" runat="server" />
                        </td>
                        <td align="right">
                            <input id="ChkDescr" name="ChkDescr" runat="server" type="checkbox" />
                            توضيحات:
                        </td>
                        <td colspan="6" align="right" valign="top">
                            <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Width="100%" onkeydown="onKeyDownEnter(this)"
                                Height="30px" CssClass="TxtControls"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------------------------------------------->
    <script src="../../App_Utility/Scripts/DataEntry/DefineWPResult.js?v=4.1" type="text/javascript"></script>
</asp:Content>
