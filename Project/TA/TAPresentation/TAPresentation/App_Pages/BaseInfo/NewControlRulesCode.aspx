<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" CodeBehind="NewControlRulesCode.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.NewControlRulesCode" ValidateRequest ="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <script language ="javascript" type ="text/javascript" src="../../App_Utility/Scripts/Maskdiv.js"></script> 
    
    <table style="width: 91%;">
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <script type="text/javascript" language="javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {
                        
                    }
                    function EndRequestHandler(sender, args) {

                        var StrVal = $get(MasterObj + "txtSubmit").value

                        if (StrVal != "") {
                            if ($get(MasterObj + "txtAlert").value != "" &
                                    $get(MasterObj + "txtAlert").value != "RepeatInfo")
                                SetMsg($get(MasterObj + "txtAlert").value)
                            else if ($get(MasterObj + "txtAlert").value == "RepeatInfo")
                                alert("اطلاعات تکراري است")
                            ControlRuleID = $get(MasterObj + "txtControlRuleID").value    
                        }
                        $get(MasterObj + "txtSubmit").value = "";
                        $get(MasterObj + "txtAlert").value = "";
                    }
                </script>


                <uc1:ToolBar ID="OToolBar" runat="server" PageID="1344" PageName="NewControlRulesCode.aspx" />
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1" width="100%">
                    <tr>
                        <td style="width: 110px">
                            نوع قانون:</td>
                        <td style="width: 123px">
                            <asp:DropDownList ID="CmbControlRuleType" runat="server"  
                                name="a1" DataTextField="Title" DataValueField="Val"
                                Height="16px" Style="margin-right: 0px;" Width="100px">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 122px">
                            نام قانون:</td>
                        <td style="width: 144px">
                            <input id="txtControlRuleName" runat="server"  type="text" /></td>
                        <td style="width: 88px">
                            محدوده اجرا:</td>
                        <td> 
                            <asp:DropDownList ID="CmbPeriodType" runat="server"  onchange="OnChangeCmbPeriodType()"
                                name="a1" DataTextField="Title" DataValueField="Val"
                                Height="17px" Style="margin-right: 0px;" Width="100px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 110px">
                            دسته بندي:</td>
                        <td style="width: 123px">
                            <select id="CmbCategory" name="CmbCategory" style="width:100px" runat="server" onchange="OnChangeCmbGrdFirstCode()">
                                    <option></option>
                                </select></td>
                        <td style="width: 122px">
                            <input onclick="OnChangeCmbGrdFirstCode()" runat="server"
                                id="OptKasreKar" style="background-color: transparent" checked="true" type="radio" 
                                name="OptGroup" value="2">کسر حضور</td>
                        <td style="width: 144px">
                                &nbsp;<input id="OptMazadeKar" onclick="OnChangeCmbGrdFirstCode()" runat="server"
                                style="background-color: transparent" type="radio" name="OptGroup" value="1">مازادحضور
                        <td style="width: 88px">
                            مجوزفرعي:</td>
                        <td>
                                <select id="CmbDetailCode" name="CmbDetailCode" style="width: 100px" runat="server">
                                    <option></option>
                                </select></td>
                    </tr>
                    <tr>
                        <td style="width: 110px">
                            تابع:</td>
                        <td style="width: 123px">
                            <asp:DropDownList ID="CmbOperator" runat="server"  
                                name="a1" DataTextField="Title" DataValueField="Val"
                                Height="16px" Style="margin-right: 0px;" Width="100px">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 122px">
                            نوع(مفدار/زمان):</td>
                        <td style="width: 144px">
                            <asp:DropDownList ID="CmbControlValueType" runat="server"  onchange=OnChangeCmbControlValueType()
                                name="a1" DataTextField="Title" DataValueField="Val"
                                Height="16px" Style="margin-right: 0px;" Width="100px">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 88px">
                            مقدارمقايسه:</td>
                        <td>
                            <input id="txtControlValue" onkeydown="OnKeyDowntxtControlValue(this.value)" onblur="OnBlurtxtControlValue(this)" style="width:100px" runat="server"  type="text" /></td>
                    </tr>
                    <tr>
                        <td style="width: 110px">
                            زمان اجرا:</td>
                        <td style="width: 123px">
                            
                            <asp:DropDownList ID="CmbPerformingTime" runat="server"  onchange="OnChangeCmbPerformingTime()"
                                name="a1" DataTextField="Title" DataValueField="Val"
                                Height="16px" Style="margin-right: 0px;" Width="100px">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 122px">
                            کدسرريز:</td>
                        <td style="width: 144px">
                            &nbsp;<select id="CmbOverCode" name="CmbOverCode" style="width: 100px" runat="server">
                                <option></option>
                            </select></td>
                        <td style="width: 88px">
                            وضعيت:</td>
                        <td>
                            <input id="OptActive" name="G1" checked="true" runat="server" type="radio" 
                                                        value="1"  />فعال&nbsp;
                            <input id="OptDeActive" name="G1" runat="server" type="radio" 
                                                        value="2"  />غيرفعال</td>
                    </tr>
                    <tr>
                        <td style="width: 110px">
                            &nbsp;</td>
                        <td style="width: 123px">
                            
                            &nbsp;</td>
                        <td style="width: 122px; visibility:hidden">
                            کاردکس :</td>
                        <td style="width: 144px; visibility:hidden">
                            <input id="OptWOCardex" name="G2" checked="true" runat="server" type="radio" onclick="OnClickCardexOption()"
                                                        value="16"  />غير وابسته
                            <input id="OptWCardex" name="G2" runat="server" type="radio" onclick="OnClickCardexOption()"
                                                        value="17"  />وابسته</td>
                        <td style="width: 88px;visibility:hidden">
                            نام کاردکس:</td>
                        <td style="visibility:hidden">
                            <asp:DropDownList ID="CmbCardex" runat="server"  onchange="OnChangeCmbPerformingTime()"
                                name="a1" DataTextField="Title" DataValueField="Val"
                                Height="16px" Style="margin-right: 0px;" Width="100px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                                        </table>

                
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate> 
                       <div style="display:none">
                         <asp:HiddenField ID="txtXMLGrdSC" runat="server" />
                         <asp:HiddenField ID="txtAlert" runat="server" />
                         <input type="text" id="txtControlRuleID" name="txtControlRuleID" runat="server" />
                         <input type="text" id="txtXMLPeriod" name="txtXMLPeriod" runat="server" />
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
                    <input type="text" id="txtSaveXml" name="txtSaveXml" runat="server" />
                    <input type="text" id="txtCountWP" name="txtCountWP" runat="server" />
                    <input type="text" id="txtDetailCode" name="txtDetailCode" runat="server" />
                             <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">
        window.name = "NewControlRulesCode"
        aspnetForm.target = window.name//"NewControlRulesCode"
        //////////////////////////////////This Page//////////////////////////////////////
        var ControlRuleID = $get(MasterObj + "txtControlRuleID").value;
        var CntPeriodWork = "0";
        var ChangeFlag = false;
        ////////////////////////////////// OnLoad //////////////////////////////////////

        GetCntPeriodWork();
        //OnClickCardexOption();
        if (ControlRuleID != "0") {
            OnChangeCmbPerformingTime();
            OnChangeCmbGrdFirstCode();
            $get(MasterObj + "CmbDetailCode").value = $get(MasterObj + "txtDetailCode").value 
        }   
        //*******************************************************************************
        function OnClickBtnCancel() {
            window.close()
        }
        //*******************************************************************************
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            var strSave = ""
            //---------------------------------
            //--Check Full Control
            if ($get(MasterObj + "CmbControlRuleType").value==0)
            {
                alert("نوع قانون را وارد نماييد")
                return;
            }
            if ($get(MasterObj + "txtControlRuleName").value=="") {
                alert("نام قانون را وارد نماييد")
                return;
            }
            if ($get(MasterObj + "CmbPeriodType").value == 0) {
                alert("محدوده اجرا را وارد نماييد")
                return;
            }
            /*if ($get(MasterObj + "CmbBaseCode").value == 0) {
                alert("کد اصلي را وارد نماييد")
                return;
            }*/
            if ($get(MasterObj + "CmbDetailCode").value == 0) {
                alert("کد فرعي را وارد نماييد")
                return;
            }
            if ($get(MasterObj + "CmbOperator").value == 0) {
                alert("نام تابع را وارد نماييد")
                return;
            }
            if ($get(MasterObj + "CmbControlValueType").value == 0) {
                alert("نوع را وارد نماييد")
                return;
            }
            if ($get(MasterObj + "txtControlValue").value=="") {
                alert("مفدار مقايسه را وارد نماييد ")
                return;
            }
            if ($get(MasterObj + "CmbPerformingTime").value == 0) {
                alert("زمان اجرا را وارد نماييد")
                return;
            }
            if ($get(MasterObj + "CmbPerformingTime").value == 2
                    & $get(MasterObj + "CmbOverCode").value=='0') {
                alert("کد سرريز را انتخاب نماييد")
                return;
            }
            /*if ($get(MasterObj + "OptWCardex").checked & $get(MasterObj + "CmbCardex").value == "0") {
                alert("نام کاردکس را انتخاب نماييد")
                return; 
            }*/
            if (!$get(MasterObj + "OptActive").checked && !$get(MasterObj + "OptDeActive").checked) {
                alert("وضعيت فعال بودن را مشخص نماييد")
                return;
            }
            if (ChangeFlag & CntPeriodWork!="0") {
                alert("دوره هاي کارکردي مشمول قانون را انتخاب نماييد")
                return;                
            }
            //---------------------------------

            strSave += "<Root><Tb>"
            
            if ($get(MasterObj + "txtControlRuleID").value = "")
                $get(MasterObj + "txtControlRuleID").value = "0";
            strSave += "<ControlRuleID>" + ControlRuleID + "</ControlRuleID>"
            //strSave += "<ControlRuleID>" + $get(MasterObj + "txtControlRuleID").value + "</ControlRuleID>"
            strSave +="<ControlRuleType>"+$get(MasterObj + "CmbControlRuleType").value+"</ControlRuleType>"
            strSave +="<ControlRuleName>"+$get(MasterObj + "txtControlRuleName").value+"</ControlRuleName>"
            strSave +="<PeriodTypeID>"+$get(MasterObj + "CmbPeriodType").value+"</PeriodTypeID>"
            //strSave +="<BaseCode>"+$get(MasterObj + "CmbBaseCode").value+"</BaseCode>"
            strSave += "<BaseCode>" + (($get(MasterObj + "OptKasreKar").checked)? '053':'052') + "</BaseCode>"
            strSave +="<DetailCode>"+$get(MasterObj + "CmbDetailCode").value+"</DetailCode>"
            strSave +="<OperatorID>"+$get(MasterObj + "CmbOperator").value+"</OperatorID>"
            strSave +="<ControlValueTypeID>"+$get(MasterObj + "CmbControlValueType").value+"</ControlValueTypeID>"
            strSave +="<ControlValue>"+$get(MasterObj + "txtControlValue").value+"</ControlValue>"
            strSave +="<PerformingTime>"+$get(MasterObj + "CmbPerformingTime").value+"</PerformingTime>"
            strSave +="<OverCode>"+$get(MasterObj + "CmbOverCode").value+"</OverCode>"
            var Active=0;
            if ($get(MasterObj + "OptActive").checked==true)
                Active=1
            else if ($get(MasterObj + "OptDeActive").checked==true)
                Active = 0
            strSave += "<Active>" + Active + "</Active>"
            strSave += "<CardexID>0</CardexID>"
            //strSave += "<CardexID>" + (($get(MasterObj + "OptWOCardex").checked) ? "0" : $get(MasterObj + "CmbCardex").value) + "</CardexID>"
            strSave += "</Tb></Root>"


            document.getElementById(MasterObj + "txtSaveXml").value = strSave
            document.getElementById(MasterObj + "txtSubmit").value = "Save"
            document.getElementById(MasterObj + "BtnSubmit").click()
            
        }
        //*******************************************************************************
        function OnClickBtnNew() {

            ControlRuleID = "0";
            $get(MasterObj + "txtControlRuleID").value = "0";
            $get(MasterObj + "CmbControlRuleType").value = 0;
            $get(MasterObj + "txtControlRuleName").value = "";
            $get(MasterObj + "CmbPeriodType").value = 0;
            $get(MasterObj + "CmbCategory").value = 0;
            $get(MasterObj + "OptKasreKar").checked = true;
            //$get(MasterObj + "CmbBaseCode").value = 0;
            $get(MasterObj + "CmbDetailCode").value = 0;
            $get(MasterObj + "CmbOperator").value = 0;
            $get(MasterObj + "CmbControlValueType").value = 0;
            $get(MasterObj + "txtControlValue").value = "";
            $get(MasterObj + "CmbPerformingTime").value = 0;
            $get(MasterObj + "CmbOverCode").value = 0;
            $get(MasterObj + "OptActive").checked = true;
            $get(MasterObj + "txtXMLPeriod").value = "";

            OnChangeCmbGrdFirstCode();
        }
        //*******************************************************************************
        function OnClickBtnSelWorkPeriod() {
            var url = "ControlRulePeriod.aspx?ControlRuleID=" + ControlRuleID + " &CountWorkPeriod=" + CntPeriodWork + " &ModalType=2";
            var StrFeatur = 'dialogHeight: 600px;dialogWidth: 650px;center: Yes;help: no;status: no'
            var ReturnValue = window.showModalDialog(url, '', StrFeatur)
            if (ReturnValue != '' & ReturnValue != undefined) {
                $get(MasterObj + "txtXMLPeriod").value = ReturnValue
                ChangeFlag = false;
            }    
        }
        //*******************************************************************************
        function OnChangeCmbGrdFirstCode() {

            if ($get(MasterObj + 'txtXMLGrdSC').value != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + 'txtXMLGrdSC').value)

                var BaseCode = (($get(MasterObj + 'OptKasreKar').checked) ? '1' : '2'); 

                var xmlNodes;
                if ($get(MasterObj + 'CmbCategory').value != '0')
                    xmlNodes = oXmlDoc.documentElement.selectNodes('/GeneralEntity/LCombo [MainCategoryID=' + $get(MasterObj + 'CmbCategory').value + '][BaseCodeID=' + BaseCode + ']')
                else
                    xmlNodes = oXmlDoc.documentElement.selectNodes('/GeneralEntity/LCombo')    
                    
                LoadSecondCodeData($get(MasterObj + 'CmbDetailCode'), xmlNodes);
            }
        }
        //*******************************************************************************
        function LoadSecondCodeData(CmbObj, oXmlNodes) {
            CmbObj.innerHTML = "";
            var optionEl = document.createElement("OPTION");
            CmbObj.options.add(optionEl);
            CmbObj.all(0).value = "0";
            CmbObj.all(0).innerText = 'انتخاب نشده';

            if (oXmlNodes.length != 0)
                for (var i = 0; i < oXmlNodes.length; i++) {
                var optionEl = document.createElement("OPTION");
                CmbObj.options.add(optionEl);
                CmbObj.all(i + 1).value = oXmlNodes.item(i).selectSingleNode("Val").text;
                CmbObj.all(i + 1).innerText = oXmlNodes.item(i).selectSingleNode("Title").text;
            }
        }
        //*******************************************************************************
        function OnKeyDowntxtControlValue(Val) {
            if ($get(MasterObj + "CmbControlValueType").value == "1") //ساعت
                OnKeyDownTime(Val)
            else  //مقداري
                OnKeyDownInt(Val)
        }
        //*******************************************************************************
        function OnChangeCmbControlValueType() {
            $get(MasterObj + "txtControlValue").value = "";
        }
        //*******************************************************************************
        function OnBlurtxtControlValue(obj) {
            if ($get(MasterObj + "CmbControlValueType").value == "1") //ساعت
                Timechk(obj);
        }
        //*******************************************************************************
        function GetCntPeriodWork() {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false";
            oXmlDoc.loadXML($get(MasterObj + 'txtCountWP').value)

            var xmlNodes = oXmlDoc.documentElement.selectNodes('/GeneralEntity/LCombo [Val=' + $get(MasterObj + 'CmbPeriodType').value + ']')
            
            if (xmlNodes.length!=0)
                CntPeriodWork = xmlNodes.item(0).selectSingleNode('StrVal').text
            else
                CntPeriodWork = "0"
            
            if (CntPeriodWork == "0")
                document.getElementById('OToolBar_BtnSelWorkPeriod').disabled = true
            else 
                document.getElementById('OToolBar_BtnSelWorkPeriod').disabled=false
        }
        //*******************************************************************************
        function OnChangeCmbPeriodType() {
            GetCntPeriodWork();
            ChangeFlag = true;
        }
        //*******************************************************************************
        function OnChangeCmbPerformingTime() {
            //کد سرريز در صورتي فعال مي شود که زمان اجرا در هنگام محاسبه باشد
            if ($get(MasterObj + "CmbPerformingTime").value == "1") 
                $get(MasterObj + "CmbOverCode").disabled = true
            else
                $get(MasterObj + "CmbOverCode").disabled = false;    
        }
        //*******************************************************************************
        function OnClickCardexOption() {
            if ($get(MasterObj + "OptWOCardex").checked) {
                $get(MasterObj + "CmbCardex").value = "0";
                $get(MasterObj + "CmbCardex").disabled = true
            }
            else
                $get(MasterObj + "CmbCardex").disabled = false;     
        }
        //*******************************************************************************
    </script>

</asp:Content>

