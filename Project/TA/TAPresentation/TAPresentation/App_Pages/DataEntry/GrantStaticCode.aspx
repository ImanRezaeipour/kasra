<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="GrantStaticCode.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.GrantStaticCode" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"  TagPrefix="uc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <link href="../../App_Utility/Styles/FixGridHeader.css" type="text/css" rel="stylesheet" />
  <style>
  .DelClass
  {
      background-color:#d88179;
  }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="600" runat="server">
    </asp:ScriptManager>
    <table width="100%">
        <tr>   
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامتر هاي جستجو</legend>
                    <table>
                        <tr>
                            <td>
                                دوره :
                            </td>
                            <td colspan="2">
                                <asp:DropDownList ID="CmbWorkPeriod" name="CmbWorkPeriod" Width="145px" class="TxtControls"
                                    runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                کد ها :
                            </td>
                            <td>
                                <input class="TxtControls" id="txtEditableCode" runat="server" dir="rtl" type="text"
                                    style="width: 145px;" disabled="disabled" />
                            </td>
                            <td>
                                <input class='HeaderStyle' id="btnEditableCode" onclick="onclickbtnEditableCode()"
                                    style="width: 25px; cursor: pointer; height: 22px" type="button" runat="server"
                                    value='...' title='انتخاب کد' />
                            </td>
                            <td>
                                کدهاي نمايشی :
                            </td>
                            <td>
                                <input class="TxtControls" id="txtViewCode" runat="server" dir="rtl" type="text"
                                    style="width: 145px;" disabled="disabled" />
                            </td>
                            <td>
                                <input class='HeaderStyle' id="BtnViewableCode" onclick="onclickBtnViewableCode()"
                                    style="width: 25px; cursor: pointer; height: 22px;" type="button" runat="server"
                                    value='...' title='انتخاب کد'  />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td align="center">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <input type="checkbox" runat="server" id="chkSelected" onclick="OnClickChkShowSelected()" />نمایش انتخاب شده ها
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="GridViewCountainer" class="DivStyle" style="vertical-align: top; float: right;
                            width: 96%; height: 480px; overflow: auto" align="right">
                            <asp:GridView ID="GrdGrantCode" runat="server" AutoGenerateColumns="true" HeaderStyle-CssClass="CssHeaderStyle"
                                HeaderStyle-Height="30px">
                            </asp:GridView>
                        </div>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtSubmit" runat="server" />
                        <asp:HiddenField ID="txtMode" runat="server" />
                        <asp:HiddenField ID="txtXmlSave" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    
    </table>
    <div id="DivDesc" style="background-color: White; border: 2px solid Black; display: inline;
        position: absolute; top: 200; left: 200;">
        <table cellpadding="0" cellspacing="0">
            <tr style="background-color: Black; height: 10px">
                <td style='width: 17px; height: 10px'>
                    <img src="/FrmPresentation/App_Utility/Images/Icons/close1.png" style="background-color: Black;"
                        onclick="onclickBtnCloseDesc()" width="15px" height="15px" />
                </td>
                <td style="width: 150px; background-color: Black; color: White">
                    -------توضيحات-------
                </td>
            </tr>
            <tr>
                <td colspan="2" valign="top" align="center">
                    <asp:TextBox ID="txtDescript" CssClass="TxtControls" onblur="onblurtxtDescript()"
                        Width="167" Height="150" TextMode="MultiLine" Wrap="true" Style="direction: rtl"
                        runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtEditableCodeStr" name="txtEditableCodeStr" runat="server" />
        <input type="text" id="txtViewableCodeStr" name="txtViewableCodeStr" runat="server" />
        <input type="text" id="txtMemberXML" name="txtMemberXML" runat="server" />
        <input type="text" id="txtExcelXml" name="txtExcelXml" runat="server" />
        <input type="text" id="txtCodeXml" name="txtCodeXml" runat="server" />
        <input type="text" id="txtRepeatedItem" name="txtRepeatedItem" runat="server" />
        <input type="text" id="txtDirectSend" name="txtDirectSend" runat="server" />
        <input type="text" id="txtTotalPage" name="txtTotalPage" value="0" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <script src="../../App_Utility/Scripts/DataEntry/GrantStaticCode.js" type="text/javascript"></script>
        <script src="/TAPresentation/App_Utility/Scripts/jquery-ui-1.8.custom.min.js" type="text/javascript"></script>
    </div>
       <div align="center"  id="DivPopup" style="border: 2px groove #000000;display:none;text-align:center; position:absolute; width:700px;top:300px; left:100px; height:450px; background-color:White; top: 48px; right: 117px; overflow: auto" >
        <table width="100%">
            <tr>
                <td style="text-align: center">
                    پرسنل هاي زير در اين دوره مقدار دارند
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    براي &nbsp;<span style="color: #009933">حذف</span> آيتم های قبلی  &nbsp;<span
                        style="color: #009933">سطر مورد نظر</span> را انتخاب کنيد
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    براي&nbsp;<span style="color: #009933">ثبت عمليات</span>،  گزينه
                    &nbsp;<span style="color: #009933">اعمال تغييرات</span> را بزنيد
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <table id="RepeatedDataTable" style="border: 1px ridge #000000;vertical-align: top; float: right;overflow: auto" >
                        <tr>
                            <td class="CssHeaderStyle" style="width: 30px">
                             <%--   <input type="checkbox" onclick="OnClickHeaderChk(this)" />--%>
                            </td>
                            <td class="CssHeaderStyle" style="width: 50px">
                                پرسنلي
                            </td>
                            <td class="CssHeaderStyle" style="width: 150px">
                                نام
                            </td>
                            <td class="CssHeaderStyle" style="width: 100px">
                                کد
                            </td>
                            <td class="CssHeaderStyle" style="width: 50px">
                                مقدار
                            </td>
                            <td class="CssHeaderStyle" style="width: 250px">
                                توضيحات
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="TrFooter">
                <td align="center" valign="top" align="right">
                    <table id="TblFooter" align="right" class="CssHeaderPageMain" style="width:95%; border-color: Gray; border-style: solid;
                        border-width: 1px">
                        <tr>
                            <td>
                                <img src="/FrmPresentation/App_Utility/Images/Icons/active_last.gif" onclick="OnClickBtnLast()"
                                    style="cursor: pointer; vertical-align: middle" title='آخرين' />
                                <img src="/FrmPresentation/App_Utility/Images/Icons/active_forward.gif" onclick="OnClickBtnNext()"
                                    id="BtNext" style="cursor: pointer; vertical-align: middle" title='بعدي' />
                                <input type="text" onchange="OnBlurtxtCurPage(this)" style="width: 30px; alignment: center;
                                    text-align: center; vertical-align: middle" id="txtCurPage" onfocus="onfocusItem(this)"
                                    class="TxtControls" />
                                از <span style="width: 30px" id="TotalPage">0</span>
                                <img src="/FrmPresentation/App_Utility/Images/Icons/active_back.gif" onclick="OnClickBtnPrv()"
                                    id="BtnPrv" style="cursor: pointer; vertical-align: middle" title='قبلي' />
                                <img src="/FrmPresentation/App_Utility/Images/Icons/active_first.gif" onclick="OnClickBtnFirst()"
                                    style="cursor: pointer; vertical-align: middle" title='اولين' />
                                <span style="width: 30px" id="txtFrom">0</span> تا <span style="width: 30px" id="txtTo">
                                    0</span> از<span style="width: 30px" id="txtTotalRow">0</span>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <input id="BtnSaveChange" type="button" style="width: 80px" class="CssHeaderStyle" value="اعمال تغييرات"
                        onkeydown="OnkeyDownModal(this)" onclick="onclickBtnSaveChanges()" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input style="width: 80px" id="BtnCloseItem" class="CssHeaderStyle"
                        type="button" value="بستن" onkeydown="OnkeyDownModal(this)" onclick="onclickBtnCloseItem()" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
