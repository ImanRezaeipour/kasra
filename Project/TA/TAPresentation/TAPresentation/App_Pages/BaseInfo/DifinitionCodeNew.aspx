<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" ValidateRequest="false" CodeBehind="DifinitionCodeNew.aspx.cs"
    Inherits="TAPresentation.App_Pages.BaseInfo.DifinitionCodeNew" Title="-------------------------------------------------------مشخصات کد---------------------------------------------------------------------------" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .FieldsetStyle1
        {
            width: 620px;
            height: 100px;
            text-align: center;
        }
        .FieldsetStyle2
        {
            width: 620px;
            height: 140px;
            text-align: center;
        }
        .FieldsetStyle3
        {
            width: 620px;
            height: 120px;
            text-align: center;
        }
        .FieldsetStyle4
        {
            width: 620px;
            height: 100px;
            text-align: center;
        }
        .FieldsetStyle5
        {
            width: 620px;
            height: 40px;
            text-align: center;
        }
        .LengedStyle
        {
            font-size: 14px;
            color: #FF0066;
            font-weight: bold;
            font-family: 'KasraB Traffic';
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table width="90%">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" PageID="1309" PageName="DifinitionCodeNew.aspx" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td>
                            <fieldset class="FieldsetStyle1">
                                <legend><font class="LengedStyle"></font></legend>
                                <table>
                                    <tr>
                                        <td>
                                            کد آيتم :
                                        </td>
                                        <td>
                                            <input class="TxtControls" type="text" id="txtUserCode" runat="server" style="width: 160px"
                                                disabled="true" />
                                        </td>
                                        <td>
                                            نام آيتم :
                                        </td>
                                        <td>
                                            <input class="TxtControls" type="text" id="txtCodeName" onkeydown="OnKeyDownFaEn(this)"
                                                runat="server" style="width: 205px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                             ماهيت :
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cmbCodeNature" runat="server" Height="16px" Width="160px" CssClass="TxtControls">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            کليد ميانبر :
                                        </td>
                                        <td>
                                            <input class="TxtControls" type="text" id="txtShortKey" runat="server" style="width: 205px" />
                                        </td>
                                    </tr>
                                      <tr>
                                        <td>
                                            مخفف :
                                        </td>
                                        <td>
                                            <input class="TxtControls" type="text" id="txtAcronym" runat="server" style="width: 160px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            شرح :
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtDesc" runat="server" class="TxtControls" Width="460px" Height=" 50px"
                                                TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                            <fieldset class="FieldsetStyle2">
                                <legend><font class="LengedStyle"></font></legend>
                                <table align="right">
                                    <tr>
                                        <td>
                                            <fieldset class="FieldsetStyle3">
                                                <legend><font class="LengedStyle">
                                                    <input type="checkbox" onclick="onclickchkCombine()" id="ChkCombine" />ترکيبي</font></legend>
                                                <table align="right">
                                                    <tr>
                                                        <td>
                                                            کد تعدادي :
                                                        </td>
                                                        <td>
                                                            <uc2:ComboBox ID="CmbCode1" runat="server" />
                                                        </td>
                                                        <td>
                                                            کد ساعتي :
                                                        </td>
                                                        <td>
                                                            <uc2:ComboBox ID="CmbCode2" runat="server" />
                                                        </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td>
                                                            شرح :
                                                        </td>
                                                        <td colspan="3">
                                                            <asp:TextBox ID="txtCombineDesc" runat="server" class="TxtControls" Width="450px"
                                                                Height="50px" TextMode="MultiLine"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset class="FieldsetStyle4">
                                                <legend><font class="LengedStyle">
                                                    <input type="checkbox" onclick="onclickchkFormule()" id="chkFormule" />فرمولي</font></legend>
                                                <table align="right">
                                                    <tr>
                                                        <td>
                                                            مرحله اجرا :
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="cmbStep" runat="server" Height="16px" Width="180px" value="0"
                                                                CssClass="TxtControls" OnChange="OnChangeCmbStep()">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            اولويت :
                                                        </td>
                                                        <td>
                                                            <input type="text" id="txtPriority" class="TxtControls" style="width: 170px" runat="server"
                                                                value="1" />
                                                        </td>
                                                    </tr>
                                                    <%-- <tr>
                                                        <td>
                                                            دسته بندی :
                                                        </td>
                                                        <td colspan="3">
                                                            <asp:DropDownList ID="cmbCategoryFormule" runat="server" Height="16px" Width="150px"
                                                                value="0" CssClass="TxtControls">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>--%>
                                                    <tr>
                                                        <td valign="top">
                                                            فرمول :
                                                        </td>
                                                        <td colspan="3">
                                                            <textarea dir="ltr" id="txtFormule" onkeydown="OnKeyDownCode(this)" runat="server"
                                                                class="TxtControls" style="width: 430; height: 50">
                                                          </textarea>
                                                            <input id="btnSelectCode" class="HeaderStyle" onclick="onClickbtnSelectCode()" style="width: 25px;
                                                                cursor: pointer; height: 22px;" type="button" value="..." />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                             شرح :
                                                        </td>
                                                        <td colspan="3">
                                                            <asp:TextBox ID="txtDescription" runat="server" class="TxtControls" Width="450px"
                                                                Height="50px" TextMode="MultiLine"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset class="FieldsetStyle4">
                                                <legend><font class="LengedStyle"></font></legend>
                                                <table align="right">
                                                    <tr>
                                                        <td >
                                                             تاريخ شروع :
                                                        </td>
                                                        <td align="right" style="width: 275px">
                                                            <uc2:KCalendar ID="KCalSDate" runat="server" />
                                                        </td>
                                                        <td>
                                                            تاريخ پايان :
                                                        </td>
                                                        <td>
                                                            <uc2:KCalendar ID="KCalEDate" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td >
                                                            دسته بندي :
                                                        </td>
                                                        <td colspan="3">
                                                            <asp:DropDownList ID="cmbCategory" runat="server" Height="16px" Width="150px" value="0"
                                                                CssClass="TxtControls">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr> <tr>
                                                    <td valign="top" style="display:none" >
                                                         شروط :
                                                    </td>
                                                    <td colspan="3"  style="display:none">
                                                        <textarea dir="ltr" id="txtCondition" runat="server" cols="55" rows="3" style="scrollbar-highlight-color: white;
                                                            overflow: auto; scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;
                                                            position: relative;"  ></textarea>
                                                    </td>
                                                </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset class="FieldsetStyle5">
                                                <legend><font class="LengedStyle"></font></legend>
                                                <table align="right">
                                                    <tr>
                                                        <td>
                                                            وضعيت :
                                                        </td>
                                                        <td>
                                                            <input type="radio" checked="true" name="rdbActive" id="rdbActive" runat="server" />فعال
                                                            <input type="radio" name="rdbActive" id="rdbMActive" runat="server" />نيمه فعال
                                                            <input type="radio" name="rdbActive" id="rdbNoActive" runat="server" />غير فعال
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
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtAlertStatus" runat="server" />
                            <asp:HiddenField ID="txtXMLSave" runat="server" />
                            <input type="text" id="txtScriptID" runat="server" />
                            <input type="text" id="txtCodeId" runat="server" />
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
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtXml" name="txtXml" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtGroupCodeXML" runat="server" />
                    <input type="text" id="txtSystem" runat="server" />
                    <input type="text" id="txtTmpUserCode" runat="server" />
                    <input type="text" id="txtScriptGroups" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script language="javascript" src="../../App_Utility/Scripts/BaseInfo/DifinitionCodeNew.js?v=3"
        type="text/javascript"></script>
</asp:Content>

