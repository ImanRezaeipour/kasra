<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="IndividualGrantNew.aspx.cs" Inherits="TAPresentation.App_Pages.Cardex.IndividualGrantNew"
    Title="" ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/Maskdiv.js"></script>

    <script language="javascript" src="../../App_Utility/Scripts/General.js" type="text/javascript"></script>

    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="IndividualGrantNew.aspx" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False"
                    ScriptMode="Release">
                </asp:ScriptManager>

                <script type="text/javascript" language="javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                    }

                    function EndRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                        var StrVal = $get(MasterObj + "txtSubmit").value
                        if (StrVal != "") {
                            if (StrVal == "ImgRefreshPerson") {

                                document.getElementById('ImgRefreshPerson').disabled = true;
                                document.getElementById('ImgRefreshPerson').style.cursor = "Normal"
                                document.getElementById('MaskedDiv').style.display = 'none';
                                document.getElementById('ModalPopupDiv').style.display = 'none';

                            }
                            if (StrVal == "Save") {
                                if ($get(MasterObj + "txtAlert").value == 1) {
                                    $get(MasterObj + "txtAlert").value = "Save"
                                    SetMsg($get(MasterObj + "txtAlert").value);
                                }
                                else {
                                    alert('در اين محدوده فرد داراي رکورد مي باشد')
                                }

                            }
                            returnValue = 1
                        }
                        $get(MasterObj + "txtSubmit").value = "";
                    }
                </script>

            </td>
        </tr>
        
        <tr>
        
        <td>
            <table style="width:100%;">
                <tr>
                    <td class="style6">تاریخ اعمال:</td>
                    <td class="style4">
                                        <uc1:KCalendar ID="ActDate" runat="server" />
                                    </td>
                    <td class="style7">نوع کاردکس:</td>
                    <td>
                                        <asp:DropDownList ID="cmbCardex" runat="server" onchange="OnchangeCmbCardex()" Style="margin-right: 0px;
                                            width: 140px; margin-bottom: 0px;" Height="16px" DataTextField="Title" DataValueField="Val">
                                        </asp:DropDownList>
                                    </td>
                </tr>
                <tr>
                    <td colspan=4>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <table style="width: 593px">
                                        <tr>
                                            <td align="right" class="style3">
                                                دوره کاردکس:</td>
                                            <td class="style4" >
                                                <asp:DropDownList ID="cmbPeriod" runat="server" Style="margin-right: 0px;" DataTextField="Title"
                                                    DataValueField="Val" Height="16px" Width="140px">
                                                </asp:DropDownList>
                                            </td>
                                            <td class="style8" >
                                                نوع اعطا:</td>
                                            
                                            <td align="right" ><asp:DropDownList ID="cmbRation" runat="server" DataTextField="Title" DataValueField="Val"
                                                    Height="16px" Style="width: 140px; margin-right: 8px;">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                       
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmitChangeCmbCardex" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                   
                </tr>
                 <tr>
                                            <td align="right" class="style6">پرسنلی:</td>
                                            <td class="style4" >
                                                <input ID="txtPersonCode" runat="server" dir="rtl" name="txtPersonCode" 
                                                    onblur="OnBlurTxtPersonCode()" style="width: 94px" type="text" /></td>
                                            <td class="style7" >نام و نام خانوادگی:</td>
                                            <td align="right">
                                        <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:DropDownList onchange="OnChangeSelName()" ID="SelName" runat="server" Height="16px"
                                                    Width="173px" Style="margin-right: 0px">
                                                </asp:DropDownList>
                                                <img id="ImgRefreshPerson" alt="به روزرساني نام" style="cursor: pointer" onclick="onClickImgRefreshPerson()"
                                                    src="../../../FrmPresentation/App_Utility/Images/Icons/Refresh1.png" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ImgRefreshPersonSubmit" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                            </td>
                                        </tr>
                 <tr>
                                            <td align="right" class="style6">مقدار:</td>
                                            <td class="style4" >
                                        <input id="txtValueDay" onkeydown="OnKeyDownNum('integer',this.value)" style="width: 50px;
                                            height: 22px" type="text" size="5" name="Text4" runat="server">روز
                                        <input id="txtValueHour" onkeydown="OnKeyDownNum('integer',this.value)" onblur="Timechk(this)"
                                            style="width: 50px; height: 22px" type="text" size="5" name="Text2" runat="server">ساعت</td>
                                            <td class="style7" >توضيحات:</td>
                                            <td align="right">
                                        <input id="txtCaption" style="width: 210px; height: 52px" type="text" size="79" name="Text3"
                                            runat="server"></td>
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
                        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
                    <input type="text" id="txtPermissionRationID" name="txtPermissionRationID" runat="server" />
                    <input type="text" id="txtGrantDate" name="txtGrantDate" runat="server" />
                    <asp:Button ID="BtnSubmitChangeCmbCardex" runat="server" OnClick="BtnSubmitChangeCmbCardex_Click" />
                    <asp:Button ID="ImgRefreshPersonSubmit" runat="server" OnClick="ImgRefreshPersonSubmit_Click" />
                </div>
            </td>
        </tr>
        
        
    </table>

    <script language="javascript" type="text/javascript">
        
        //*******************************************************************************
        function onClickImgRefreshPerson() {
            OpenModelPopup();
            document.getElementById(MasterObj + "txtSubmit").value = "ImgRefreshPerson";
            document.getElementById(MasterObj + "ImgRefreshPersonSubmit").click();
        }
        //*******************************************************************************
        function OnClickBtnCancel() {
            window.close()
        }
        //*******************************************************************************
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            
            if ($get(MasterObj + "ActDate_txtYear").value == "" ||
            $get(MasterObj + "ActDate_txtMonth").value == "" ||
            $get(MasterObj + "ActDate_txtDay").value == "" ||
            document.getElementById(MasterObj + "cmbCardex").value == 0 ||
            document.getElementById(MasterObj + "cmbPeriod").value == 0 ||
            document.getElementById(MasterObj + "cmbRation").value == 0 ||
            document.getElementById(MasterObj + "txtPersonCode").value == "" ||
            document.getElementById(MasterObj + "SelName").value == 0) {
                alert('لطفا اطلاعات را وارد کنيد')
                return
            }
            //----------------------------------------------
            var Date = $get(MasterObj + "ActDate_txtYear").value + "/" + $get(MasterObj + "ActDate_txtMonth").value + "/" + $get(MasterObj + "ActDate_txtDay").value
            var str = "<Root><Tb>"
            //----------------------------------------------
            str += "<PermissionRationID>" + document.getElementById(MasterObj + "txtPermissionRationID").value + "</PermissionRationID>"
            str += "<PersonCode>" + document.getElementById(MasterObj + "txtPersonCode").value + "</PersonCode>"
            str += "<CardexID>" + document.getElementById(MasterObj + "cmbCardex").value + "</CardexID>"
            str += "<CardexPeriodID>" + document.getElementById(MasterObj + "cmbPeriod").value + "</CardexPeriodID>"
            str += "<RationID>" + document.getElementById(MasterObj + "cmbRation").value + "</RationID>"
            str += "<ActionDate>" + Date + "</ActionDate>"
            str += "<GrantDate>" + document.getElementById(MasterObj + "txtGrantDate").value + "</GrantDate>"
            //----------------------------------------------
            if (document.getElementById(MasterObj + "txtValueDay").value != "")
                str += "<RationDay>" + document.getElementById(MasterObj + "txtValueDay").value + "</RationDay>"
            else
                str += "<RationDay>0</RationDay>"
            //----------------------------------------------
            if (document.getElementById(MasterObj + "txtValueHour").value != "")
                str += "<RationHour>" + document.getElementById(MasterObj + "txtValueHour").value + "</RationHour>"
            else
                str += "<RationHour>00:00</RationHour>"
            //----------------------------------------------
            if (document.getElementById(MasterObj + "txtCaption").value != "")
                str += "<Caption>" + document.getElementById(MasterObj + "txtCaption").value + "</Caption>"
            //----------------------------------------------
            str += "</Tb></Root>"
            document.getElementById(MasterObj + "txtXmlSave").value = str
            document.getElementById(MasterObj + "txtSubmit").value = "Save"
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //*******************************************************************************
        function OnBlurTxtPersonCode() {
            if ($get(MasterObj + "txtPersonCode").value != "" | $get(MasterObj + "txtPersonCode").value != "0")
                $get(MasterObj + "SelName").value = $get(MasterObj + "txtPersonCode").value
            else
                $get(MasterObj + "SelName").value = "0";
        }
        //*******************************************************************************
        function OnChangeSelName() {
            if ($get(MasterObj + "SelName").value != "0")
                $get(MasterObj + "txtPersonCode").value = $get(MasterObj + "SelName").value;
            else
                $get(MasterObj + "txtPersonCode").value = "";
        }
        //*******************************************************************************
        function OnClickBtnNew() {
            $get(MasterObj + "ActDate_txtYear").value = ""
            $get(MasterObj + "ActDate_txtMonth").value = ""
            $get(MasterObj + "ActDate_txtDay").value = ""
            document.getElementById(MasterObj + "txtPermissionRationID").value = 0
            document.getElementById(MasterObj + "cmbCardex").value = 0
            document.getElementById(MasterObj + "cmbPeriod").value = 0
            document.getElementById(MasterObj + "cmbRation").value = 0
            document.getElementById(MasterObj + "txtPersonCode").value = ""
            document.getElementById(MasterObj + "SelName").value = 0
            document.getElementById(MasterObj + "txtCaption").value = ""

            document.getElementById(MasterObj + "txtValueDay").value = ""
            document.getElementById(MasterObj + "txtValueHour").value = ""

            document.getElementById(MasterObj + "txtPersonCode").disabled = false
            document.getElementById(MasterObj + "SelName").disabled = false
        }
        //*******************************************************************************
        function OnchangeCmbCardex() {
            if (document.getElementById(MasterObj + "cmbCardex").value == "")
                document.getElementById(MasterObj + "cmbCardex").value = 0;

            document.getElementById(MasterObj + "BtnSubmitChangeCmbCardex").click();
        }

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>

</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

    <style type="text/css">
        .style3
        {
            width: 80px;
        }
        .style4
        {
            width: 185px;
        }
        .style6
        {
            width: 82px;
        }
        .style7
        {
            width: 118px;
        }
        .style8
        {
            width: 109px;
        }
    </style>

</asp:Content>

