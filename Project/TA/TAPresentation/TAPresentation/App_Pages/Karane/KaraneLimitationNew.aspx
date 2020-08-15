<%@ Page Title="-------------------------------------------------------------ثبت محدوديت کدهاي کارانه-------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="KaraneLimitationNew.aspx.cs" Inherits="TAPresentation.App_Pages.Karane.KaraneLimitationNew" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/MultiDepartment/MultiDepartment.ascx" TagName="MultiDepartment"
    TagPrefix="uc3" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table align="center" width="700px">
        <tr>
            <td align="center">
                <uc1:ToolBar id="OToolBar" runat="server" />
            </td>
        </tr>
    </table>
    <table align="center" width="700px" style="border: medium groove #C0C0C0; background-color: #DBE3F0;">
        <tr>
            <td>
                <table align="right" cellpadding="5" cellspacing="2">
                    <tr>
                        <td>
                            <input id="RDPerson" type="radio" name="RDFilter" value="0" />
                            پرسنلي
                        </td>
                        <td>
                            <uc2:combobox id="CmbPerson" runat="server" />
                        </td>
                        <td>
                            <input id="RDGroup" type="radio" name="RDFilter" value="1" />گروه
                        </td>
                        <td>
                            <select id="CmbGroup" name="CmbGroup" style="width: 160px" runat="server" class="TxtControls">
                                <option></option>
                            </select>
                        </td>
                        <td>
                            <input id="RDDepartment" type="radio" name="RDFilter" value="2" />
                            واحد سازماني
                        </td>
                        <td>
                            <uc3:multidepartment id="UCDepartment" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table align="right" >
                    <tr>
                        <td style="width:130px; ; text-align:right">
                         نام آيتم کارانه :
                        </td>
                        <td>
                            <select id="CmbKaraneRptName" name="CmbKaraneRptName" style="width: 215px" runat="server"
                                class="TxtControls" onchange="OnChangeCmbKaraneRptName()">
                                <option></option>
                            </select>
                        </td>
                        <td style="width:80px;  text-align:right">
                            کد کارانه :
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <select id="CmbKaraneField" name="CmbKaraneField" style="width: 215px" runat="server"
                                        class="TxtControls">
                                        <option></option>
                                    </select>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table align="right">
                    <tr>
                        <td style="width: 130px; text-align: right">
                            کف پرسنل :
                        </td>
                        <td>
                            <select style="width: 105px" id="CmbMinValType" class="TxtControls" runat="server">
                                <option></option>
                            </select>
                        </td>
                        <td>
                            <input type="text" id="txtMinPersonVal" class="TxtControls" onblur="onblurtxtValue(this,'CmbMinValType')"
                                onkeydown="OnKeyDownTimeNew(this,'CmbMinValType');" onfocus="OnFocusTxt(this)"
                                style="width: 105px" runat="server" value="00:00" />
                        </td>
                        <td style="width: 80px; text-align:right">
                            سقف پرسنل :
                        </td>
                        <td>
                            <select style="width: 105px" id="CmbMaxValType" class="TxtControls" runat="server">
                                <option></option>
                            </select>
                        </td>
                        <td>
                            <input type="text" id="txtMaxPersonVal" class="TxtControls" onblur="onblurtxtValue(this,'CmbMaxValType')"
                                onkeydown="OnKeyDownTimeNew(this,'CmbMaxValType');" onfocus="OnFocusTxt(this)"
                                style="width: 105px" runat="server" value="00:00" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
         <tr>
             <td>
                 <table align="right">
                     <tr>
                         <td style="width: 130px; text-align: right">
                             <input type="radio" id="rdMax"  onclick="OnClickRd()" name="MemberVal" runat="server" />
                             سقف گروه / واحد :
                         </td>
                         <td>
                             <select style="width: 105px" disabled="true" id="CmbMaxMemberType"  class="TxtControls"
                                 runat="server">
                                 <option></option>
                             </select>
                         </td>
                         <td>
                             <input type="text" id="txtMaxMemberVal" disabled="true" class="TxtControls" onblur="onblurtxtValue(this,'CmbMaxMemberType')" 
                             onkeydown="OnKeyDownTimeNew(this,'CmbMaxMemberType');"
                                 style="width: 105px" runat="server" onfocus="OnFocusTxt(this)"  value="00:00" />
                         </td>
                     </tr>
                 </table>
             </td>
        </tr> 
              <tr>
             <td>
                 <table align="right">
                     <tr>
                         <td style="width: 130px; text-align: right">
                             <input type="radio" id="rdAvg" onclick="OnClickRd()" checked="true" name="MemberVal" runat="server" />
                             ميانگين گروه / واحد :
                         </td>
                         <td>
                             <select style="width: 105px" id="CmbAvgMemberType"  class="TxtControls"
                                 runat="server">
                                 <option></option>
                             </select>
                         </td>
                         <td>
                             <input type="text" id="txtAvgMemberVal" class="TxtControls" onblur="onblurtxtValue(this,'CmbAvgMemberType')" 
                             onkeydown="OnKeyDownTimeNew(this,'CmbAvgMemberType');"
                                 style="width: 105px" runat="server" onfocus="OnFocusTxt(this)"  value="00:00" />
                         </td>
                     </tr>
                 </table>
             </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
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
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
        <input type="text" id="txtID" name="txtID" runat="server" />
        <input type="text" id="txtMemberID" name="txtMemberID" runat="server" />
        <input type="text" id="txtMType" name="txtMType" runat="server" />
    </div>
   <script src="../../App_Utility/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script>
        document.getElementsByTagName("body")[0].scroll = "no";
        document.dir = "RTL";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var MType, MemberID, SaveFlag = 0, MinValPerson, MaxValPerson, MaxMemberVal, AvgMemberVal;
        //==================================PageLoad=================================================================
        if ($get(MasterObj + "txtMaxMemberVal").value != "" && $get(MasterObj + "txtMaxMemberVal").value != "00:00") {
            $get(MasterObj + "rdMax").click();
            OnClickRd();
        }
        if ($get(MasterObj + "txtID").value != "0") {
            if ($get(MasterObj + "txtMType").value == "D") {
                $get(MasterObj + "UCDepartment_cmbDepartment").value = $get(MasterObj + "txtMemberID").value;
                $("#ctl00_ContentPlaceHolder1_CmbGroup").hide()
                $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").hide()
                $get(MasterObj + "UCDepartment_tbMain").all("BtnShowActive").style.display = "none";
                $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").show("slow");
                $("#RDDepartment").click();
            }
            else if ($get(MasterObj + "txtMType").value == "G") {
                $get(MasterObj + "CmbGroup").value = $get(MasterObj + "txtMemberID").value;
                $("#ctl00_ContentPlaceHolder1_CmbGroup").show("slow");
                $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").hide()
                $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").hide()
                $("#RDGroup").click();
            }
            else if ($get(MasterObj + "txtMType").value == "P") {
                $get(MasterObj + "CmbPerson_txtCode").value = $get(MasterObj + "txtMemberID").value;
                $("#ctl00_ContentPlaceHolder1_CmbGroup").hide()
                $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").show("slow");
                $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").hide()
                $("#RDPerson").click();
            }
        }
        else {
            $("#ctl00_ContentPlaceHolder1_CmbGroup").hide()
            $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").hide()
            $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").show("slow");
            $get(MasterObj + "UCDepartment_tbMain").all("BtnShowActive").style.display = "none";
            $("#RDDepartment").click();
        }
        //*******************************************************************************
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
        }
        //*******************************************************************************
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
            if (document.getElementById(MasterObj + "txtAlert").value != "") {
                if (document.getElementById(MasterObj + "txtValidate").value != "1")
                    alert($get(MasterObj + "txtAlert").value);
                else {
                    SaveFlag = 1;
                    window.returnValue = SaveFlag;
                    SetMsg($get(MasterObj + "txtAlert").value);
                }
            }
            document.getElementById(MasterObj + "txtAlert").value = ""
            document.getElementById(MasterObj + "txtValidate").value = ""
            document.getElementById(MasterObj + "txtSubmit").value = ""
        }
        //============================================================================= 
        $(document).ready(function () {
            $("#RDGroup").click(function () {
                var CheckVal = $('[name="RDFilter"]:checked').val()
                if (CheckVal == 1) {

                    $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").hide()
                    $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").hide()
                    $("#ctl00_ContentPlaceHolder1_CmbTableOffice").hide()
                    $("#ctl00_ContentPlaceHolder1_CmbGroup").show("slow")
                }
            })
            $("#RDPerson").click(function () {
                var CheckVal = $('[name="RDFilter"]:checked').val()
                if (CheckVal == 0) {
                    $("#ctl00_ContentPlaceHolder1_CmbGroup").hide()
                    $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").hide()
                    $("#ctl00_ContentPlaceHolder1_CmbTableOffice").hide()
                    $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").show("slow")
                }
            })
            $("#RDDepartment").click(function () {
                var CheckVal = $('[name="RDFilter"]:checked').val()
                if (CheckVal == 2) {
                    $("#ctl00_ContentPlaceHolder1_CmbGroup").hide()
                    $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").hide()
                    $("#ctl00_ContentPlaceHolder1_CmbTableOffice").hide()
                    $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").show("slow")
                }
            })

        })
        //==============================================================================================================
        function OnClickBtnSave() {
            if (ChkISEmty()) {
                var StrXml = "";
                StrXml += "<Root>";
                StrXml += "<Tb>";
                StrXml += "<ID>" + $get(MasterObj + "txtID").value + "</ID>";
                StrXml += "<ReportID>" + $get(MasterObj + "CmbKaraneRptName").value + "</ReportID>";
                StrXml += "<CodeID>" + (($get(MasterObj + "CmbKaraneField").value) == "" ? "0" : $get(MasterObj + 'CmbKaraneField').value) + "</CodeID>";
                StrXml += "<MemberID>" + MemberID + "</MemberID>";
                StrXml += "<MType>" + MType + "</MType>";
                StrXml += "<MinPersonVal>" + MinValPerson + "</MinPersonVal>";
                StrXml += "<MinPersonType>" + $get(MasterObj + "CmbMinValType").value + "</MinPersonType>";
                StrXml += "<MaxPersonVal>" + MaxValPerson + "</MaxPersonVal>";
                StrXml += "<MaxPersonType>" + $get(MasterObj + "CmbMaxValType").value + "</MaxPersonType>";
                if (MaxMemberVal != "00:00" && MaxMemberVal != "0") {
                    StrXml += "<MaxMemberVal>" + MaxMemberVal + "</MaxMemberVal>";
                    StrXml += "<MaxMemberType>" + $get(MasterObj + "CmbMaxMemberType").value + "</MaxMemberType>";
                }
                if (AvgMemberVal != "00:00" && AvgMemberVal != "0") {
                    StrXml += "<AvgMemberVal>" + AvgMemberVal + "</AvgMemberVal>";
                    StrXml += "<MaxMemberType>" + $get(MasterObj + "CmbAvgMemberType").value + "</MaxMemberType>";
                }
                StrXml += "</Tb>";
                StrXml += "</Root>";
                $get(MasterObj + "txtXmlSave").value = StrXml;
            
                $get(MasterObj + "txtSubmit").value = "Modify";
                $get(MasterObj + "BtnSubmit").click();
            }
        }
        //==============================================================================================================
        function ChkISEmty() {
            var CheckVal = $('[name="RDFilter"]:checked').val()
            switch (CheckVal) {
                case "0":
                    MType = "P";
                    MemberID = $get(MasterObj + "CmbPerson_txtCode").value;
                    break;
                case "1":
                    MType = "G";
                    MemberID = $get(MasterObj + "CmbGroup").value;
                    break;
                case "2":
                    MType = "D";
                    MemberID = $get(MasterObj + "UCDepartment_cmbDepartment").value;
                    break;
            }
            //-------------------------------------------------------------------------
            MinValPerson = $get(MasterObj + "txtMinPersonVal").value;
            if ($get(MasterObj + "CmbMinValType").selectedIndex == 0)
                MinValPerson = parseInt(MinValPerson.split(":")[0] * 60) + parseInt(MinValPerson.split(":")[1]);
            MaxValPerson = $get(MasterObj + "txtMaxPersonVal").value;
            if ($get(MasterObj + "CmbMaxValType").selectedIndex == 0)
                MaxValPerson = parseInt(MaxValPerson.split(":")[0] * 60) + parseInt(MaxValPerson.split(":")[1]);
            MaxMemberVal = $get(MasterObj + "txtMaxMemberVal").value;
            if ($get(MasterObj + "CmbMaxMemberType").selectedIndex == 0)
                MaxMemberVal = parseInt(MaxMemberVal.split(":")[0] * 60) + parseInt(MaxMemberVal.split(":")[1]);
            AvgMemberVal = $get(MasterObj + "txtAvgMemberVal").value;
            if ($get(MasterObj + "CmbAvgMemberType").selectedIndex == 0)
                AvgMemberVal = parseInt(AvgMemberVal.split(":")[0] * 60) + parseInt(AvgMemberVal.split(":")[1]);
            if ($get(MasterObj + "rdMax").checked)
                AvgMemberVal = "";
            if ($get(MasterObj + "rdAvg").checked)
                MaxMemberVal= "";
            //-------------------------------------------------------------------------
            if (MemberID == "" || MemberID == "0")
                alert("لطفا یک پرسنل /گروه /واحد را انتخاب کنيد");
            else if (MType != "P" && $get(MasterObj + "CmbKaraneField").value == "0")
                alert("لطفا کد مورد نظر را انتخاب نماييد");
//            else if (MType != "P" && (MaxValPerson == "00:00" || MaxValPerson == ""))
//                alert("لطفا سقف مقدار را برای يک پرسنل وارد نماييد");
//            else if (MType == "D" && (MaxMemberVal == "00:00" || MaxMemberVal == ""))
//                alert("لطفا سقف مقدار را برای واحد سازماني مورد نظر وارد نماييد");
//            else if (MType == "G" && (MaxMemberVal == "00:00" || MaxMemberVal == ""))
//                alert("لطفا سقف مقدار را برای گروه مورد نظر وارد نماييد");
            else
                return true;
        }
        //===============================================================================================================
        function OnChangeCmbKaraneRptName() {
            $get(MasterObj + "txtSubmit").value = "BindKaraneField";
            $get(MasterObj + "BtnSubmit").click();
        }
        //==============================================================================================================
        function OnKeyDownTimeNew(obj, SelectedItem) {
            if ($get(MasterObj + SelectedItem).value == "18701") 
                OnKeyDownTime(obj);
            else
                OnKeyDownInt(obj);
        }
        //==============================================================================================================
        function onblurtxtValue(obj, SelectedItem) {
            if (obj.value != "" || obj.value != "0") {
                if ($get(MasterObj + SelectedItem).selectedIndex == 0)
                    TimechkNew(obj);
                else
                    obj.value = obj.value.split(":")[0];
            }
        }
        //===============================================================================================================
        function TimechkNew(obj) {
            if (obj.value.split(":").length == 1)
                obj.value = obj.value + ":00";
            else
                if (obj.value.split(":")[1] > 59) {
                    alert("!لطفا ساعت صحيح را وارد کنيد");
                    obj.select();
                    obj.focus();
                }
        }
        //==============================================================================================================
        function OnClickBtnNew() {
            $get(MasterObj + "txtID").value = "";
            $get(MasterObj + "CmbKaraneField").value = "0";
            $get(MasterObj + "CmbMinValType").selectedIndex = 0;
            $get(MasterObj + "CmbMaxValType").selectedIndex = 0;
            $get(MasterObj + "CmbMaxMemberType").selectedIndex = 0;
            $get(MasterObj + "txtMinPersonVal").value = "00:00";
            $get(MasterObj + "txtMaxPersonVal").value = "00:00";
            $get(MasterObj + "txtMaxMemberVal").value = "00:00";
            $("#ctl00_ContentPlaceHolder1_CmbGroup").hide()
            $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").hide()
            $get(MasterObj + "UCDepartment_cmbDepartment").value = "0";
            $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").show("slow");
            $("#RDDepartment").click();
        }
        //==============================================================================================================
        function OnFocusTxt(obj) {
            obj.select();
            obj.focus();
        }
        //==============================================================================================================
        function OnClickRd() {

            if ($get(MasterObj + "rdMax").checked) {
                $get(MasterObj + "CmbMaxMemberType").disabled = false;
                $get(MasterObj + "txtMaxMemberVal").disabled = false;
                $get(MasterObj + "CmbAvgMemberType").disabled = true;
                $get(MasterObj + "txtAvgMemberVal").disabled = true;
            }
            else {
                $get(MasterObj + "CmbMaxMemberType").disabled = true;
                $get(MasterObj + "txtMaxMemberVal").disabled = true;
                $get(MasterObj + "CmbAvgMemberType").disabled = false;
                $get(MasterObj + "txtAvgMemberVal").disabled = false;
            }
            // 
        }
    </script>
</asp:Content>
