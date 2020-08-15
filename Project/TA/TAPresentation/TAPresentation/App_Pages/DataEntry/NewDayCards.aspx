<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="NewDayCards.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.NewDayCards"
    Title="Untitled Page" ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <script language="javascript" src="../../App_Utility/Scripts/General.js"></script>
     <script language ="javascript" type ="text/javascript" src="../../App_Utility/Scripts/Maskdiv.js"></script>
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
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
            if (StrVal == "ImgRefreshPerson") {

                document.getElementById('ImgRefreshPerson').disabled = true;
                document.getElementById('MaskedDiv').style.display = 'none';
                document.getElementById('ModalPopupDiv').style.display = 'none';
            }
            if (StrVal != "") {
                switch (StrVal) {
                    case "Show":

                        document.getElementById("ShiftTD").innerText = document.getElementById(MasterObj + "txtShift").value
                        document.getElementById("NobatKariTD").innerText = document.getElementById(MasterObj + "txtNobatKari").value
                        document.getElementById("TaradodTD").innerText = document.getElementById(MasterObj + "txtTaradod").value
                        break;
                    case "NewMissCard":
                    
                        document.getElementById("ShiftTD").innerText = document.getElementById(MasterObj + "txtShift").value
                        document.getElementById("NobatKariTD").innerText = document.getElementById(MasterObj + "txtNobatKari").value
                        document.getElementById("TaradodTD").innerText = document.getElementById(MasterObj + "txtTaradod").value

                        if (document.getElementById(MasterObj + "txtAlert").value == "Save")
                            SetMsg("ذخيره شد");
                            //alert("ذخيره شد")
                        else if (document.getElementById(MasterObj + "txtAlert").value == "Duplicate Taradod")
                            SetMsg("تردد تکراري");
                            
                        document.getElementById(MasterObj + "txtAlert").value=''
                        break
                }
                document.getElementById(MasterObj + "txtSubmit").value = ''
            }
        }
    </script>

    <div>
        <table style="width: 576px; height: 322px;">
            <tr>
                <td id="MsgTD" valign="top" align="center">
                </td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <uc1:ToolBar ID="OToolBar" PageName="NewDayCards.aspx" PageID="1312" runat="server" />
                </td>
            </tr>
            <tr>
                <td id="DownRow" style="display: inline; height: 309px" valign="top" align="center">
                    <table id="Table7" style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                        border-left: lightblue thin outset; width: 521px; border-bottom: lightblue thin solid;
                        height: 130px" cellspacing="1" cellpadding="1" width="521" border="0">
                        <tr>
                            <td valign="top">
                                <table id="Table6" style="width: 479px; height: 34px" cellspacing="2" cellpadding="2"
                                    align="center" border="0">
                                    <tr>
                                        <td style="width: 87px">
                                            تاريخ
                                        </td>
                                        <td style="color: #ff0000">
                                            <uc2:KCalendar ID="NDate" runat="server" />
                                        </td>
                                        <td >
                                       
                                        </td>
                                    </tr>
                                </table>
                                <table id="Table5" style="width: 478px; height: 79px" cellspacing="2" cellpadding="2"
                                    align="center" border="0">
                                    <tr>
                                        <td class="style3">
                                            کد پرسنلي
                                            :</td>
                                        <td class="style1">
                                            <input id="txtPersonCode" onblur="onChangetxtPersonID()" 
                                                onkeydown="clearText();OnKeyDownInt(this)" type="text" runat="server" style="width: 100px" />
                                        </td>
                                        <td class="style2">
                                            نام
                                        </td>
                                        <td>
                                            
                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>     
                                                    <select id="LPersonName" name="LPersonName" runat="server" onchange="onChangeLPersonName()">
                                                        <option></option>
                                                    </select>
                                                    <img ID="ImgRefreshPerson" alt="به روزرساني نام" 
                                                        onclick="onClickImgRefreshPerson()" 
                                                        src="../../App_Utility/Images/Icons/Refresh1.png" />
                                                </ContentTemplate>
                                                <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ImgRefreshPersonSubmit" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>  
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3">
                                            شيفت :
                                        </td>
                                        <td id="ShiftTD" style="color: #ff00ff; " class="style1">
                                        </td>
                                        <td class="style2">
                                            نوبت کاري :
                                        </td>
                                        <td id="NobatKariTD" style="color: #ff00ff">
                                        </td>
                                    </tr>
                                </table>
                                <table id="Table2" style="width: 477px; height: 29px" cellspacing="2" cellpadding="2"
                                    align="center" border="0">
                                    <tr>
                                        <td style="width: 84px">
                                            تردد :
                                        </td>
                                        <td id="TaradodTD" style="color: #ff00ff">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table id="Table12" style="width: 483px; height: 28px" cellspacing="1" cellpadding="1"
                        border="0">
                        <tr>
                            <td style="width: 58px">
                                <input id="ChkInOut" name="ChkInOut" checked type="checkbox" onclick="onClickChkInOut(this)" />نوع
                            </td>
                            <td>
                                <input id="rdbIn" type="radio" checked value="rdbIn" name="Kind" runat="server">ورود
                                <input id="rdbOut" type="radio" value="rdbOut" name="Kind" runat="server">خروج
                            </td>
                        </tr>
                    </table>
                    <table id="Table7" style="width: 476px; height: 30px" cellspacing="1" cellpadding="1"
                        border="0">
                        <tr>
                            <td style="width: 58px">
                                ساعت
                            </td>
                            <td style="width: 159px">
                                <input class="txtControls" id="txtTime" onkeydown="OnKeyDownTime(this.value)" onblur="Timechk(this)"
                                    style="width: 54px; height: 21px" type="text" maxlength="5" size="3" name="txtTime"
                                    runat="server">
                            </td>
                            <td style="width: 60px">
                                توضيحات
                            </td>
                            <td>
                                <asp:TextBox ID="txtDescr" runat="server" CssClass="txtControls" Width="184px" Height="58px"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div style="display: none">
                                <input type="text" id="txtRequestPersonCode" runat="server" />
                                <input type="text" id="txtDate" runat="server" />
                                <asp:HiddenField ID="txtShift" runat="server" />
                                <asp:HiddenField ID="txtTaradod" runat="server" />
                                <asp:HiddenField ID="txtNobatKari" runat="server" />
                                <asp:HiddenField ID="txtAlert" runat="server" />
                            </div>
                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        </Triggers>
                    </asp:UpdatePanel>
                 
                </td>
            </tr>
            <tr>
            <td align="center">
            
            
            </td>
            </tr>
        </table>
        <div style="display: none">
                    <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
            <asp:HiddenField ID="txtXmlSave" runat="server" />
            <asp:HiddenField ID="txtOnLineUserID" runat="server" />
            <asp:HiddenField ID="txtUserPersonelID" runat="server" />
            <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
            <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
            <asp:Button ID="ImgRefreshPersonSubmit" runat="server" Text="ImgRefreshPersonSubmit" onclick="ImgRefreshPersonSubmit_Click" />
        </div>
        
    </div>

    <script language="javascript" type="text/javascript">
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!AtachEvent!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //document.body.attachEvent('onkeydown', SetEnter)
        //document.body.attachEvent('onkeypress', SetEnter)
        
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!doOnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        document.getElementById("ShiftTD").innerText = document.getElementById(MasterObj + "txtShift").value
        document.getElementById("NobatKariTD").innerText = document.getElementById(MasterObj + "txtNobatKari").value
        document.getElementById("TaradodTD").innerText = document.getElementById(MasterObj + "txtTaradod").value
        
        
        $get(MasterObj + "NDate_txtDay").value = $get(MasterObj + "txtDate").value.substring(8, 10);
        $get(MasterObj + "NDate_txtMonth").value = $get(MasterObj + "txtDate").value.substring(5, 7);
        $get(MasterObj + "NDate_txtYear").value = $get(MasterObj + "txtDate").value.substring(0, 4);
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        ////__________________________________This Page_______________________________________
        function OnClickBtnNew() {

            document.getElementById(MasterObj + "txtTime").value = ""
            document.getElementById(MasterObj + "txtDescr").value = ""

            //===========
            document.getElementById(MasterObj + "txtPersonCode").value = document.getElementById(MasterObj + "txtRequestPersonCode").value

            document.getElementById(MasterObj + "rdbIn").checked = true
            onChangetxtPersonID()
            OnClickBtnFilter()
        }
        ////_________________________________________________________________________________
        function OnClickBtnCancel() {
            window.close()
        }
        ////_________________________________________________________________________________
        function onChangeLPersonName() {
            document.getElementById(MasterObj + "txtPersonCode").value = document.getElementById(MasterObj + "LPersonName").value
        }
        ////_________________________________________________________________________________
        function clearText() {
            //document.getElementById("AlertTD").value = "به منظور مشاهده اطلاعات پرسنلي منتظر بمانيد"
        }
        ////__________________________________________________________________________
        function onChangetxtPersonID() {

            if ($get(MasterObj + "txtPersonCode").value != "" | $get(MasterObj + "txtPersonCode").value != "0")
                $get(MasterObj + "LPersonName").value = $get(MasterObj + "txtPersonCode").value
            else {
                $get(MasterObj + "LPersonName").value = "0";
                return
            }
        }
        ////_________________________________________________________________________
        function OnClickBtnFilter() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            var SDate = document.getElementById(MasterObj + "NDate_txtYear").value + "/" + document.getElementById(MasterObj + "NDate_txtMonth").value + "/" + document.getElementById(MasterObj + "NDate_txtDay").value
            document.getElementById(MasterObj + "txtDate").value = SDate

            document.getElementById(MasterObj + "txtSubmit").value = "Show";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        ////_________________________________________________________________________
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            SaveData(1)
        }
        ////_________________________________________________________________________
        function OnClickBtnSaveAndCalc() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            SaveData(0)
        }
        ////_________________________________________________________________________
        function SaveData(FlagCalc) {
        
            if ((document.getElementById(MasterObj + "txtPersonCode").value == "") || (document.getElementById(MasterObj + "txtPersonCode").value == "0")) {
                alert("لطفا شماره پرسنلي را وارد نماييد.")
                return;
            }
            if (document.getElementById(MasterObj + "txtTime").value == "") {
                alert("لطفا ساعت تردد را وارد نماييد.")
                return;
            }

            var Date =  document.getElementById(MasterObj + "NDate_txtYear").value +"/"+document.getElementById(MasterObj + "NDate_txtMonth").value + "/" + document.getElementById(MasterObj + "NDate_txtDay").value
            if (Date == "//")
                Date = ""

            var InoutKind = 0;
            if ($get("ChkInOut").checked == true) {
                if (document.getElementById(MasterObj + "rdbIn").checked == true)
                    InoutKind = 3
                if (document.getElementById(MasterObj + "rdbOut").checked == true)
                    InoutKind = 4
            }
            else
                InoutKind = 0 

            var SaveXml = '<Root>'
            //------------------
            //Base Tag
            SaveXml += "<Tb>"
            SaveXml += "<Date>" + Date + "</Date>"
            SaveXml += "<Time>" + document.getElementById(MasterObj + "txtTime").value + "</Time>"
            SaveXml += "<PersonCode>" + document.getElementById(MasterObj + "txtPersonCode").value + "</PersonCode>"
            SaveXml += "<JPersonCode>0</JPersonCode>"
            SaveXml += "<StatusID>203</StatusID>"

            if (document.getElementById(MasterObj + "txtDescr").value != "")
                SaveXml += "<Descr>" + document.getElementById(MasterObj + "txtDescr").value + "</Descr>"

            SaveXml += "<UserPersonelID>" + document.getElementById(MasterObj + "txtUserPersonelID").value + "</UserPersonelID>"
            SaveXml += "<InOutType>" + InoutKind + "</InOutType>"
            SaveXml += "</Tb>"
            //------------------
            //Setting Tag
            SaveXml += "<Setting>"
            SaveXml += "<CalcParam>0</CalcParam>"
            if (FlagCalc==1)
                SaveXml += "<CalcFlag>1</CalcFlag>"
            SaveXml += "<OnlineUserID>" + $get(MasterObj + "txtOnlineUserID").value + "</OnlineUserID>"
            SaveXml += "<SubSysID>13</SubSysID>"
            SaveXml += "<PageID>1312</PageID>"
            SaveXml += "</Setting>"
            
            SaveXml += "</Root>"

            document.getElementById(MasterObj + "txtXmlSave").value = SaveXml
           
            window.returnValue = 1
            document.getElementById(MasterObj + "txtSubmit").value = "NewMissCard";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        ////_________________________________________________________________________
        function onClickChkInOut(obj) {
            
            if ($get("ChkInOut").checked == true) {
                document.getElementById(MasterObj + "rdbIn").disabled = false
                document.getElementById(MasterObj + "rdbOut").disabled = false
            }
            else {
                document.getElementById(MasterObj + "rdbIn").disabled = true
                document.getElementById(MasterObj + "rdbOut").disabled = true
            }


        }
        ////_________________________________________________________________________
        function onClickImgRefreshPerson() {
            OpenModelPopup();
            document.getElementById(MasterObj + "txtSubmit").value = "ImgRefreshPerson";
            document.getElementById(MasterObj + "ImgRefreshPersonSubmit").click();
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        #LPersonName
        {
            width: 154px;
        }
        .style1
        {
            width: 100px;
        }
        .style2
        {
            width: 72px;
        }
        .style3
        {
            width: 64px;
        }
    </style>
</asp:Content>
