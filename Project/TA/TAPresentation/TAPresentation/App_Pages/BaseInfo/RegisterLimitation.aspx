<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="RegisterLimitation.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.RegisterLimitation"
    ValidateRequest="false" Title="----------------------------------------------------------------محدوديت ثبت/تاييد مجوزها----------------------------------------------------------------------------------------" %>
    
 <%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc3" %>   
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <table style="width: 497px; margin-left: 3px;">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server"  />
            </td>
        </tr>
        <tr>
            <td>
                <input type="checkbox" id="chkSelectedCode" runat="server" onclick="OnClickChkSelectedGroup()" />نمايش
                کدهاي انتخاب شده
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <fieldset style="width: 400px; height: 300px; text-align: center;">
                            <legend><font style="font-size: 14px; color: #FF0066; font-weight: bold; font-family: 'KasraB Traffic';">
                                ليست کدها</font></legend>
                                <div id="GridViewSelectCode" >
                            <cc2:KasraGrid ID="GrdSelectCode" runat="server" OnRowDataBound="Grid_RowDataBound">
                            </cc2:KasraGrid>
                        </div>
                        </fieldset>
                        <asp:HiddenField ID="txtSDate" runat="server" />
                        <asp:HiddenField ID="txtEDate" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                         <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="lblFrom" runat="server" />
                        <asp:HiddenField ID="lblTo" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="lblTotal" runat="server" />
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtOrderString" runat="server" />
                        <asp:HiddenField ID="CurPage" runat="server" />
                        <asp:HiddenField ID="txtXmlChecked" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 666px; height: 86px">
                    <tr>
                        <td >
                            نام محدوديت :</td>
                        <td  colspan="2" >
                            <input id="txtScriptName" type="text" name="txtScriptName" runat="server" class="TxtControls" style="width: 300px"/></td>
                        <td >
                            &nbsp;</td>
                        <td >
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td >
                            محدوده اعتبار :
                        </td>
                        <td >
                            از تاريخ
                        </td>
                        <td  >
                            <uc3:KCalendar ID="KCalSDate" runat="server" /></td>
                        <td >
                            تا تاريخ
                        </td>
                        <td >
                            <uc3:KCalendar ID="KCalEDate" runat="server" /></td>
                    </tr>
                    <tr>
                        <td  >
                            بازه زماني مجوز :
                        </td>
                        <td >
                            &nbsp;
                            <input id="rbtnIns1" type="radio" checked name="rbtnIns" runat="server" onclick="OnClickOP(this)"/> </td>
                        <td >
                            <input id="txtIns1" type="text" name="txtIns1" runat="server" onkeydown="OnKeyDownInt()" class="TxtControls" style="width: 50px"/> روز از زمان وقوع</td>
                        <td >
                            &nbsp;<input id="rbtnIns2" type="radio" name="rbtnIns" runat="server" onclick="OnClickOP(this)"/> </td>
                        <td >
                            <input id="txtIns2" type="text" name="txtIns2" runat="server" onkeydown="OnKeyDownInt()" class="TxtControls" style="width: 50px" disabled/>
                            روز هر ماه
                        </td>
                    </tr>
                    <tr>
                        <td >
                            زمان کنترل :
                        </td>
                        <td colspan="2"  >
                            &nbsp;<input id="rbtnRegisterStep" type="radio" name="rbtnStep" runat="server" checked/>زمان ورود&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input id="rbtnConfirmStep" type="radio" name="rbtnStep" runat="server" />
                            زمان تاييد</td>
                        <td >
                            &nbsp; </td>
                        <td >
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="display: inline">
                <div style="display: none">
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
                    <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
                    <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
                    <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
                    <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                        runat="server" />
                    <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                        runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtGroupCode" runat="server" />
                    <input type="text" id="txtXml" runat="server" />
                    <input type="text" id="txtParamVal" runat="server" />
                     <input type="text" id="txtInstanceID" runat="server" />
                      <input type="text" id="txtScriptID" runat="server" />
                    <input type="text" id="txtSelectedCode" runat="server" />
                    <input type="text" id="txtAllowEdit" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    
 <script src="../../App_Utility/Scripts/BaseInfo/RegisterLimitation.js" type="text/javascript"></script>          
</asp:Content>