<%@ Page Title="--------------------------------------------------------------------ويرايش مشخصات پرسنل--------------------------------------------------------------------------"
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true"
    ValidateRequest="false" CodeBehind="ModifyPersonNew.aspx.cs" Inherits="FrmPresentation.App_Pages.DataEntry.ModifyPerson"
    AsyncTimeout="1800" %>

<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Src="../../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox"
    TagPrefix="uc4" %>
<%@ Register Src="../../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../App_Utility/Styles/ModifyPersonStyle/tabStyle.css" rel="stylesheet"
        type="text/css" />
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" LoadScriptsBeforeUI="false" runat="server"
        AsyncPostBackTimeout="1800">
    </asp:ScriptManager>
    <script src="../../../App_Utility/Scripts/Extended.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        window.document.title = "ويرايش مشخصات پرسنل";
        window.name = "ModifyPersonNew.aspx"
        aspnetForm.target = window.name;

        var elem;
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            elem = args.get_postBackElement();
            document.getElementById("OToolBar_BtnSave").disabled = true;
        }
        function EndRequestHandler(sender, args) {
            document.getElementById("OToolBar_BtnSave").disabled = false;
            //*******************************************************************************
            if (elem.id == MasterObj + "BtnSubmitDept") {
                $get(MasterObj + "txtDepartmentCode").value = $get(MasterObj + "txtNewDepartmentCode").value;
                $get(MasterObj + "txtDepartmentID").value = $get(MasterObj + "txtNewDepartmentID").value;
            }
            //*******************************************************************************
            else if (elem.id == MasterObj + "BtnSubmit") {
                if ($get(MasterObj + "txtSubmit").value == "Save" | $get(MasterObj + "txtSubmit").value == "SaveNew") {
                    if ($get(MasterObj + "txtSubmit").value == "SaveNew") {
                        PrsID = "";
                        $get(MasterObj + "TDPersonCode").innerText = "";
                        $get(MasterObj + "TDFullName").innerHTML = "&nbsp;";
                        $get(MasterObj + "txtPersonCode").value = ""
                        $get(MasterObj + "txtLName").value = ""
                        $get(MasterObj + "txtFName").value = ""
                        $get(MasterObj + "txtIdentifierNo").value = ""
                        $get(MasterObj + "txtNationalNo").value = ""
                        $get(MasterObj + "CmbBornPlace").value = "0"
                        $get(MasterObj + "rdActive").checked = true
                        $get(MasterObj + "rdDeactive").checked = false
                        document.getElementById(MasterObj + "TDImg").src = "../../../App_Utility/Images/ModifyPersonImage/userpic.jpg"
                        //تاریخ تولد
                        $get(MasterObj + "BirthDate_txtDay").value = "";
                        $get(MasterObj + "BirthDate_txtMonth").value = "";
                        $get(MasterObj + "BirthDate_txtYear").value = "";
                        $get(MasterObj + "BirthDate_txtCalendar").value = ""
                        $get(MasterObj + "txtExitDate").value = ""
                        $get(MasterObj + "txtEmployDate").value = ""
                        $get(MasterObj + "txtWorkingDate").value = ""
                        $get(MasterObj + "KCalWorkingDate_txtCalendar").value = ""
                        $get(MasterObj + "KCalEmployDate_txtCalendar").value = ""
                        $get(MasterObj + "KCalExitDate_txtCalendar").value = ""
                        $get(MasterObj + "txtExtended").value = ""
                        $get(MasterObj + "lblUserName").value = "";
                        $get(MasterObj + "txtPass").value = "";
                        $get(MasterObj + "txtUserName").value = "";
                        $get(MasterObj + "txtConfirmPass").value = "";
                        $get(MasterObj + "ChkUserAccount").disabled = false;
                        $get(MasterObj + "ChkUserAccount").checked = false;
                        $get(MasterObj + "KCalSDateUserAcces_txtCalendar").value = "";
                        $get(MasterObj + "KCalEDateUserAcces_txtCalendar").value = "";
                        $get(MasterObj + "rdActiveUser").checked = true;
                        
                        $get(MasterObj + "txtOldPersonCode").value = ""
                        $get(MasterObj + "txtUserNameTemp").value = ""
                        //                                    ResetGrdCard();
                        ResetDivDepartment();
                    }
                    if ($get(MasterObj + "txtSubmit").value == "Save") {
                   
                        $get(MasterObj + "KCalWorkingDate_txtYear").value = document.getElementById(MasterObj + "txtWorkingDate").value.substr(0, 4)
                        $get(MasterObj + "KCalWorkingDate_txtMonth").value = document.getElementById(MasterObj + "txtWorkingDate").value.substr(5, 2)
                        $get(MasterObj + "KCalWorkingDate_txtDay").value = document.getElementById(MasterObj + "txtWorkingDate").value.substr(8, 2)
                        $get(MasterObj + "KCalWorkingDate_txtCalendar").value = $get(MasterObj + "KCalWorkingDate_txtDay").value + "/" + $get(MasterObj + "KCalWorkingDate_txtMonth").value + "/" + $get(MasterObj + "KCalWorkingDate_txtYear").value
                        $get(MasterObj + "KCalWorkingDate_txtCalendar").value = $get(MasterObj + "KCalWorkingDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalWorkingDate_txtDay").value + "/" + $get(MasterObj + "KCalWorkingDate_txtMonth").value + "/" + $get(MasterObj + "KCalWorkingDate_txtYear").value)
                    }
                    if ($get(MasterObj + "txtAlert").value != "") {
                        if ($get(MasterObj + "txtValidateSave").value == "1") {
                            SetMsg($get(MasterObj + "txtAlert").value);
                            $get(MasterObj + 'TDPersonCode').innerText = $get(MasterObj + "txtPersonCode").value;
                            $get(MasterObj + 'TDFullName').innerText = $get(MasterObj + "txtLName").value + ' ' + $get(MasterObj + "txtFName").value;
                            PrsID = $get(MasterObj + "txtPersonID").value;
                            window.returnValue = SaveFlag;
                            $get(MasterObj + "txtOldPersonCode").value = $get(MasterObj + "txtPersonCode").value;
                        }
                        else {
                            alert($get(MasterObj + "txtAlert").value);
                            if ($get(MasterObj + "txtOldPersonCode").value != "")
                                $get(MasterObj + "txtPersonCode").value = $get(MasterObj + "txtOldPersonCode").value;
                            if ($get(MasterObj + "txtValidateSave").value == "5")
                                window.close();
                        }
                    }
                }

            }
            //*******************************************************************************
            else if (elem.id == MasterObj + "BtnSubmitCheckPersonCode") {
//                if ($get(MasterObj + "txtSubmit").value == "CheckPersonCode" & $get(MasterObj + "txtAlertCheckPCode").value != "") {
//                    $get(MasterObj + "txtAlert").value = $get(MasterObj + "txtAlertCheckPCode").value
//                    alert($get(MasterObj + "txtAlert").value);
//                    $get(MasterObj + "txtPersonCode").value = "";
//                    $get(MasterObj + "lblUserName").value = "";
//                    $get(MasterObj + "txtPass").value = "";
//                    $get(MasterObj + "txtConfirmPass").value = "";
//                    $get(MasterObj + "KCalSDateUserAcces_txtCalendar").value = "";
//                    $get(MasterObj + "KCalEDateUserAcces_txtCalendar").value = "";
//                    document.getElementById("PersonCodeTD").innerHTML = "<div style='color: red; '>* شماره پرسنلي :</div>"

//                }
//                else if ($get(MasterObj + "txtSubmit").value == "CheckPersonCode" & $get(MasterObj + "txtAlertCheckPCode").value == "")
//                    document.getElementById("PersonCodeTD").innerHTML = "<div style='color: green;'>* شماره پرسنلي :</div>"


//                else 
                if ($get(MasterObj + "txtSubmit").value == "DelPersonPic" && $get(MasterObj + "txtValidate").value == "1")
                    SetMsg($get(MasterObj + "txtAlertDelPic").value);

                else if ($get(MasterObj + "txtSubmit").value == "DelPersonPic" && $get(MasterObj + "txtValidate").value == "0")
                    alert($get(MasterObj + "txtAlertDelPic").value);
            }
            //*******************************************************************************
            else if (elem.id == MasterObj + "BtnSubmitCheckCard") {
                if ($get(MasterObj + "txtSubmit").value == "CheckCardNo")
                    if ($get(MasterObj + "txtCardNo").value != "") {
                        $get(MasterObj + "txtAlert").value = $get(MasterObj + "txtCardNo").value
                        alert($get(MasterObj + "txtAlert").value);
                    }
                    else {
                        var OGrdCard = document.getElementById("GrdCard");
                        var RowIndex = parseInt($get(MasterObj + "txtGrdCardRowIndex").value)
                        if (CheckRepeatCardNO(OGrdCard.rows(RowIndex).cells(4).firstChild.value, OGrdCard.rows(RowIndex).getAttribute('SystemID'))) {
                            OGrdCard.rows(RowIndex).cells(0).firstChild.disabled = false;
                            OGrdCard.rows(RowIndex).cells(1).firstChild.disabled = false;
                            OGrdCard.rows(RowIndex).cells(2).firstChild.disabled = false;
                            OGrdCard.rows(RowIndex).cells(5).firstChild.disabled = false;
                            OGrdCard.rows(RowIndex).cells(6).firstChild.disabled = false;
                            OGrdCard.rows(RowIndex).cells(0).firstChild.checked = true;
                        }
                        else {
                            $get(MasterObj + "txtAlert").value = "شماره کارت تکراری است";
                            alert($get(MasterObj + "txtAlert").value);
                        }
                    }
            }
            //*******************************************************************************
            $get(MasterObj + "txtAlertCheckPCode").value = "";
            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";
        }
                    
                    
    </script>
    <table style="width: 691px; text-align: center" align="center">
        <tr>
            <td id="TdToolbar">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="border-left: solid 1px #8db2e3; border-bottom: solid 1px #8db2e3; border-top: solid 1px #8db2e3;
                border-right: solid 1px #8db2e3;">
                <table style="width: 100%; text-align: center">
                    <tr>
                        <td style="width: 102px;">
                            <font color="#FF66B3">شماره پرسنلي :</font>
                        </td>
                        <td id="TDPersonCode" style="width: 162px" runat="server" align="right">
                            &nbsp;
                        </td>
                        <td style="width: 128px;">
                            <font color="#FF66B3">نام و نام خانوادگي :</font>
                        </td>
                        <td id="TDFullName" runat="server" align="right">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div class="DemoArea" align="center">
        <div align="center" style="direction:ltr;">
            <ComponentArt:TabStrip ID="TabStrip1" CssClass="TopGroup" SiteMapXmlFile="../../../App_Utility/Styles/ModifyPersonStyle/tabData.xml"
                DefaultItemLookId="DefaultTabLook" DefaultSelectedItemLookId="SelectedTabLook"
                DefaultDisabledItemLookId="DisabledTabLook" DefaultGroupTabSpacing="1px" ImagesBaseUrl="images/"
                MultiPageId="MultiPage1" ScrollingEnabled="True" ScrollLeftLookId="ScrollItem"
                ScrollRightLookId="ScrollItem" Width="668px" runat="server" ScrollDownLookId="DefaultTabLook"
                ScrollUpLookId="DefaultTabLook" TopGroupTabSpacing="1px">
                <ItemLooks>
                    <ComponentArt:ItemLook LookId="DefaultTabLook" CssClass="DefaultTab" HoverCssClass="DefaultTabHover"
                        LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="2" LabelPaddingBottom="1"
                        LeftIconUrl="tab_left_icon.gif" RightIconUrl="tab_right_icon.gif" HoverLeftIconUrl="hover_tab_left_icon.gif"
                        HoverRightIconUrl="hover_tab_right_icon.gif" LeftIconWidth="3" LeftIconHeight="21"
                        RightIconWidth="3" RightIconHeight="19" />
                    <ComponentArt:ItemLook LookId="SelectedTabLook" CssClass="SelectedTab" LabelPaddingLeft="10"
                        LabelPaddingRight="10" LabelPaddingTop="2" LabelPaddingBottom="1" LeftIconUrl="selected_tab_left_icon.gif"
                        RightIconUrl="selected_tab_right_icon.gif" LeftIconWidth="3" LeftIconHeight="21"
                        RightIconWidth="3" RightIconHeight="19" />
                    <ComponentArt:ItemLook LookId="ScrollItem" CssClass="ScrollItem" HoverCssClass="ScrollItemHover"
                        LabelPaddingLeft="5" LabelPaddingRight="5" LabelPaddingTop="0" LabelPaddingBottom="0" />
                </ItemLooks>
            </ComponentArt:TabStrip>
        </div>
        <ComponentArt:MultiPage ID="MultiPage1" CssClass="MultiPage" runat="server" align="center">
            <ComponentArt:PageView ID="PageView1" CssClass="PageContent" runat="server">
                <!-- Add content for page 1 here -->
                <div id="PersonDiv" style="display: inline">
                    <table width="100%" style="text-align: center">
                        <tr>
                            <td style="width: 100%">
                                <table>
                                    <tr>
                                        <td id="PersonCodeTD" style="text-align: left">
                                            * شماره پرسنلی :
                                        </td>
                                        <td>
                                           <%-- <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                 <ContentTemplate>--%>
                                                    <input id="txtPersonCode" name="txtPersonCode" type="text" runat="server" onkeydown="OnKeyDownInt(this)"
                                                        dir="rtl" style="width: 150px" maxlength="20" class="TxtControls" tabindex="1"
                                                        onblur="onBlurTxtPersonCode()" />
                                                    <asp:HiddenField ID="txtAlertCheckPCode" runat="server" />
                                                    <input style="display: none" type="text" runat="server" id="txtOnLineUser" name="txtOnLineUser" />
                                                    <asp:HiddenField ID="txtValidate" runat="server" />
                                                    <asp:HiddenField ID="txtPersonID" runat="server" />
                                                    <asp:HiddenField ID="txtOldPersonCode" runat="server" />
                                                    <asp:HiddenField ID="txtAlertDelPic" runat="server" />
                                               <%-- </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmitCheckPersonCode" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>--%>
                                        </td>
                                        <td style="text-align: left;">
                                            تاريخ تولد :
                                        </td>
                                        <td>
                                            <uc3:KCalendar ID="BirthDate" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="LNameTD" style="text-align: left">
                                            * نام خانوادگی :
                                        </td>
                                        <td>
                                            <input id="txtLName" name="txtLName" onkeydown="FKeyDown()" onkeypress="FKeyPress()"
                                                onblur="onBlurTxtLName()" class="TxtControls" lang="0" type="text" runat="server"
                                                dir="rtl" style="width: 150px" tabindex="2" />
                                        </td>
                                        <td style="text-align: left;">
                                            تاريخ شروع بکار :
                                        </td>
                                        <td>
                                            <uc3:KCalendar ID="KCalWorkingDate" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="NameTD" style="text-align: left">
                                            * نام :
                                        </td>
                                        <td>
                                            <input id="txtFName" class="TxtControls" name="txtFName" onblur="OnBlurTxtFName()"
                                                onkeydown="FKeyDown()" onkeypress="FKeyPress()" lang="0" type="text" runat="server"
                                                dir="rtl" style="width: 150px" tabindex="3" />
                                        </td>
                                        <td style="text-align: left">
                                            تاريخ خاتمه کار :
                                        </td>
                                        <td>
                                            <uc3:KCalendar ID="KCalExitDate" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="Td1" style="text-align: left">
                                            نام پدر :
                                        </td>
                                        <td>
                                            <input id="txtFatherName" class="TxtControls" name="txtFatherName" onkeydown="FKeyDown()"
                                                onkeypress="FKeyPress()" lang="0" type="text" runat="server" tabindex="4" dir="rtl"
                                                style="width: 150px" />
                                        </td>
                                        <td id="EmployDateTD" style="text-align: left">
                                           تاريخ استخدام :
                                        </td>
                                        <td>
                                            <uc3:KCalendar ID="KCalEmployDate" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left">
                                            کد ملی :
                                        </td>
                                        <td>
                                            <input id="txtNationalNo" class="TxtControls" name="txtNationalNo" onkeydown="OnKeyDownInt(this)"
                                                type="text" runat="server" tabindex="5" dir="rtl" style="width: 150px" maxlength="10" />
                                        </td>
                                        <td style="text-align: left">
                                            تلفن همراه :
                                        </td>
                                        <td>
                                            <input id="txtMobileNo" class="TxtControls" name="txtMobileNo" onkeydown="OnKeyDownInt(this)"
                                                type="text" runat="server" dir="rtl" style="width: 150px" maxlength="13" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left">
                                            شماره شناسنامه :
                                        </td>
                                        <td>
                                            <input id="txtIdentifierNo" class="TxtControls" name="txtIdentifierNo" type="text"
                                                runat="server" tabindex="6" dir="rtl" style="width: 150px" maxlength="20" />
                                        </td>
                                        <td style="text-align: left">
                                            آدرس ايميل :
                                        </td>
                                        <td>
                                            <input id="txtEmailAddress" class="TxtControls" name="txtIdentifierNo" type="text"
                                                runat="server" dir="rtl" style="width: 150px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left">
                                            محل صدور :
                                        </td>
                                        <td>
                                            <asp:DropDownList TabIndex="7" ID="CmbSodor" CssClass="TxtControls" runat="server"
                                                Width="150px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left">
                                            محل تولد :
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="CmbBornPlace" TabIndex="8" CssClass="TxtControls" runat="server"
                                                Width="150px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left">
                                            جنسيت :
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="CmbSex" TabIndex="9" CssClass="TxtControls" runat="server"
                                                Width="150px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left">
                                            وضعيت تاهل :
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="CmbMarriage" TabIndex="10" CssClass="TxtControls" runat="server"
                                                Width="150px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left">
                                            وضعيت :
                                        </td>
                                        <td>
                                            <div align="right">
                                                <input type="radio" id="rdActive" name="ActivePerson" checked="true" runat="server"
                                                    onclick="OnClickActive()" />فعال
                                                <input type="radio" id="rdDeactive" name="ActivePerson" title="در صورتيکه فرد غيرفعال شود اطلاعات وي قابل مشاهده نيست"
                                                    runat="server" onclick="OnClickActive()" />غير فعال
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 15%">
                            </td>
                            <td valign="top">
                                <table align="left" dir="ltr" style="width: 100px">
                                    <tr>
                                        <td colspan="2" style="width: 95px; height: 110px;" align="center">
                                            <img id="TdImg" runat="server" style="border: 1px solid #919B9C; width: 95px; height: 110px;"
                                                src="../../../App_Utility/Images/ModifyPersonImage/userpic.jpg" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img id="DelImg" alt="حذف تصوير" runat="server" style="cursor: pointer" src="../../../App_Utility/Images/Icons/DelIcon.gif"
                                                onclick="OnClickBtnDelPic()" />
                                            <%-- <input id="DelImg" type="image"  alt="حذف تصوير" cursor="pointer"  src="../../../App_Utility/Images/Icons/DelIcon.gif" />--%>
                                        </td>
                                        <td style="width: 65px; vertical-align: bottom">
                                            <asp:Label Text="انتخاب تصوير" Width="65px" ForeColor="Maroon" Style="cursor: pointer"
                                                onmouseover="OnMouseOverPic()" onmouseout="OnMouseUpPic()" Font-Underline="true"
                                                onclick="OnClickBtnUpload()" runat="server" ID="lblPic"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </ComponentArt:PageView>
            <ComponentArt:PageView ID="PageView2" CssClass="PageContent" runat="server">
                <!-- Add content for page 2 here -->
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table width="80%" align="center" dir="rtl" style="border: 2px inset #33CCFF;">
                            <tr>
                                <td align="center" valign="top">
                                    <div id="DivExtended" style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                        scrollbar-base-color: #b0c4de; height: 300px">
                                        <asp:PlaceHolder ID="ExtendedGridViewPlaceHolder" runat="Server" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:HiddenField ID="txtFirstTagName" runat="server" />
                                    <asp:HiddenField ID="txtExtended" runat="server" />
                                    <asp:HiddenField ID="txtUserNameTemp" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </ComponentArt:PageView>
            <ComponentArt:PageView ID="PageView3" CssClass="PageContent" runat="server">
                <!-- Add content for page 3 here -->
                <div id="CardDiv">
                    <div style="vertical-align: middle" align="center">
                        <table id="Table16" dir="rtl">
                            <tr>
                                <td style="font-weight: 700" align="center">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <br />
                                            <asp:PlaceHolder ID="CardGridViewPlaceHolder" runat="Server" />
                                            <asp:HiddenField ID="txtAlert" runat="server" />
                                            <asp:HiddenField ID="txtPicPath" runat="server" />
                                            <asp:HiddenField ID="txtPicFormat" runat="server" />
                                            <asp:HiddenField ID="txtValidateSave" runat="server" />
                                            <asp:HiddenField ID="txtUserID" runat="server" />
                                            <%--<asp:HiddenField ID="txtPersonID" runat="server" />--%>
                                            <img alt="" runat="server" style="height: 80px; width: 80px; display: none" id="ImgPerson"
                                                name="ImgPerson" />
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:HiddenField ID="txtCardNo" runat="server" />
                                            <asp:HiddenField ID="txtGrdCardRowIndex" runat="server" />
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnSubmitCheckCard" EventName="click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="display: none">
                        <asp:HiddenField ID="txtSaveXml" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="txtSearch" runat="server" />
                        <asp:HiddenField ID="lblFrom" runat="server" />
                        <asp:HiddenField ID="lblTo" runat="server" />
                        <asp:HiddenField ID="lblTotal" runat="server" />
                        <asp:HiddenField ID="txtBirthDate" runat="server" />
                        <asp:HiddenField ID="txtExTabXml" runat="server" />
                        <asp:HiddenField ID="txtCardTabXml" runat="server" />
                        <asp:HiddenField ID="txtGroupTabXml" runat="server" />
                        <asp:HiddenField ID="txtDeptTabXml" runat="server" />
                        <asp:HiddenField ID="txtNewDepXml" runat="server" />
                        <asp:HiddenField ID="txtUserName" runat="server" />
                        <asp:HiddenField ID="txtAllDepartmentXML" runat="server" />
                        <asp:HiddenField ID="txtDepID" runat="server" />
                    </div>
                </div>
            </ComponentArt:PageView>
            <ComponentArt:PageView ID="PageView4" CssClass="PageContent" runat="server">
                <!-- Add content for page 4 here -->
                <div id="GroupShift-Personel" align="center">
                    <table dir="rtl">
                        <tr>
                            <td dir="rtl">
                                دسته بندی :
                            </td>
                            <td>
                                <asp:DropDownList ID="CmbGroupShiftPersonel" CssClass="TxtControls" runat="server"
                                    OnChange="OnClickBtnFilter()" Width="130px">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 240px">
                            </td>
                        </tr>
                    </table>
                    <table width="100%" dir="rtl">
                        <tr>
                            <td align="center" valign="middle">
                                <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div align="center" style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #b0c4de; height: 300px;">
                                            <asp:PlaceHolder ID="GroupShiftPersonelPlaceholder" runat="Server" />
                                        </div>
                                        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" style="display: none" />
                                        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                                            runat="server" style="display: none" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnFilterShiftGroup" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </div>
            </ComponentArt:PageView>
            <ComponentArt:PageView ID="PageView5" CssClass="PageContent" runat="server">
                <!-- Add content for page 5 here -->
                <div id="UserInfoDiv" align="center" height="100%">
                    <fieldset dir="rtl" style="width: 100%; height: 300px; border-right: lightblue thin inset;
                        border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                        align="center">
                        <legend style="color: #78BED6">
                            <input type="checkbox" id="ChkUserAccount" runat="server" onclick="OnClickUser()" />ايجاد
                            حساب کاربري</legend>
                        <table align="right">
                            <tr>
                                <td style="text-align: left">
                                    نام کاربري :
                                </td>
                                <td>
                                    <asp:TextBox ID="lblUserName" runat="server" CssClass="TxtControls" Width="145" Height="23px"
                                        Style="color: Maroon;"></asp:TextBox>
                                </td>
                                <td style="text-align: left">
                                    كلمه عبور :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPass" runat="server" CssClass="TxtControls" Height="23px" TextMode="Password"
                                        EnableViewState="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    وضعيت دسترسي به سيستم :
                                </td>
                                <td>
                                    <div align="right">
                                        <input type="radio" id="rdActiveUser" checked="true" runat="server" onclick="OnClickActiveUser(this)" />فعال
                                        <input type="radio" id="rdDActiveUser" runat="server" onclick="OnClickActiveUser(this)" />غير
                                        فعال
                                    </div>
                                </td>
                                <td style="text-align: left">
                                    تکرار کلمه عبور :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtConfirmPass" runat="server" CssClass="TxtControls" Height="23px"
                                        EnableViewState="False" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    دسترسي از تاريخ :
                                </td>
                                <td>
                                    <uc3:KCalendar ID="KCalSDateUserAcces" runat="server" />
                                </td>
                                <td style="text-align: left">
                                    دسترسي تا تاريخ :
                                </td>
                                <td>
                                    <uc3:KCalendar ID="KCalEDateUserAcces" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </div>
            </ComponentArt:PageView>
            <ComponentArt:PageView ID="PageView6" CssClass="PageContent" runat="server">
                <!-- Add content for page 4 here -->
                <div id="DivDepartment">
                    <table align="center">
                        <tr>
                            <td>
                                <fieldset style="width: 650px; height: 75px; text-align: center;">
                                    <legend></legend>
                                    <table align="right">
                                        <tr>
                                            <td style="width: 20px">
                                            </td>
                                            <td>
                                                نوع سمت :
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="CmbRoleType" runat="server" Width="250px" CssClass="TxtControls"
                                                    onclick="OnClickDepControls()">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 50px">
                                            </td>
                                            <td>
                                                نام سمت :
                                            </td>
                                            <td>
                                                <input id="txtRoleTitle" name="txtRoleTitle" type="text" runat="server" dir="rtl"
                                                    onclick="OnClickDepControls()" onkeydown="OnClickDepControls()" onmouseover="OnClickDepControls()" style="width: 170px" class="TxtControls" />
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <fieldset style="width: 650px; height: 75px; text-align: center;">
                                    <legend><font style="font-size: 12px; color: #348DAB; font-weight: bold; font-family: 'KasraB Traffic';">
                                        <input type="radio" id="rdExistsDept" name="rdDep" checked="true" />واحد موجود</font></legend>
                                    <table align="right" width="100%">
                                        <tr>
                                            <td style="width: 20px">
                                            </td>
                                            <td>
                                                <div align="right">
                                                    نام واحد :
                                                </div>
                                            </td>
                                             <td>
                                               <asp:Label ID="lblDepartment" style="border: 1px solid  #348DAB; height:20px; color:Black; text-align:right" runat="server" Width="220px"></asp:Label>
                                            </td>
                                            <td>
                                                <div align="right">
                                                    <img id="ImgSelectDepartment" alt="انتخاب واحد سازماني" onclick="OnClickBtnSelectDepartment(),OnClickDepControls()"
                                                        src="/FrmPresentation/App_Utility/Images/Icons/select.png" style="cursor: pointer;" />
                                                    <input type="text" id="txtDeptID" runat="server" style="display: none" />
                                                </div>
                                            </td>
                                            <td>
                                                <div align="right">
                                                    نام واحد مافوق :</div>
                                            </td>
                                            <td>
                                                <div align="right">
                                                    <asp:Label ID="lblParentDeptName" Style="border: 1px solid  #348DAB; height: 20px;
                                                        color: Black; text-align: right" runat="server" Width="220px"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <fieldset style="width: 650px; height: 120px; text-align: right;">
                                    <legend><font style="font-size: 12px; color: #348DAB; font-weight: bold; font-family: 'KasraB Traffic';">
                                        <input type="radio" id="rdNewDept" name="rdDep" onclick="OnClickNewDep()" />واحد
                                        جديد</font></legend>
                                    <table align="right">
                                        <tr>
                                            <td style="width: 20px">
                                            </td>
                                            <td>
                                                <div align="right">
                                                    نام واحد :</div>
                                            </td>
                                            <td>
                                                <div align="right">
                                                    <input id="txtOrgName" runat="server" style="width: 150px; height: 20px;" type="text"
                                                        class="TxtControls" onclick="OnClickDepControls()" /></div>
                                            </td>
                                            <td style="width: 50px">
                                            </td>
                                            <td>
                                                <div align="right">
                                                    نام واحد مافوق :</div>
                                            </td>
                                            <td>
                                                <div align="right">
                                                    <asp:Label ID="lblParentName" Style="border: 1px solid  #348DAB; height: 20px; color: Black;
                                                        text-align: right" runat="server" Width="250px"></asp:Label>
                                                    <input type="text" id="txtParentDeptID" runat="server" value="0" style="display: none">
                                                </div>
                                            </td>
                                            <td>
                                                <div align="right">
                                                    <img id="ImgParentName" alt="نام واحد سازماني مافوق" onclick="OnClickBtnParentName(),OnClickDepControls()"
                                                        src="/FrmPresentation/App_Utility/Images/Icons/select.png" style="cursor: pointer;" /></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 20px">
                                            </td>
                                            <td>
                                                <div align="right">
                                                    نوع واحد :</div>
                                            </td>
                                            <td>
                                                <div align="right">
                                                    <select id="SelOrgType" runat="server" class="TxtControls" style="width: 150px" onclick="OnClickDepControls()">
                                                        <option></option>
                                                    </select></div>
                                            </td>
                                            <td style="width: 50px">
                                            </td>
                                            <td>
                                                <div align="right">
                                                    کد واحد :</div>
                                            </td>
                                            <td>
                                                <div align="right">
                                                    <input id="txtDepartmentCode" runat="server" style="width: 250px; height: 20px;"
                                                        type="text" class="TxtControls" onclick="OnClickDepControls()" /></div>
                                            </td>
                                            <td align="right" style="height: 11px">
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:HiddenField ID="txtNewDepartmentCode" runat="server" />
                             <asp:HiddenField ID="txtNewDepartmentID" runat="server" />
                            <asp:HiddenField ID="txtDepartmentID" runat="server" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmitDept" EventName="click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </ComponentArt:PageView>
            <ComponentArt:PageView ID="PageView8" CssClass="PageContent" runat="server">
                <!-- Add content for page 5 here -->
                <div id="GroupTitle">
                    <table width="100%" dir="rtl">
                        <tr>
                            <td align="center" valign="middle">
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div align="center" style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #b0c4de; height: 288px;">
                                            <asp:PlaceHolder ID="GroupTitlePlaceholder" runat="Server" />
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </div>
            </ComponentArt:PageView>
        </ComponentArt:MultiPage>
    </div>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtMonthly" name="txtSubmit" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
        <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmitExtended" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
      
        <asp:Button ID="BtnSubmitCheckPersonCode" runat="server" Text="BtnSubmitCheckPersonCode"
            OnClick="BtnSubmitCheckPersonCode_Click" />
        <asp:Button ID="BtnSubmitDept" runat="server" Text="BtnSubmitDept" OnClick="BtnSubmitDept_Click" />
        <asp:Button ID="BtnSubmitCheckCard" runat="server" Text="BtnSubmitCard" OnClick="BtnSubmitCheckCard_Click" />
        <asp:Button ID="BtnFilterShiftGroup" runat="server" Text="BtnSubmitCard" OnClick="BtnFilterShiftGroup_Click" />
        <input type="text" id="txtPicPatch" runat="server" name="txtPicPatch" />
        <input type="text" id="txtActive" name="txtActive" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtEmployDate" name="txtEmployDate" runat="server" />
        <input type="text" id="txtWorkingDate" name="txtWorkingDate" runat="server" />
        <input type="text" id="txtExitDate" name="txtExitDate" runat="server" />
        <input type="text" id="txtWFTemplateXml" name="txtWFTemplateXml" runat="server" />
        <input type="text" id="txtWFDapartmentXml" name="txtWFDapartmentXml" runat="server" />
        <input type="text" id="txtRoleID" name="txtRoleID" runat="server" />
        <input type="text" id="txtMemberType" name="txtMemberType" runat="server" />
        <input type="text" id="txtXmlMemberGroup" name="txtXmlMemberGroup" runat="server" />
        <input type="text" id="txtOldActive" name="txtOldActive" runat="server" />
        <input type="text" id="txtDepartmentOld" name="txtDepartmentOld" runat="server" />
        <input type="text" id="txtValue" name="txtValue" runat="server" />
        <input type="text" id="txtMaxPrsKey" name="txtMaxPrsKey" runat="server" />
        <input type="text" id="txtMaxUsrKey" name="txtMaxUsrKey" runat="server" />
        <input type="text" id="txtMaxPerson" name="txtMaxPerson" runat="server" />
        <input type="text" id="txtMaxUser" name="txtMaxUser" runat="server" />
        <input type="text" id="txtActiveUser" name="txtActiveUser" runat="server" value="0" />
        <input type="text" id="txtKCalUserSDate" name="txtKCalUserSDate" runat="server" />
        <input type="text" id="txtKCalUserEDate" name="txtKCalUserEDate" runat="server" />
        <input type="text" id="txtDefaultPassPCode" name="txtDefaultPassPCode" runat="server" />
        <input type="text" id="txtCurrentDate" name="txtCurrentDate" runat="server" />
        <input type="text" id="txtOldSDate" name="txtOldSDate" runat="server" />
        <input type="text" id="txtOldEDate" name="txtOldEDate" runat="server" />
        <input type="text" id="txtOldUserName" name="txtOldUserName" runat="server" />
        <input type="text" id="txtDepartmentIDTemp" name="txtDepartmentIDTemp" runat="server" />
        <input type="text" id="txtOldUserActive" name="txtOldUserActive" runat="server" />
        <input type="text" id="txtAccessNew" name="txtAccessNew" runat="server" />
    </div>
    <%-- image preload (not necessary but it improves page performance) --%>
    <div style="position: absolute; top: 0px; left: 0px; visibility: hidden">
        <img src="../../../App_Utility/Images/ModifyPersonImage/tab_bg.gif" width="0" height="0"
            alt="" />
        <img src="../../../App_Utility/Images/ModifyPersonImage/hover_tab_bg.gif" width="0"
            height="0" alt="" />
        <img src="../../../App_Utility/Images/ModifyPersonImage/selected_tab_bg.gif" width="0"
            height="0" alt="" />
        <img src="../../../App_Utility/Images/ModifyPersonImage/hover_scroll_item_bg.gif"
            width="0" height="0" alt="" />
    </div>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = null;
        var lastPersonCode = "";
        var lastPersonFName = "";
        var lastPersonLName = "";
        var DeptPersonGridRowIndex = ''
        var SaveFlag = true;
        var DepFlag = false;
        var CountChkGroup = 0;
        var CountChkWorkFlow = 0;
        var StrWFTemplateChk = "";
        document.getElementsByTagName("body")[0].scroll = "no";
        //**********************************Hidden Button With Not Access**********************************
        if ($get(MasterObj + "txtAccessNew").value == "0") {
            document.getElementById('OToolBar_BtnNew').style.display = "none"
            document.getElementById('OToolBar_BtnSaveNew').style.display = "none"
        }
        //**********************************Disable User Tab In New Mode **********************************
        if ($get(MasterObj + "ChkUserAccount").checked == false) {
            $get(MasterObj + "lblUserName").disabled = true;
            $get(MasterObj + "txtPass").disabled = true;
            $get(MasterObj + "txtConfirmPass").disabled = true;
            $get(MasterObj + "KCalSDateUserAcces_txtCalendar").disabled = true;
            $get(MasterObj + "KCalSDateUserAcces_btnImg").disabled = true;
            $get(MasterObj + "KCalEDateUserAcces_txtCalendar").disabled = true;
            $get(MasterObj + "KCalEDateUserAcces_btnImg").disabled = true;
            $get(MasterObj + "rdDActiveUser").disabled = true;
            $get(MasterObj + "rdActiveUser").disabled = true;
        }
        //*********************************Set Password with Default Pass *********************************
        if ($get(MasterObj + "txtDefaultPassPCode").value == "1" && $get(MasterObj + "txtUserID").value == "0") {
            $get(MasterObj + "txtPass").value = $get(MasterObj + "txtPersonCode").value;
            $get(MasterObj + "txtConfirmPass").value = $get(MasterObj + "txtPersonCode").value;
        }
        //*********************************Close Page where Key Has Problem********************************
        if ($get(MasterObj + "txtValue").value == "1" && $get(MasterObj + "txtValidate").value == "5") {
            alert($get(MasterObj + "txtAlert").value)
            window.close();
        }
        //**********************************Show Personel Image********************************************
        if (document.getElementById(MasterObj + "txtPicPatch").value != "")
            document.getElementById(MasterObj + "TdImg").src = document.getElementById(MasterObj + "txtPicPatch").value;
        else if (document.getElementById(MasterObj + "TDImg").src == "")
            document.getElementById(MasterObj + "TDImg").src = "../../../App_Utility/Images/ModifyPersonImage/userpic.jpg"
        //**************************************DECLARATION***********************************************************
        if (document.getElementById(MasterObj + "txtPersonCode").value == "0")
            document.getElementById(MasterObj + "txtPersonCode").value = "";

        lastPersonCode = document.getElementById(MasterObj + "txtPersonCode").value
        lastPersonFName = document.getElementById(MasterObj + "txtFName").value
        lastPersonLName = document.getElementById(MasterObj + "txtLName").value

        //*************************************For Monthly Page************************************
        if ($get(MasterObj + "txtMonthly").value == 1) {
            $get(MasterObj + "txtPersonCode").disabled = true;
            $get(MasterObj + "txtFName").disabled = true;
            $get(MasterObj + "txtLName").disabled = true;
            $get(MasterObj + "CmbBornPlace").disabled = true;
            $get(MasterObj + "txtIdentifierNo").disabled = true;
            $get(MasterObj + "txtFatherName").disabled = true;
            $get(MasterObj + "txtNationalNo").disabled = true;
            $get(MasterObj + "CmbMarriage").disabled = true;
            $get(MasterObj + "CmbSex").disabled = true;
            $get(MasterObj + "CmbSodor").disabled = true;
            $get(MasterObj + "txtEmailAddress").disabled = true;
            $get(MasterObj + "rdActive").disabled = true;
            $get(MasterObj + "rdDeactive").disabled = true;
            $get(MasterObj + "txtMobileNo").disabled = true;
            $get(MasterObj + "KCalEmployDate_txtCalendar").disabled = true;
            $get(MasterObj + "KCalExitDate_txtCalendar").disabled = true;
            $get(MasterObj + "KCalWorkingDate_txtCalendar").disabled = true;
            $get(MasterObj + "BirthDate_txtCalendar").disabled = true;
            $get(MasterObj + "lblPic").disabled = true;
            $get(MasterObj + "DelImg").disabled = true;
            //---------------------------------------------------------------
            $get(MasterObj + "txtPass").disabled = true;
            $get(MasterObj + "txtConfirmPass").disabled = true;
            $get(MasterObj + "ChkUserAccount").disabled = true;
            $get(MasterObj + "KCalSDateUserAcces_txtCalendar").disabled = true;
            $get(MasterObj + "KCalEDateUserAcces_txtCalendar").disabled = true;
            $get(MasterObj + "rdDActiveUser").disabled = true;
            $get(MasterObj + "rdActiveUser").disabled = true;
            //----------------------------------------------------------
            var OGrdCard = document.getElementById("GrdCard");
            for (var i = 1; i < OGrdCard.rows.length; i++) {
                OGrdCard.rows(i).cells(0).firstChild.disabled = true;
                OGrdCard.rows(i).cells(1).firstChild.disabled = true;
                OGrdCard.rows(i).cells(2).firstChild.disabled = true;
                OGrdCard.rows(i).cells(4).firstChild.disabled = true;
                OGrdCard.rows(i).cells(5).firstChild.disabled = true;
            }
            //----------------------------------------------------------
            $get(MasterObj + "CmbRoleType").disabled = true;
            $get(MasterObj + "txtRoleTitle").disabled = true;
            $get("ImgSelectDepartment").disabled = true;
            $get(MasterObj + "txtOrgName").disabled = true;
            $get("ImgParentName").disabled = true;
            $get(MasterObj + "SelOrgType").disabled = true;
            $get(MasterObj + "txtDepartmentCode").disabled = true;
            $get("rdExistsDept").disabled = true;
            $get("rdNewDept").disabled = true;
            //--------------------------------------------------------------
            document.getElementById('TdToolbar').style.visibility = "hidden";
            document.getElementById('OToolBar_BtnSave').style.visibility = "hidden";
            document.getElementById('OToolBar_BtnSaveNew').style.visibility = "hidden";
            document.getElementById('OToolBar_BtnNew').style.visibility = "hidden";
        }
        //*************************************OnLoad*************************************
        document.body.attachEvent('onkeydown', SetEnter)
        document.body.attachEvent('onkeypress', SetEnter)
        //===============================================================================
        function SetEnter() {
            if (event.srcElement.id == MasterObj + "CmbGroupShiftPersonel") {
                if (window.event.keyCode == 13)
                    OnClickBtnFilter();
            }
        }
        //===============================================================================
        function OnClickBtnNew() {
            PrsID = "";
            $get(MasterObj + "TDPersonCode").innerText = "";
            $get(MasterObj + "TDFullName").innerHTML = "&nbsp;";
            $get(MasterObj + "txtPersonCode").value = ""
            $get(MasterObj + "txtLName").value = ""
            $get(MasterObj + "txtFName").value = ""
            $get(MasterObj + "txtFatherName").value = ""
            $get(MasterObj + "txtIdentifierNo").value = ""
            $get(MasterObj + "txtNationalNo").value = ""
            $get(MasterObj + "CmbBornPlace").value = "0"
            $get(MasterObj + "txtMobileNo").value = ""
            $get(MasterObj + "txtEmailAddress").value = ""
            $get(MasterObj + "CmbBornPlace").value = "0"
            $get(MasterObj + "CmbSodor").value = "0"
            $get(MasterObj + "CmbMarriage").value = "0"
            $get(MasterObj + "CmbSex").value = "0"
            $get(MasterObj + "rdActive").checked = true
            $get(MasterObj + "rdDeactive").checked = false

            document.getElementById(MasterObj + "TDImg").src = "../../../App_Utility/Images/ModifyPersonImage/userpic.jpg"
            //تاریخ تولد
            $get(MasterObj + "BirthDate_txtDay").value = "";
            $get(MasterObj + "BirthDate_txtMonth").value = "";
            $get(MasterObj + "BirthDate_txtYear").value = "";
            $get(MasterObj + "BirthDate_txtCalendar").value = ""
            $get(MasterObj + "txtExitDate").value = ""
            $get(MasterObj + "txtEmployDate").value = ""
            $get(MasterObj + "txtWorkingDate").value = ""
            $get(MasterObj + "KCalWorkingDate_txtCalendar").value = ""
            $get(MasterObj + "KCalEmployDate_txtCalendar").value = ""
            $get(MasterObj + "KCalExitDate_txtCalendar").value = ""
            $get(MasterObj + "txtExtended").value = ""
            $get(MasterObj + "txtOldPersonCode").value = ""
            

            if ($get(MasterObj + "txtMonthly").value != 1) {
                $get(MasterObj + "lblUserName").value = "";
                $get(MasterObj + "txtPass").value = "";
                $get(MasterObj + "txtUserName").value = "";
                $get(MasterObj + "txtConfirmPass").value = "";
                $get(MasterObj + "ChkUserAccount").disabled = false;
                $get(MasterObj + "ChkUserAccount").checked = false;
                $get(MasterObj + "KCalSDateUserAcces_txtCalendar").value = "";
                $get(MasterObj + "KCalEDateUserAcces_txtCalendar").value = "";
                $get(MasterObj + "rdActiveUser").checked = true;
                ResetGrdCard();
                ResetDivDepartment();
                //  ResetGrdSubSysGroup();
                $get(MasterObj + "txtSubmit").value = "New"
                $get(MasterObj + "BtnSubmit").click();
            }

        }
        //===============================================================================
        function OnClickBtnUpload() {
            var url = "SelectPic.aspx?PersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value +
        "&ToPersonID=" + document.getElementById(MasterObj + "txtOnLineUser").value;
            // + "&PersonID=" + PrsID; //document.getElementById(MasterObj + "txtPersonID").value
            var StrFeatur = "dialogHeight: 200px;dialogWidth: 400px;center: Yes;help: no;status: no"
            var rv = window.showModalDialog(url, window, StrFeatur)
            var strPath = ""
            var PicPathLen = 0;
            if (rv != "" && rv != undefined) {
                document.getElementById(MasterObj + "txtPicPath").value = rv
                document.getElementById(MasterObj + "TDImg").src = rv
                PicPathLen = document.getElementById(MasterObj + "txtPicPath").value.length;
                document.getElementById(MasterObj + "txtPicFormat").value =
            document.getElementById(MasterObj + "txtPicPath").value.substr(PicPathLen - 3, 3)
            }
        }
        //===============================================================================
        function OnClickBtnDelPic() {
            var PicSrc = document.getElementById(MasterObj + "TDImg").src.split('/');
            var PicSrcLen = parseInt(PicSrc.length);
            var PicName = PicSrc[PicSrcLen - 1];
            var Strconfirm = "آيا مايل به حذف عکس پرسنل هستيد؟";
            if ($get(MasterObj + "txtPersonID").value == "0") {
                document.getElementById(MasterObj + "TDImg").src = "../../../App_Utility/Images/ModifyPersonImage/userpic.jpg"
                document.getElementById(MasterObj + "txtPicPath").value = "";
                document.getElementById(MasterObj + "txtPicFormat").value = "";
            }
            else if ($get(MasterObj + "txtPersonID").value != "0"
            && PicName != "userpic.jpg"
             && confirm(Strconfirm)) {
                document.getElementById(MasterObj + "TDImg").src = "../../../App_Utility/Images/ModifyPersonImage/userpic.jpg"
                $get(MasterObj + "txtSubmit").value = "DelPersonPic";
                document.getElementById(MasterObj + "BtnSubmitCheckPersonCode").click();
            }
        }
        //===============================================================================
        function OnClickBtnSave() {
            var EmployDate = document.getElementById(MasterObj + "KCalEmployDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEmployDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEmployDate_txtDay").value
            if (EmployDate == "//")
                EmployDate = "";
            SaveFlag = true;
            
            var UserEDate = 0;
            var CurrentDate = parseInt($get(MasterObj + "txtCurrentDate").value.replace("/", ""));
            //******************************چک کردن تعداد کاربران مجاز*************************
            if ($get(MasterObj + "txtValue").value == "1" && parseInt($get(MasterObj + "txtMaxUsrKey").value) > 0) {

                $get(MasterObj + "txtKCalUserSDate").value = $get(MasterObj + "KCalSDateUserAcces_txtYear").value + "/" + $get(MasterObj + "KCalSDateUserAcces_txtMonth").value + "/" + $get(MasterObj + "KCalSDateUserAcces_txtDay").value == "//" ? "" : $get(MasterObj + "KCalSDateUserAcces_txtYear").value + "/" + $get(MasterObj + "KCalSDateUserAcces_txtMonth").value + "/" + $get(MasterObj + "KCalSDateUserAcces_txtDay").value
                $get(MasterObj + "txtKCalUserEDate").value = $get(MasterObj + "KCalEDateUserAcces_txtYear").value + "/" + $get(MasterObj + "KCalEDateUserAcces_txtMonth").value + "/" + $get(MasterObj + "KCalEDateUserAcces_txtDay").value == "//" ? "" : $get(MasterObj + "KCalEDateUserAcces_txtYear").value + "/" + $get(MasterObj + "KCalEDateUserAcces_txtMonth").value + "/" + $get(MasterObj + "KCalEDateUserAcces_txtDay").value
                if ($get(MasterObj + "txtKCalUserEDate").value == "//")
                    $get(MasterObj + "txtKCalUserEDate").value = ""
                if ($get(MasterObj + "txtKCalUserEDate").value == "")
                    UserEDate = 13991230
                else
                    UserEDate = parseInt($get(MasterObj + "txtKCalUserEDate").value.replace("/", ""));
                if ($get(MasterObj + "ChkUserAccount").checked == true && parseInt($get(MasterObj + "txtMaxUser").value) >= parseInt($get(MasterObj + "txtMaxUsrKey").value) && $get(MasterObj + "rdActiveUser").checked == true && UserEDate >= CurrentDate) {
                    alert(" ثبت کاربران فعال بيشتر از حد مجاز است و کاربر مورد نظر غیر فعال ذخيره می شود ")
                    if ($get(MasterObj + "txtOldSDate").value != "") {
                        $get(MasterObj + "KCalSDateUserAcces_txtYear").value = $get(MasterObj + "txtOldSDate").value.substr(0, 4)
                        $get(MasterObj + "KCalSDateUserAcces_txtMonth").value = $get(MasterObj + "txtOldSDate").value.substr(5, 2)
                        $get(MasterObj + "KCalSDateUserAcces_txtDay").value = $get(MasterObj + "txtOldSDate").value.substr(8, 2)
                        $get(MasterObj + "KCalSDateUserAcces_txtCalendar").value = $get(MasterObj + "KCalSDateUserAcces_txtDay").value + "/" + $get(MasterObj + "KCalSDateUserAcces_txtMonth").value + "/" + $get(MasterObj + "KCalSDateUserAcces_txtYear").value
                        $get(MasterObj + "KCalSDateUserAcces_txtCalendar").value = $get(MasterObj + "KCalSDateUserAcces_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDateUserAcces_txtDay").value + "/" + $get(MasterObj + "KCalSDateUserAcces_txtMonth").value + "/" + $get(MasterObj + "KCalSDateUserAcces_txtYear").value)
                        $get(MasterObj + "txtKCalUserSDate").value = $get(MasterObj + "txtOldSDate").value;
                    }
                    if ($get(MasterObj + "txtOldEDate").value != "") {
                        $get(MasterObj + "KCalEDateUserAcces_txtYear").value = $get(MasterObj + "txtOldEDate").value.substr(0, 4)
                        $get(MasterObj + "KCalEDateUserAcces_txtMonth").value = $get(MasterObj + "txtOldEDate").value.substr(5, 2)
                        $get(MasterObj + "KCalEDateUserAcces_txtDay").value = $get(MasterObj + "txtOldEDate").value.substr(8, 2)
                        $get(MasterObj + "KCalEDateUserAcces_txtCalendar").value = $get(MasterObj + "KCalEDateUserAcces_txtDay").value + "/" + $get(MasterObj + "KCalEDateUserAcces_txtMonth").value + "/" + $get(MasterObj + "KCalEDateUserAcces_txtYear").value
                        $get(MasterObj + "KCalEDateUserAcces_txtCalendar").value = $get(MasterObj + "KCalEDateUserAcces_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDateUserAcces_txtDay").value + "/" + $get(MasterObj + "KCalEDateUserAcces_txtMonth").value + "/" + $get(MasterObj + "KCalEDateUserAcces_txtYear").value)
                        $get(MasterObj + "txtKCalUserEDate").value = $get(MasterObj + "txtOldEDate").value;
                    }
                    if ($get(MasterObj + "txtOldUserName").value != "") {
                        $get(MasterObj + "txtUserNameTemp").value = $get(MasterObj + "txtOldUserName").value
                        $get(MasterObj + "lblUserName").value = $get(MasterObj + "txtUserNameTemp").value
                    }
                    if ($get(MasterObj + "txtOldUserActive").value != "") {
                        $get(MasterObj + "txtActiveUser").value = $get(MasterObj + "txtOldUserActive").value
                        if ($get(MasterObj + "txtActiveUser").value == "1") {
                            $get(MasterObj + "rdActiveUser").checked = true;
                            $get(MasterObj + "rdDActiveUser").checked = false;
                        }
                        else {
                            $get(MasterObj + "rdActiveUser").checked = false;
                            $get(MasterObj + "rdDActiveUser").checked = true;
                        }
                    }
                    $get(MasterObj + "txtPass").value = "";
                    $get(MasterObj + "txtConfirmPass").value = "";
                }
            }
            //************************************************************************************
            if (document.getElementById(MasterObj + "txtPersonCode").value != "" && document.getElementById(MasterObj + "txtLName").value != "" && document.getElementById(MasterObj + "txtFName").value != ""
                  ) {
                SaveFlag = MakeXML();
                if (SaveFlag) {
                    if ($get(MasterObj + "rdActive").checked == true)
                        $get(MasterObj + "txtActive").value = "1";
                    else
                        $get(MasterObj + "txtActive").value = "0";

                    $get(MasterObj + "txtSubmit").value = "Save";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else {
                alert("لطفا در تب مشخصات پرسنل اطلاعات لازم را تکميل نماييد");
                if (document.getElementById(MasterObj + "txtPersonCode").value == "") {
                    document.getElementById("PersonCodeTD").style.color = "red";
                }

                if (document.getElementById(MasterObj + "txtPersonCode").value != "") {
                    document.getElementById("PersonCodeTD").style.color = "green";
                }
                if ($get(MasterObj + "txtLName").value != "") {
                    document.getElementById("LNameTD").style.color = "green";
                }
                if ($get(MasterObj + "txtLName").value == "") {
                    document.getElementById("LNameTD").style.color = "red";
                }
                if ($get(MasterObj + "txtFName").value != "") {
                    document.getElementById("NameTD").style.color = "green";
                }
                if ($get(MasterObj + "txtFName").value == "") {
                    document.getElementById("NameTD").style.color = "red";
                }
//                if(EmployDate=="")
//                    document.getElementById("EmployDateTD").style.color = "red";
            }

        }
        //===============================================================================
        function MakeXML(StrXml) {
            var TrueYear = 1399
            var ExitYear

            var StrXml = "";
            document.getElementById(MasterObj + "txtSaveXml").value = '';
            //----تاريخ تولد
            document.getElementById(MasterObj + "txtBirthDate").value = document.getElementById(MasterObj + "BirthDate_txtYear").value
         + "/" + document.getElementById(MasterObj + "BirthDate_txtMonth").value
          + "/" + document.getElementById(MasterObj + "BirthDate_txtDay").value
            if (document.getElementById(MasterObj + "txtBirthDate").value == "//")
                document.getElementById(MasterObj + "txtBirthDate").value = "";
            //----تاريخ شروع بکار
            document.getElementById(MasterObj + "txtWorkingDate").value = document.getElementById(MasterObj + "KCalWorkingDate_txtYear").value
         + "/" + document.getElementById(MasterObj + "KCalWorkingDate_txtMonth").value
          + "/" + document.getElementById(MasterObj + "KCalWorkingDate_txtDay").value
            if (document.getElementById(MasterObj + "txtWorkingDate").value == "//")
                document.getElementById(MasterObj + "txtWorkingDate").value = "";
            //-----------در صورت خالی بودن تاریخ شروع به کار
            if (document.getElementById(MasterObj + "txtWorkingDate").value == "")
                document.getElementById(MasterObj + "txtWorkingDate").value = "1300/01/01";
            //----تاريخ استخدام
            document.getElementById(MasterObj + "txtEmployDate").value = document.getElementById(MasterObj + "KCalEmployDate_txtYear").value
         + "/" + document.getElementById(MasterObj + "KCalEmployDate_txtMonth").value
          + "/" + document.getElementById(MasterObj + "KCalEmployDate_txtDay").value
            if (document.getElementById(MasterObj + "txtEmployDate").value == "//")
                document.getElementById(MasterObj + "txtEmployDate").value = "";
            //----تاريخ خاتمه کار
            document.getElementById(MasterObj + "txtExitDate").value = document.getElementById(MasterObj + "KCalExitDate_txtYear").value
         + "/" + document.getElementById(MasterObj + "KCalExitDate_txtMonth").value
          + "/" + document.getElementById(MasterObj + "KCalExitDate_txtDay").value
            if (document.getElementById(MasterObj + "txtExitDate").value == "//")
                document.getElementById(MasterObj + "txtExitDate").value = "";
            //----چک کردن تاریخ خاتمه به کار برای بزرگتر نبودن از 1400
            var TrueYear = 1399
            var ExitYear
            //****چک کردن تاریخ خاتمه به کار مجاز****
            ExitYear = $get(MasterObj + "KCalExitDate_txtYear").value
            if (document.getElementById(MasterObj + "txtExitDate").value != "") {
                if (ExitYear > TrueYear) {
                    alert("تاريخ خاتمه به کار نمي تواند بيشتر از 1399/12/30 انتخاب شود")
                    SaveFlag = false;
                    return;
                }
            }
            if (document.getElementById(MasterObj + "txtEmailAddress").value != ""
            && !email_validator(document.getElementById(MasterObj + "txtEmailAddress").value)) {
                alert("فرمت آدرس ايمیل نادرست است.")
                SaveFlag = false;
                return;
            }
            //***************************Card Tab********************************************************
            var OGrid = document.getElementById("GrdCard");
            var len = OGrid.rows.length
            StrXml += '<Root>';
            for (var i = 0; i < len; i++) {
                if (OGrid.rows(i).cells(0).firstChild.checked == true && OGrid.rows(i).cells(0).firstChild.disabled == false) {
                    if (OGrid.rows(i).cells(4).firstChild.value == "0" || OGrid.rows(i).cells(4).firstChild.value == "") {
                        alert("لطفا در تب کارت شماره کارت را وارد نماييد");
                        SaveFlag = false;
                        return;
                    }
                    else if (OGrid.rows(i).cells(1).firstChild.value == "") {
                        alert("لطفا در تب کارت از تاريخ را وارد نماييد ");
                        SaveFlag = false;
                        return;
                    }
                    else if (OGrid.rows(i).cells(2).firstChild.value == "") {
                        alert("لطفا در تب کارت تا تاريخ را وارد نماييد ");
                        SaveFlag = false;
                        return;
                    }
                    else {
                        var SD = OGrid.rows(i).cells(1).firstChild.value
                        var ED = OGrid.rows(i).cells(2).firstChild.value
                        SD = SD.substr(6, 4) + SD.substr(3, 2) + SD.substr(0, 2);
                        ED = ED.substr(6, 4) + ED.substr(3, 2) + ED.substr(0, 2);

                        var SubSDate = OGrid.rows(i).cells(1).firstChild.value
                        var SubEDate = OGrid.rows(i).cells(2).firstChild.value
                        SubSDate = SubSDate.substr(6, 4) + "/" + SubSDate.substr(3, 2) + "/" + SubSDate.substr(0, 2)
                        SubEDate = SubEDate.substr(6, 4) + "/" + SubEDate.substr(3, 2) + "/" + SubEDate.substr(0, 2)

                        if (parseInt(SD) <= parseInt(ED)) {
                            StrXml += '<CardTab>'
                            StrXml += "<CardTypeID>" + OGrid.rows(i).getAttribute('CardTypeID') + "</CardTypeID>"
                            StrXml += "<CardID>" + OGrid.rows(i).getAttribute('CardID') + "</CardID>"
                            StrXml += "<SubSysID>" + OGrid.rows(i).getAttribute('SystemID') + "</SubSysID>"
                            StrXml += "<CardNo>" + OGrid.rows(i).cells(4).firstChild.value + "</CardNo>"
                            StrXml += "<CardType>" + OGrid.rows(i).cells(5).firstChild.value + "</CardType>"
                            StrXml += "<SDate>" + SubSDate + "</SDate>"
                            StrXml += "<EDate>" + SubEDate + "</EDate>"
                            StrXml += '</CardTab>'
                        }
                        else {
                            alert('لطفا در تب کارت،دقت نماييد ' + String.fromCharCode('13') + 'تاريخ شروع بايد کوچکتر از تاريخ خاتمه باشد.');
                            SaveFlag = false;
                            return;
                            i = OGrid.rows.length;
                        }

                    }
                }
            }
            StrXml += '</Root>';
            document.getElementById(MasterObj + "txtCardTabXml").value = StrXml;
            //***************************Takmili Tab******************************************************
            SaveExtendedCode("txtExTabXml")
            //***************************GroupShiftPersonel Tab*********************************************
            StrXml = "";
            StrXml += '<Root>'
            var OGrdSubSysGroup = document.getElementById("GrdGroupShiftPersonel");
            if (OGrdSubSysGroup != null) {
                for (var i = 1; i < OGrdSubSysGroup.rows.length; i++) {
                    if (OGrdSubSysGroup.rows(i).cells(0).firstChild.checked == true &&
                OGrdSubSysGroup.rows(i).cells(0).firstChild.disabled == false) {
                        var SD = OGrdSubSysGroup.rows(i).cells(2).firstChild.value
                        var ED = OGrdSubSysGroup.rows(i).cells(3).firstChild.value
                        SD = SD.substr(6, 4) + SD.substr(3, 2) + SD.substr(0, 2);
                        ED = ED.substr(6, 4) + ED.substr(3, 2) + ED.substr(0, 2);

                        var SubSDate = OGrdSubSysGroup.rows(i).cells(2).firstChild.value
                        var SubEDate = OGrdSubSysGroup.rows(i).cells(3).firstChild.value
                        SubSDate = SubSDate.substr(0, 2) + "/" + SubSDate.substr(3, 2) + "/" + SubSDate.substr(8, 2)
                        SubEDate = SubEDate.substr(0, 2) + "/" + SubEDate.substr(3, 2) + "/" + SubEDate.substr(8, 2)

                        if (parseInt(SD) <= parseInt(ED)) {
                            StrXml += '<GroupMemberShip>'
                            StrXml += '<GroupID>' + OGrdSubSysGroup.rows(i).GroupID + '</GroupID>'
                            StrXml += '<SDate>' + SubSDate + '</SDate>'
                            StrXml += '<EDate>' + SubEDate + '</EDate>'
                            StrXml += '<Selected>1</Selected>'
                            StrXml += '</GroupMemberShip>'
                        }
                        else {
                            alert('لطفا در تب عضويت در گروهها،دقت نماييد ' + String.fromCharCode('13') + 'تاريخ شروع بايد کوچکتر از تاريخ خاتمه باشد.');
                            SaveFlag = false;
                            return;
                            i = OGrdSubSysGroup.rows.length;
                        }

                    }
                }
                StrXml += '</Root>'
                document.getElementById(MasterObj + "txtGroupTabXml").value = StrXml;


            }
            //***************************Department Tab***********************************************
            StrXml = "";
            if (DepFlag) {
                if ($get(MasterObj + "CmbRoleType").value == "0") {
                    alert("نوع سمت را انتخاب نمایید")
                    SaveFlag = false;
                    return;
                }
                else if ($get(MasterObj + "txtRoleTitle").value == "") {
                    alert("نام سمت را انتخاب نمایید")
                    SaveFlag = false;
                    return;
                }
                else if ($get("rdExistsDept").checked == true
                  && $get(MasterObj + "lblDepartment").innerText == "") {
                    alert("نام واحد سازماني را وارد نماييد");
                    SaveFlag = false;
                    return;
                }

                else if ($get("rdNewDept").checked == true) {
                    if (document.getElementById(MasterObj + "txtOrgName").value == "") {
                        alert("نام واحد سازماني را وارد نماييد");
                        SaveFlag = false;
                        return;
                    }
                    else if (CheckNotDuplicateDepName()) {
                        ChkNotEmptyNewDep();
                        if (document.getElementById(MasterObj + "SelOrgType").value == "48") {
                            alert('امکان ايجاد مدير عامل از اين صفحه وجود ندارد')
                            SaveFlag = false;
                            return;
                        }
                    }
                }
                var RoleID = 0;
                if (($get("rdExistsDept").checked == true && $get(MasterObj + "txtDepartmentOld").value != $get(MasterObj + "txtDeptID").value)
            || ($get("rdNewDept").checked == true && $get(MasterObj + "txtDepartmentOld").value != $get(MasterObj + "txtDepartmentID").value))
                    RoleID = 0;
                else
                    RoleID = $get(MasterObj + "txtRoleID").value
                StrXml += "<Tb>"
                if ($get("rdExistsDept").checked == true)
                    StrXml += "<DepartmentID>" + $get(MasterObj + "txtDeptID").value + "</DepartmentID>"

                else if ($get("rdNewDept").checked == true)
                    StrXml += "<DepartmentID>" + $get(MasterObj + "txtDepartmentID").value + "</DepartmentID>"
                StrXml += "<RoleType>" + $get(MasterObj + "CmbRoleType").value + "</RoleType>"
                StrXml += "<RoleTitle>" + $get(MasterObj + "txtRoleTitle").value + "</RoleTitle>"
                StrXml += "<PersonCode>" + $get(MasterObj + "txtPersonCode").value + "</PersonCode>"
                StrXml += "<RoleID>" + (RoleID == "" ? "0" : RoleID) + "</RoleID>"
                StrXml += "<Selected>1</Selected>"
                StrXml += "</Tb>"
                $get(MasterObj + "txtDeptTabXml").value = "<Root>" + StrXml + "</Root>"
            }
            //***************************UserInfo Tab***********************************************
            if ($get(MasterObj + "ChkUserAccount").checked) {
                if ($get(MasterObj + "lblUserName").value == "") {
                    alert("لطفا نام کاربري را وارد نماييد")
                    SaveFlag = false;
                    return;
                }
                if ($get(MasterObj + "txtPass").value == "" && $get(MasterObj + "txtUserID").value == "0") {
                    alert("لطفا کلمه عبور را وارد نماييد")
                    SaveFlag = false;
                    return;
                }
                if ($get(MasterObj + "txtPass").value != "" && $get(MasterObj + "txtPass").value.length < 6) {
                    alert("طول کلمه عبور نباید کمتر از ۶ حرف باشد!")
                    SaveFlag = false;
                    return;
                }
                if ($get(MasterObj + "txtConfirmPass").value == "" && $get(MasterObj + "txtUserID").value == "0") {
                    alert("لطفا تکرار کلمه عبور را وارد نماييد")
                    SaveFlag = false;
                    return;
                }
                if ($get(MasterObj + "txtPass").value != $get(MasterObj + "txtConfirmPass").value) {
                    alert("کلمه عبور و تکرار کلمه عبور يکسان نمی باشد")
                    SaveFlag = false;
                    return;
                }

                if ($get(MasterObj + "rdActiveUser").checked == true)
                    $get(MasterObj + "txtActiveUser").value = "1";
                else
                    $get(MasterObj + "txtActiveUser").value = "0";

                $get(MasterObj + "txtKCalUserSDate").value = $get(MasterObj + "KCalSDateUserAcces_txtYear").value + "/" + $get(MasterObj + "KCalSDateUserAcces_txtMonth").value + "/" + $get(MasterObj + "KCalSDateUserAcces_txtDay").value == "//" ? "" : $get(MasterObj + "KCalSDateUserAcces_txtYear").value + "/" + $get(MasterObj + "KCalSDateUserAcces_txtMonth").value + "/" + $get(MasterObj + "KCalSDateUserAcces_txtDay").value
                $get(MasterObj + "txtKCalUserEDate").value = $get(MasterObj + "KCalEDateUserAcces_txtYear").value + "/" + $get(MasterObj + "KCalEDateUserAcces_txtMonth").value + "/" + $get(MasterObj + "KCalEDateUserAcces_txtDay").value == "//" ? "" : $get(MasterObj + "KCalEDateUserAcces_txtYear").value + "/" + $get(MasterObj + "KCalEDateUserAcces_txtMonth").value + "/" + $get(MasterObj + "KCalEDateUserAcces_txtDay").value
                if ($get(MasterObj + "txtKCalUserSDate").value > $get(MasterObj + "txtKCalUserEDate").value) {
                    alert("در تب مشخصات کاربري تاريخ شروع دسترسي از تاريخ خاتمه بزرگتر است");
                    SaveFlag = false;
                    return;
                }
            }
            //***************************GroupTitle AccessTab*********************************************
            StrXml = "";
            StrXml += '<UserEntity>'
            var OGrdGroupTitle = document.getElementById("GrdGroupTitle");
            if (OGrdGroupTitle != null) {
                for (var i = 1; i < OGrdGroupTitle.rows.length; i++) {
                    if (OGrdGroupTitle.rows(i).cells(0).firstChild.checked == true &&
                    OGrdGroupTitle.rows(i).cells(0).firstChild.disabled == false) {
                        StrXml += '<MemberGroup>'
                        StrXml += '<GroupId>' + OGrdGroupTitle.rows(i).GroupID + '</GroupId>'
                        StrXml += '</MemberGroup>'
                    }
                }
                StrXml += '</UserEntity>'
                document.getElementById(MasterObj + "txtMemberType").value = 'U';
                document.getElementById(MasterObj + "txtXmlMemberGroup").value = StrXml;
            }
            //***************************************************************************************
            return SaveFlag;
        }
        //===============================================================================
        function OnClickBtnSaveNew() {
            if (document.getElementById(MasterObj + "txtPersonCode").value != "" && document.getElementById(MasterObj + "txtLName").value != "" && document.getElementById(MasterObj + "txtFName").value != "") {
                var SaveFlag = MakeXML()
                if (SaveFlag) {
                    if ($get(MasterObj + "rdActive").checked == true)
                        $get(MasterObj + "txtActive").value = "1";
                    else
                        $get(MasterObj + "txtActive").value = "0";

                    $get(MasterObj + "txtSubmit").value = "SaveNew";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else {
                alert("لطفا در تب مشخصات پرسنل اطلاعات لازم را تکميل نماييد");

                if (document.getElementById(MasterObj + "txtPersonCode").value == "")
                    document.getElementById("PersonCodeTD").style.color = "red";
                if (document.getElementById(MasterObj + "txtPersonCode").value != "")
                    document.getElementById("PersonCodeTD").style.color = "green";
                if ($get(MasterObj + "txtLName").value != "")
                    document.getElementById("LNameTD").style.color = "green";
                if ($get(MasterObj + "txtLName").value == "")
                    document.getElementById("LNameTD").style.color = "red";
                if ($get(MasterObj + "txtFName").value != "")
                    document.getElementById("NameTD").style.color = "green";
                if ($get(MasterObj + "txtFName").value == "")
                    document.getElementById("NameTD").style.color = "red";
            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnFilterShiftGroup").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onBlurTxtPersonCode() {
            var lenPersonCode = $get(MasterObj + "txtPersonCode").value.length
            var OkPCode = true;
            if ($get(MasterObj + "txtPersonCode").value != "") {
                if (!ChkKeyOfPCode($get(MasterObj + "txtPersonCode").value)) {
                    alert('فرمت کد پرسنلي اشتباه است')
                    $get(MasterObj + "txtPersonCode").value = lastPersonCode;
                    $get(MasterObj + "txtPersonCode").focus();
                    if ($get(MasterObj + "txtPersonCode").value == "")
                        document.getElementById("PersonCodeTD").style.color = "red";
                    OkPCode = false;
                }
                else if (lenPersonCode > 10) {
                    alert("شماره پرسنلی بیشتراز ده رقم غیر مجاز می باشد ")
                    $get(MasterObj + "txtPersonCode").value = lastPersonCode;
                    $get(MasterObj + "txtPersonCode").focus();
                    if ($get(MasterObj + "txtPersonCode").value == "")
                        document.getElementById("PersonCodeTD").style.color = "red";
                    OkPCode = false;
                }
                else if ($get(MasterObj + "txtPersonCode").value == "0") {
                    alert("شماره پرسنلی صفر غیر مجاز می باشد ")
                    $get(MasterObj + "txtPersonCode").value = lastPersonCode;
                    $get(MasterObj + "txtPersonCode").focus();
                    if ($get(MasterObj + "txtPersonCode").value == "")
                        document.getElementById("PersonCodeTD").style.color = "red";
                    OkPCode = false;
                }
                else if ($get(MasterObj + "txtPersonCode").value.substr(0, 1) == 0) {
                    alert("صفر در ابتداي شماره پرسنلي غير مجاز مي باشد ")
                    $get(MasterObj + "txtPersonCode").value = lastPersonCode;
                    $get(MasterObj + "txtPersonCode").focus();
                    if ($get(MasterObj + "txtPersonCode").value == "")
                        document.getElementById("PersonCodeTD").style.color = "red";
                    OkPCode = false;
                }
                else if (lenPersonCode == 10) {
                    if (!checkMelliCode($get(MasterObj + "txtPersonCode").value)) {
                        $get(MasterObj + "txtPersonCode").value = lastPersonCode;
                        $get(MasterObj + "txtPersonCode").focus();
                        if ($get(MasterObj + "txtPersonCode").value == "")
                            document.getElementById("PersonCodeTD").style.color = "red";
                        OkPCode = false;
                    }
                }
            }
            if (OkPCode && document.getElementById(MasterObj + "TDPersonCode").innerText == "") {
                if ($get(MasterObj + "txtPersonCode").value != lastPersonCode || lastPersonCode == "") {

                    if ($get(MasterObj + "txtPersonCode").value != $get(MasterObj + "TDPersonCode").innerText) {
                        $get(MasterObj + "lblUserName").value = $get(MasterObj + "txtPersonCode").value;
                        if ($get(MasterObj + "txtDefaultPassPCode").value == "1") {
                            $get(MasterObj + "txtPass").value = $get(MasterObj + "txtPersonCode").value;
                            $get(MasterObj + "txtConfirmPass").value = $get(MasterObj + "txtPersonCode").value;
                        }
                        $.ajax({
                            type: "POST",
                            url: "ModifyPersonNew.aspx/CheckPersonCode?SubmitMode=Ajax",
                            contentType: "application/json; charset=utf-8",
                            data: "{PersonCode:'" + $("#" + MasterObj + "txtPersonCode").val() + "' ,OnLineUser:'" + $("#" + MasterObj + "txtOnLineUser").val() + "', CompanyID:'" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val() + "' , SessionID:'" + $("#" + MasterObj + "txtSessionID").val() + "' }",
                            success: function (Data) {
                                // alert(Data.d)
                                if (Data.d == 0) {
                                    $("#" + MasterObj + "txtAlertCheckPCode").val("");
                                    document.getElementById("PersonCodeTD").innerHTML = "<div style='color: green;'>* شماره پرسنلي :</div>"
                                }
                                else {
                                    $("#" + MasterObj + "txtAlertCheckPCode").val("شماره پرسنلی تکراری است");
                                    $get(MasterObj + "txtAlert").value = $get(MasterObj + "txtAlertCheckPCode").value
                                    alert($get(MasterObj + "txtAlert").value);
                                    $get(MasterObj + "txtPersonCode").focus();
                                    $get(MasterObj + "txtPersonCode").value = "";
                                    $get(MasterObj + "lblUserName").value = "";
                                    $get(MasterObj + "txtPass").value = "";
                                    $get(MasterObj + "txtConfirmPass").value = "";
                                    $get(MasterObj + "KCalSDateUserAcces_txtCalendar").value = "";
                                    $get(MasterObj + "KCalEDateUserAcces_txtCalendar").value = "";
                                    document.getElementById("PersonCodeTD").innerHTML = "<div style='color: red; '>* شماره پرسنلي :</div>"
                                }

                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                CloseModelPopup();
                                alert("ذخيره با خطا مواجه شد");
                            }
                        });
                    }
                    if ($get(MasterObj + "txtPersonCode").value == "")
                        document.getElementById("PersonCodeTD").style.color = "red";
                }
            }
        }
        //===============================================================================
        function onBlurTxtLName() {
            if (lastPersonLName != $get(MasterObj + "txtLName").value || lastPersonLName == "") {
                if ($get(MasterObj + "txtLName").value != "")
                    document.getElementById("LNameTD").style.color = "green";
                if ($get(MasterObj + "txtLName").value == "")
                    document.getElementById("LNameTD").style.color = "red";
            }
        }
        //===============================================================================
        function OnBlurTxtFName() {
            if (lastPersonFName != $get(MasterObj + "txtFName").value || lastPersonLName == "") {
                if ($get(MasterObj + "txtFName").value != "") {
                    document.getElementById("NameTD").style.color = "green";
                }
                if ($get(MasterObj + "txtFName").value == "") {
                    document.getElementById("NameTD").style.color = "red";
                }
            }
        }
        //===============================================================================
        function OnBlurCardNo(obj) {
            var OGrdCard = document.getElementById("GrdCard");
            if (obj.value != "" & obj.value != "0") {
                var SelectedRow = obj.parentElement.parentElement;
                $get(MasterObj + "txtCardNo").value = obj.value + ";" + SelectedRow.getAttribute("SystemID");

                $get(MasterObj + "txtGrdCardRowIndex").value = SelectedRow.rowIndex;
                $get(MasterObj + "txtSubmit").value = "CheckCardNo";
                document.getElementById(MasterObj + "BtnSubmitCheckCard").click();

            }
        }
        //===============================================================================
        function OnFocusCardNo(obj) {
            var SelectedRow = obj.parentElement.parentElement;
            SelectedRow.cells(0).firstChild.disabled = true;
            SelectedRow.cells(1).firstChild.disabled = true;
            SelectedRow.cells(2).firstChild.disabled = true;
            SelectedRow.cells(5).firstChild.disabled = true;
            SelectedRow.cells(6).firstChild.disabled = true;
            if (SelectedRow.cells(0).firstChild.checked)
                $get(MasterObj + "txtCardNo").value = obj.value
            else
                $get(MasterObj + "txtCardNo").value = "0";
        }
        //===============================================================================
        function OnClickChkCard(obj) {
            var OGrdCard = document.getElementById("GrdCard");
            var RowIndex = obj.parentElement.parentElement.rowIndex;
            OGrdCard.rows(RowIndex).cells(6).firstChild.disabled = !obj.checked;

        }
        //===============================================================================
        function OnClickBtnNewRowCard(obj) {
            var OGrdCard = document.getElementById("GrdCard");
            var RowIndex = obj.parentElement.parentElement.rowIndex;

            if (OGrdCard.rows(RowIndex).cells(4).firstChild.value == "0") {
                alert("لطفا شماره کارت را وارد کنيد")
                return;
            }

            var oRow = OGrdCard.insertRow();
            var SubSysID = OGrdCard.rows(RowIndex).SystemID;
            var CardTypeID

            if (SubSysID == 13)
                CardTypeID = 1

            else if (SubSysID == 36)
                CardTypeID = 2

            oRow.setAttribute('SystemID', SubSysID);
            oRow.setAttribute('CardID', 0);
            oRow.setAttribute('CardTypeID', CardTypeID);

            var oCell0 = oRow.insertCell();
            oCell0.innerHTML = OGrdCard.rows(RowIndex).cells(0).innerHTML
            oCell0.firstChild.checked = false;

            var oCell1 = oRow.insertCell();
            oCell1.innerHTML = OGrdCard.rows(RowIndex).cells(1).innerHTML

            var oCell2 = oRow.insertCell();
            oCell2.innerHTML = OGrdCard.rows(RowIndex).cells(2).innerHTML

            var oCell3 = oRow.insertCell();
            oCell3.innerText = OGrdCard.rows(RowIndex).cells(3).innerText;

            var oCell4 = oRow.insertCell();
            oCell4.innerHTML = OGrdCard.rows(RowIndex).cells(4).innerHTML
            oCell4.firstChild.value = "0";

            var oCell5 = oRow.insertCell();
            oCell5.innerHTML = OGrdCard.rows(RowIndex).cells(5).innerHTML
            oCell5.firstChild.value = "9201";

            var oCell6 = oRow.insertCell();
            oCell6.innerHTML = OGrdCard.rows(RowIndex).cells(6).innerHTML
            oCell6.firstChild.disabled = true;
            //========================================================
            if (oRow.rowIndex % 2 == 1)
                oRow.className = "CssItemStyle";
            else
                oRow.className = "CssAlternatingItemStyle";
        }
        //===============================================================================
        function CheckRepeatCardNO(CardNo, SystemID) {
            var OGrdCard = document.getElementById("GrdCard");
            var Flag = true;
            for (var i = 1; i < OGrdCard.rows.length; i++) {
                if (OGrdCard.rows(i).getAttribute('CardID') == 0
                    & OGrdCard.rows(i).cells(0).firstChild.checked
                        & i != parseInt($get(MasterObj + "txtGrdCardRowIndex").value)) {
                    if (OGrdCard.rows(i).cells(4).firstChild.value == CardNo && OGrdCard.rows(i).getAttribute('SystemID') == SystemID) {
                        Flag = false;
                        i = OGrdCard.rows.length;
                    }
                }
            }
            return Flag
        }
        //===============================================================================
        function ResetGrdCard() {
            var OGrid = document.getElementById("GrdCard");
            var len = OGrid.rows.length
            for (var i = 1; i < len; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = false;
                OGrid.rows(i).cells(4).firstChild.value = ""
                OGrid.rows(i).cells(5).firstChild.value = 9201;
                OGrid.rows(i).cells(0).firstChild.disabled = false;
                OGrid.rows(i).cells(5).firstChild.disabled = false;
                OGrid.rows(i).cells(6).firstChild.disabled = false;
                OGrid.rows(i).cells(1).firstChild.disabled = false;
                OGrid.rows(i).cells(2).firstChild.disabled = false;
                OGrid.rows(i).setAttribute('CardID', 0)
            }
        }
        //===============================================================================
        function ResetGrdSubSysGroup() {
            if (document.getElementById("GrdGroupShiftPersonel") != null) {
                var OGrdSubSysGroup = document.getElementById("GrdGroupShiftPersonel");
                var GridLen = OGrdSubSysGroup.rows.length - 1
                for (var i = 1; i < GridLen; i++) {
                    OGrdSubSysGroup.rows(i).cells(0).firstChild.checked = false;
                    OGrdSubSysGroup.rows(i).cells(2).firstChild.value = "01/01/1300";
                    OGrdSubSysGroup.rows(i).cells(3).firstChild.value = "29/12/1399";
                    if (OGrdSubSysGroup.rows(i).getAttribute('GroupID') == OGrdSubSysGroup.rows(i + 1).getAttribute('GroupID')) {
                        var j = i + 1;
                        while (OGrdSubSysGroup.rows(i).getAttribute('GroupID') == OGrdSubSysGroup.rows(j).getAttribute('GroupID')) {
                            OGrdSubSysGroup.deleteRow(i + 1)
                            GridLen--;
                        }
                    }
                }
            }
        }
        //===============================================================================
        function ResetDivDepartment() {
            $get(MasterObj + "CmbRoleType").value = "0";
            $get(MasterObj + "txtRoleTitle").value = "";

            $get(MasterObj + "lblDepartment").innerText = "";
            $get(MasterObj + "txtDeptID").value = "";
            $get(MasterObj + "txtOrgName").value = "";

            $get(MasterObj + "lblParentName").innerText = "";
            $get(MasterObj + "txtParentDeptID").value = "0";

            $get(MasterObj + "SelOrgType").value = "0";
            $get(MasterObj + "txtDepartmentCode").value = "";
            $get("rdExistsDept").checked = true;
            $get("rdNewDept").checked = false;
        }
        //===============================================================================
        function OnMouseOverPic() {
            document.getElementById(MasterObj + "lblPic").style.color = "blueviolet";
        }
        //===============================================================================
        function OnMouseUpPic() {
            document.getElementById(MasterObj + "lblPic").style.color = "maroon";
        }
        //===============================================================================
        function OnClickBtnParentName() {
            url = "../OrganizationChart/SelectDepartment.aspx?ShowFlag=1&ShowTypeSelDept=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
        + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value;
            returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 850px;center: Yes;help: no;status: no")
            if (returnValue != "" & returnValue != undefined) {
                returnValue = returnValue.split('#')[1];
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(returnValue);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=1]");
                if (oXmlNodes.length > 0) {
                    $get(MasterObj + "txtParentDeptID").value = oXmlNodes.item(0).selectSingleNode("DepartmentID").text
                    $get(MasterObj + "lblParentName").innerText = oXmlNodes.item(0).selectSingleNode("Name").text
                }
            }
        }
        //===============================================================================
        function CheckNotDuplicateDepName() {
            root = "/GeneralEntity/Lcombo[Title='" + document.getElementById(MasterObj + "txtOrgName").value + "']";
            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            if ($get(MasterObj + "txtAllDepartmentXML").value == "")
                $get(MasterObj + "txtAllDepartmentXML").value = "<GeneralEntity></GeneralEntity>"
            xmlDoc.loadXML($get(MasterObj + "txtAllDepartmentXML").value);
            xmlDoc.setProperty("SelectionLanguage", "XPath");

            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes(root);

            var x = 0
            if (xmlNodes.length != 0) {
                alert("نام واحد سازماني تکراری است ")
                SaveFlag = false;
                return false;
            }
            return true
        }
        //===============================================================================
        function ChkNotEmptyNewDep() {
            if (document.getElementById(MasterObj + "txtOrgName").value == "" || document.getElementById(MasterObj + "txtOrgName").value == "0") {
                alert('لطفا نام واحد سازماني را وارد نماييد')
                SaveFlag = false;
                return
            }
            if (document.getElementById(MasterObj + "SelOrgType").value != "48") {
                if (document.getElementById(MasterObj + "lblParentName").innerText == "") {
                    SaveFlag = false;
                    alert('لطفا نام واحد مافوق را انتخاب کنيد')
                    return
                }
            }
            if (document.getElementById(MasterObj + "SelOrgType").value == "" || document.getElementById(MasterObj + "SelOrgType").value == "0") {
                alert('لطفا نوع واحد سازماني را انتخاب کنيد')
                SaveFlag = false;
                return
            }
            if (document.getElementById(MasterObj + "txtDepartmentCode").value == "" || document.getElementById(MasterObj + "txtDepartmentCode").value == "0") {
                alert('لطفا کد واحد سازماني را انتخاب کنيد')
                SaveFlag = false;
                return
            }
        }
        //===============================================================================
        function OnClickNewDep() {
            if ($get(MasterObj + "txtDepartmentID").value == "") {
                $get(MasterObj + "txtSubmit").value = "NewDepartmentProperties";
                $get(MasterObj + "BtnSubmitDept").click();
            }
        }
        //===============================================================================
        function OnClickDepControls() {
            DepFlag = true;
        }
        //===============================================================================
        function OnClickChkGroupPersonel(obj) {
            var rowIndex;
            var OGridGroup;
            var SDate1, EDate1, SDate2, EDate2, Flag1, Flag2;
            if (obj.checked == true)
                CountChkGroup++;
            else
                CountChkGroup--;
            if (CountChkGroup >= 2) {
                rowIndex = obj.parentElement.parentElement.rowIndex;
                OGridGroup = document.getElementById("GrdGroupShiftPersonel");
                SDate2 = OGridGroup.rows(rowIndex).cells(2).firstChild.value
                EDate2 = OGridGroup.rows(rowIndex).cells(3).firstChild.value
                SDate2 = SDate2.substr(6, 4) + SDate2.substr(3, 2) + SDate2.substr(0, 2);
                EDate2 = EDate2.substr(6, 4) + EDate2.substr(3, 2) + EDate2.substr(0, 2);
                Flag2 = OGridGroup.rows(rowIndex).getAttribute("Flags");
                for (var i = 1; i < OGridGroup.rows.length && i != rowIndex; i++) {
                    if (OGridGroup.rows(i).cells(0).firstChild.checked == true) {
                        SDate1 = OGridGroup.rows(i).cells(2).firstChild.value
                        EDate1 = OGridGroup.rows(i).cells(3).firstChild.value
                        SDate1 = SDate1.substr(6, 4) + SDate1.substr(3, 2) + SDate1.substr(0, 2);
                        EDate1 = EDate1.substr(6, 4) + EDate1.substr(3, 2) + EDate1.substr(0, 2);
                        Flag1 = OGridGroup.rows(i).getAttribute("Flags")
                        if ((Flag1 == 1) && (Flag2 == 1) && (((SDate2 < SDate1) && (SDate1 < EDate2))
                 || ((SDate2 < EDate1) && (EDate1 < EDate2))
                 || ((SDate1 < SDate2) && (SDate2 < EDate1))
                 || ((SDate1 < EDate2) && (EDate2 < EDate1))
                 || (SDate1 == SDate2)
                 || (EDate1 == EDate2))) {
                            alert("امکان انتخاب گروه های شيفتي  دارای بازه زماني مشترک وجود ندارد");
                            OGridGroup.rows(rowIndex).cells(0).firstChild.checked = false;
                            return;
                        }
                    }
                }
            }
        }
       
        //===============================================================================
        function SetChk() {
            var i = 0;
            var j = 0;
            var OGrid = document.getElementById("GrdWFTemplate");
            if (OGrid == null)
                return
            var PageSize = OGrid.rows.length
            var StrWFTemplateXml = "<BaseInfoEntity>" + StrWFTemplateChk + "</BaseInfoEntity>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(StrWFTemplateXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/WFTemplate");

            for (j = 0; j < oXmlNodes.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    if (OGrid.rows(i).cells(2).innerText == oXmlNodes.item(j).selectSingleNode("WFDocID").text) {
                        if (oXmlNodes.item(j).selectSingleNode("Selected").text == "1")
                            OGrid.rows(i).cells(0).firstChild.checked = true;
                        else
                            OGrid.rows(i).cells(0).firstChild.checked = false;
                    }
                }
            }
        }
        //===============================================================================
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //===============================================================================
        function OnClickActive() {
            if ($get(MasterObj + "rdDeactive").checked == true)
                alert("با غير فعال شدن فرد سمت وي نيز غير فعال مي شود");

            if ($get(MasterObj + "rdActive").checked == true && $get(MasterObj + "txtOldActive").value == "0")
                alert("با فعال شدن مجدد فرد سمت وي غير فعال باقي مي ماند");

        }
        //===============================================================================
        function OnFocuseTxtPass(field, e) {
            var Key = e.keyCode;
            if (Key != 46 && Key != 8)
                window.event.returnValue = null;
            if (Key != 16 && Key != 18 && Key != 46 && Key != 8) {
                if ((Key <= 57 && Key >= 48) ||
                    (Key <= 90 && Key >= 65))
                    field.value += (String.fromCharCode(Key).toString());
                else if ((Key <= 40 && Key >= 37) || (Key <= 105 && Key >= 96))
                    window.event.returnValue = Key;
            }
        }
        //=================================CheckUserForDongle=================================
        function OnClickUser() {
            if ($get(MasterObj + "ChkUserAccount").checked == false) {
                $get(MasterObj + "lblUserName").disabled = true;
                $get(MasterObj + "txtPass").disabled = true;
                $get(MasterObj + "txtConfirmPass").disabled = true;
                $get(MasterObj + "KCalSDateUserAcces_txtCalendar").disabled = true;
                $get(MasterObj + "KCalSDateUserAcces_btnImg").disabled = true;
                $get(MasterObj + "KCalEDateUserAcces_txtCalendar").disabled = true;
                $get(MasterObj + "KCalEDateUserAcces_btnImg").disabled = true;
                $get(MasterObj + "rdDActiveUser").disabled = true;
                $get(MasterObj + "rdActiveUser").disabled = true;
            }
            else {
                $get(MasterObj + "lblUserName").disabled = false;
                $get(MasterObj + "txtPass").disabled = false;
                $get(MasterObj + "txtConfirmPass").disabled = false;
                $get(MasterObj + "KCalSDateUserAcces_txtCalendar").disabled = false;
                $get(MasterObj + "KCalSDateUserAcces_btnImg").disabled = false;
                $get(MasterObj + "KCalEDateUserAcces_txtCalendar").disabled = false;
                $get(MasterObj + "KCalEDateUserAcces_btnImg").disabled = false;
                $get(MasterObj + "rdDActiveUser").disabled = false;
                $get(MasterObj + "rdActiveUser").disabled = false;
            }
        }
        //==============================================================================
        function OnClickActiveUser(obj) {
            if ($get(MasterObj + "ChkUserAccount").checked == true && $get(MasterObj + "rdActive").checked == false && $get(MasterObj + "rdActiveUser").checked == true) {
                alert("پرسنل غير فعال مي باشد، امکان فعال نمودن حساب کاربري وجود ندارد");
                $get(MasterObj + "rdDActiveUser").checked = true;
            }
        }
        //===============================================================================
        function OnClickBtnSelectDepartment() {
            url = "../OrganizationChart/SelectDepartment.aspx?ShowFlag=1&ShowTypeSelDept=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
        + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value;
            returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 850px;center: Yes;help: no;status: no")
            if (returnValue != "" & returnValue != undefined) {
                returnValue = returnValue.split('#')[1];
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(returnValue);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=1]");
                if (oXmlNodes.length > 0) {
                    $get(MasterObj + "txtDeptID").value = oXmlNodes.item(0).selectSingleNode("DepartmentID").text
                    $get(MasterObj + "lblDepartment").innerText = oXmlNodes.item(0).selectSingleNode("Name").text
                    $get(MasterObj + "lblParentDeptName").innerText = oXmlNodes.item(0).selectSingleNode("ParentName").text
                }
            }
        }
        //===============================================================================
        function OnClickChk(obj) {
        }
        //===============================================================================
        function checkMelliCode(meli_code) {
            if (meli_code == '1111111111' || meli_code == '2222222222' || meli_code == '3333333333' || meli_code == '4444444444' || meli_code == '5555555555' || meli_code == '6666666666' || meli_code == '7777777777' || meli_code == '8888888888' || meli_code == '9999999999') {
                alert('فقط کد ملي به عنوان شماره پرسنلي ده رقمي مجاز است');
            }
            else {
                c = parseInt(meli_code.charAt(9));
                n = parseInt(meli_code.charAt(0)) * 10 + parseInt(meli_code.charAt(1)) * 9 + parseInt(meli_code.charAt(2)) * 8 + parseInt(meli_code.charAt(3)) * 7 + parseInt(meli_code.charAt(4)) * 6 + parseInt(meli_code.charAt(5)) * 5 + parseInt(meli_code.charAt(6)) * 4 + parseInt(meli_code.charAt(7)) * 3 + parseInt(meli_code.charAt(8)) * 2;
                r = n - parseInt(n / 11) * 11;
                if ((r == 0 && r == c) || (r == 1 && c == 1) || (r > 1 && c == 11 - r)) {
                    return true;
                }
                else {
                    alert('فقط کد ملي به عنوان شماره پرسنلي ده رقمي مجاز است');
                    return false;
                }
            }
        }
        //===============================================================================
        function email_validator(email) {
            reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
            if (reg.test(email) == false) {
                return false;
            }
            return true;
        }
        //===============================================================================
        function ChkKeyOfPCode(obj) {
            var ObjCalendar = obj;
            var lenObj = ObjCalendar.length
            var key
            var eventObj
            var flag = true;
            for (var i = 0; i < lenObj; i++) {
                eventObj = ObjCalendar.substring(i, i + 1)

                key = eventObj.charCodeAt(0)
                if (!((((key >= 48) && (key <= 58)) || (key == 47) || (key == 189) ||
			(key == 191) ||
			(key == 67) ||
            (key == 111) || (key == 17) || (key == 231) ||
            (key == 8) || (key == 9) 
            ))) {
                    flag = false
                    i = lenObj;
                }
            }
            return flag;
        }
        //===============================================================================
    </script>
    <%--<script src="../../../App_Utility/Scripts/SHDate.js" type="text/javascript"></script>--%>
    <script src="../../../App_Utility/Scripts/General.js?v=1.1" type="text/javascript"></script>
    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/farsi.js"></script>
    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/KeySorting.js"></script>
</asp:Content>
