<%@ Page Title="--------------------------------------------------------------تعريف تلورانس-----------------------------------------------------------------------------"
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true"
    CodeBehind="ToleranceNew.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.ToleranceNew"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc4" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            از تاريخ :
                        </td>
                        <td>
                            <uc4:KCalendar ID="KCalSDate" runat="server" />
                        </td>
                        <td>
                            تا تاريخ :
                        </td>
                        <td>
                            <uc4:KCalendar ID="KCalEDate" runat="server" />
                        </td>
                        <td>
                            <input type="checkbox" id="ChkNextDay" onclick='OnClickChkNextDay(this)' runat="server" />متعلق
                            به روز بعد
                        </td>
                        <td>
                            <input type="checkbox" id="ChkLastDay" onclick='OnClickChkLastDay(this)' runat="server" />متعلق
                            به روز قبل
                        </td>
                    </tr>
                    <tr>
                        <td>
                            از ساعت :
                        </td>
                        <td>
                            <input type="text" class="TxtControls" onkeydown='OnKeyDownTime(this.value)' onblur='Timechk(this)'
                                style="width: 60" id="txtStime" runat="server" />
                        </td>
                        <td>
                            تا ساعت :
                        </td>
                        <td>
                            <input type="text" class="TxtControls" onkeydown='OnKeyDownTime(this.value)' onblur='Timechk(this)'
                                style="width: 60" id="txtEtime" runat="server" />
                        </td>
                        <td>
                            ساعت جايگزين :
                        </td>
                        <td>
                            <input type="text" class="TxtControls" onkeydown='OnKeyDownTime(this.value)' onblur='Timechk(this)'
                                style="width: 60" id="txtRtime" runat="server" />
                            شماره کارتخوان :
                            <input type="text" id="txtCardKhanNo" runat="server" class="TxtControls" style="width: 60" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            شيفت :
                        </td>
                        <td>
                            <asp:DropDownList class="TxtControls" runat="server" ID="cmbSchedule" Width="120px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            گروه :
                        </td>
                        <td>
                            <asp:DropDownList class="TxtControls" runat="server" ID="cmbGroup" Width="140px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            پرسنلي :
                        </td>
                        <td>
                            <uc4:ComboBox ID="CmbPerson" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ساختار :
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <asp:DropDownList class="TxtControls" ID="cmbStructure" runat="server" Width="120px"
                                                    onchange="onchangecmbStructure()">
                                                </asp:DropDownList>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>
                                        <input id="BtnShowStruct" name="BtnShowStruct" class="CssHeaderStyle" style="width: 23px;
                                            cursor: pointer; height: 20px;" type="button" value="..." onclick="onClickselectStructure()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            زيرساختار :
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList class="TxtControls" runat="server" ID="cmbDetailCollection" Width="140px">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="2">
                            شرح :
                        </td>
                        <td rowspan="2" colspan="3">
                            <textarea id="txtDesc" runat="server" class="TxtControls" style="width: 350; height: 50"></textarea>
                        </td>
                        <td>
                            وضعيت :
                        </td>
                        <td>
                            <input type="radio" checked="true" name="Active" id="rdbActive" runat="server" />فعال
                            <input type="radio" name="Active" id="rdbNoActive" runat="server" />غيرفعال
                        </td>
                    </tr>
                    <tr>
                        <td>
                            نوع تردد :
                        </td>
                        <td>
                            <input type="checkbox" id="chkIn" runat="server" />ورود
                            <input type="checkbox" id="chkOut" runat="server" />خروج
                        </td>
                    </tr>
                </table>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtXMLSave" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtDetailCollectionID" name="txtDetailCollectionID" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" runat="server" id="txtUpdateXml" />
        <input type="text" id="txtxmlDetailCollection" runat="server" />
        <input type="text" id="txtDetailCollection" runat="server" />
        <input type="text" id="txtMultiStructure" runat="server" />
        <input type="text" id="txtStructure" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/Schedule/ToleranceNew.js" type="text/javascript"></script>
</asp:Content>
