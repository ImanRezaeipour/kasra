<%@ Page  Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="DifinitionDetailCollection.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.DifinitionDetailCollection"
    ValidateRequest="false"
    Title="------------------------------------------------------------------------------------------------------------------------------"
     %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td id="tdToolbar">
                <uc1:ToolBar ID="OToolBar" Paging=1 runat="server" />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

                <script type="text/javascript" language="javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    returnValue = 0;

                    function BeginRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                    }

                    function EndRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
//                        if ($get(MasterObj + "txtAlert").value != "") {
//                            if ($get(MasterObj + "txtAlert").value == "SaveFail") {
//                                alert('به علت تداخل تاريخ ها امکان ذخيره نمي باشد')
//                                return
//                            }
//                            else {
//                                SetMsg($get(MasterObj + "txtAlert").value);
//                                returnValue = 1
//                            }
                        //                        }
                        if ($get(MasterObj + "txtSubmit").value == "Save") {
                            if ($get(MasterObj + "txtValidate").value == "1") {
                                SetMsg($get(MasterObj + "txtAlert").value);
                                returnValue=1
                            }
                            else
                                alert($get(MasterObj + "txtAlert").value);
                        }

                        $get(MasterObj + "txtSubmit").value = "";
                        $get(MasterObj + "txtAlert").value = "";
                        newrowindex = 0
                        LastSelectedRow = null
                        lastValue = ""
                        doNothingFlag = 0
                        ID = 0
                        NameValue = ""
                        DescValue = ""
                        Acronym = ""
                        txtTimesStructure = ""
                        Mode = 0
                    }
                </script>

            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            تاريخ شروع
                        </td>
                        <td>
                            <uc3:KCalendar ID="KCalSDate" runat="server" />
                        </td>
                        <td>
                            تاريخ خاتمه
                        </td>
                        <td>
                            <uc3:KCalendar ID="KCalEDate" runat="server" />
                        </td>
                    </tr>
                    <%--<tr>
                        <td>
                            زمان نرمال شروع
                        </td>
                        <td>
                            <input type="text" class="TxtControls" onkeydown='OnKeyDownTime(this.value)' onblur='Timechk(this)'
                                style="width: 60" id="txtNormalStime" runat="server" />
                        </td>
                        <td>
                            زمان نرمال خاتمه
                        </td>
                        <td>
                            <input type="text" class="TxtControls" onkeydown='OnKeyDownTime(this.value)' onblur='Timechk(this)'
                                style="width: 60" id="txtNormalEtime" runat="server" />
                        </td>
                    </tr>--%>
                    <tr>
                        <td valign="top">
                            شرح
                        </td>
                        <td colspan="3">
                            <input style="z-index: 0; width: 331px; height: 60px" id="txtDesc" class="TxtControls"
                                name="txtDesc" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align='center'>
                            <table style="width: 500px" dir='rtl'>
                                <tr>
                                    <td class="CssHeaderStyle" align='center' style='width: 90px'>
                                        ساعت شروع
                                    </td>
                                    <td class="CssHeaderStyle" align='center' style='width: 90px'>
                                        ساعت خاتمه
                                    </td>
                                    <td class="CssHeaderStyle" align='center' style='width: 150px'>
                                        نوع ساختار
                                    </td>
                                    <td class="CssHeaderStyle" align='center' style='width: 110px'>
                                        متعلق به
                                    </td>
                                    <td class="CssHeaderStyle" align='center' style='width: 72px'>
                                    </td>
                                </tr>
                            </table>
                            <div style="overflow: auto; width: 520px; height: 300px">
                                <table id="grdSub" style="width: 500px;">
                                </table>
                            </div>
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
                             <asp:HiddenField ID="txtValidate" runat="server" /> 
                             <input type="text" id="txtDetailCollectionID" runat="server" />                           
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
                    <input type="text" id="txtXml" name="txtXml" runat="server" />
                    <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtPageID" name="txtPageID" runat="server" />
                    <input type="text" id="txtStructureID" runat="server" />
                    <input type="text" id="txtDetailType" runat="server" />
                    <input type="text" id="txtMode" runat="server" />
                    <input type="text" id="txtReport" runat="server" />
                    <select id="SelDetailType" runat="server">
                        <option></option>
                    </select>
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/Schedule/DifinitionDetailCollection.js">
               
    </script>

</asp:Content>
