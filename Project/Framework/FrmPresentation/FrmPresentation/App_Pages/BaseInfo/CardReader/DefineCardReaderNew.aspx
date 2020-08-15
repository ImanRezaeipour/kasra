<%@ Page Title="---------------------------------------------تعريف کارتخوان---------------------------------------------------------------------------------"
    Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false"
    AutoEventWireup="true" CodeBehind="DefineCardReaderNew.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.DefineCardReaderNew" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="~/App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <script src="../../../App_Utility/Scripts/General.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        window.name = "DefineEzafekarModal.aspx"

        aspnetForm.target = window.name;
        var SaveFlag = 0;
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {

        }

        function EndRequestHandler(sender, args) {
            try {

                var StrVal = $get(MasterObj + "txtSubmit").value
                if ($get(MasterObj + "txtAlert").value != "") {
                    if (($get(MasterObj + "txtStatus").value == "2"))
                        alert($get(MasterObj + "txtAlert").value);
                    else {
                        SetMsg($get(MasterObj + "txtAlert").value);
                        SaveFlag = 1;
                        window.returnValue = SaveFlag;
                        window.close()
                    }

                }
               

                $get(MasterObj + "txtSubmit").value = "";
                $get(MasterObj + "txtAlert").value = "";
                $get(MasterObj + "txtStatus").value = "";
            }
            catch (Exception) {
                alert("اطلاعات ناقص است");
            }
        }
    </script>
    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" Paging="1" />
            </td>
        </tr>
        <tr>
            <td>
                <fieldset dir="rtl" style="height: 110px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                    border-left: lightblue thin outset; border-bottom: lightblue thin solid;" align="middle">
                    <legend style="color: lightblue"></legend>
                    <table id="Table1" align="right" style="width: 500px; height: 110px;" cellpadding="0"
                        cellspacing="0">
                        <tr>
                            <td>
                                <div align="right">
                                    تاريخ شروع :
                                </div>
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalSDate" runat="server" />
                            </td>
                            <td>
                                <div align="right">
                                    تاريخ پايان :
                                </div>
                            </td>
                            <td>
                                <uc3:KCalendar ID="KCalEDate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    زمان شروع :
                                </div>
                            </td>
                            <td>
                                <div dir="rtl" align="right">
                                    <input type="text" runat="server" id="txtFromTime" style="width: 120px" class="TxtControls" value="00:00"  onblur="Timechk(this)" onfocus="onFocusTime(this)" />
                                </div>
                            </td>
                            <td>
                                <div align="right">
                                    زمان پايان :
                                </div>
                            </td>
                            <td>
                                <div dir="rtl" align="right">
                                    <input type="text" runat="server" id="txtToTime" style="width: 120px" class="TxtControls" value="00:00"  onblur="Timechk(this)" onfocus="onFocusTime(this)"  />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    شماره کارتخوان :
                                </div>
                            </td>
                            <td>
                                <div dir="rtl" align="right">
                                    <input type="text" runat="server" id="txtCardReaderNo" style="width: 120px" class="TxtControls"
                                        onkeydown="OnKeyDownInt(this)" />
                                </div>
                            </td>
                            <td>
                                <div align="right">
                                    مدل کارتخوان :
                                </div>
                            </td>
                            <td>
                                <div dir="rtl" align="right">
                                    <asp:DropDownList runat="server" ID="CmbCardReaderModel" Style="width: 120px" CssClass="TxtControls">
                                    </asp:DropDownList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    نام کارتخوان :
                                </div>
                            </td>
                            <td>
                                <div dir="rtl" align="right">
                                    <input type="text" runat="server" id="txtCardReaderName" style="width: 120px" class="TxtControls" />
                                </div>
                            </td>
                            <td>
                                <div align="right">
                                    مکانيزم تخليه :
                                </div>
                            </td>
                            <td>
                                <div dir="rtl" align="right">
                                    <asp:DropDownList runat="server" ID="CmbTakhliye" Width="120px" CssClass="TxtControls">
                                    </asp:DropDownList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    محل نصب :
                                </div>
                            </td>
                            <td>
                                <div dir="rtl" align="right">
                                    <input type="text" runat="server" id="txtLocation" style="width: 120px" class="TxtControls" />
                                </div>
                            </td>
                            <td>
                                <div align="right">
                                    IP :
                                </div>
                            </td>
                            <td>
                                <div dir="rtl" align="right">
                                    <input type="text" runat="server" id="txtIP" style="width: 120px" class="TxtControls" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    TRT :
                                </div>
                            </td>
                            <td>
                                <div dir="rtl" align="right">
                                    <input type="text" runat="server" id="txtTRT" style="width: 120px" class="TxtControls"
                                        onkeydown="OnKeyDownInt(this)" />
                                </div>
                            </td>
                            <td>
                                <div align="right">
                                    وضعيت :
                                </div>
                            </td>
                            <td>
                                <div dir="rtl" align="right">
                                    <input type="radio" runat="server" id="ChkActive" />فعال
                                    <input type="radio" runat="server" id="ChkDeActive" />غير فعال
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:HiddenField ID="txtStatus" runat="server" />
                <asp:HiddenField ID="txtAlert" runat="server" />
                <asp:HiddenField ID="txtCardReaderID" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtActiveStatus" name="txtActiveStatus" runat="server" />
        <input type="text" id="txtSDate" name="txtSDate" runat="server" />
        <input type="text" id="txtEDate" name="txtEDate" runat="server" />
        <input type="text" id="txtStartTime" name="txtStartTime" runat="server" />
        <input type="text" id="txtEndTime" name="txtEndTime" runat="server" />
    </div>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var strChk = ""


         if ($get(MasterObj + "txtSDate").value != "" && $get(MasterObj + "txtEDate").value != "") {
               $get(MasterObj + "KCalSDate_txtDay").value = $get(MasterObj + "txtSDate").value.substr(0, 2)
               $get(MasterObj + "KCalSDate_txtMonth").value = $get(MasterObj + "txtSDate").value.substr(3, 2)
               $get(MasterObj + "KCalSDate_txtYear").value = $get(MasterObj + "txtSDate").value.substr(6, 5)
               $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
               $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)

               $get(MasterObj + "KCalEDate_txtDay").value = $get(MasterObj + "txtEDate").value.substr(0, 2)
               $get(MasterObj + "KCalEDate_txtMonth").value = $get(MasterObj + "txtEDate").value.substr(3, 2)
               $get(MasterObj + "KCalEDate_txtYear").value = $get(MasterObj + "txtEDate").value.substr(6, 5)
               $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
               $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)

}


//   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
           function OnClickBtnNew() {
               $get(MasterObj + "KCalSDate_txtDay").value = ""
               $get(MasterObj + "KCalSDate_txtMonth").value = ""
               $get(MasterObj + "KCalSDate_txtYear").value = ""
               $get(MasterObj + "KCalEDate_txtDay").value = ""
               $get(MasterObj + "KCalEDate_txtMonth").value = ""
               $get(MasterObj + "KCalEDate_txtYear").value = ""
               $get(MasterObj + "KCalSDate_txtCalendar").value = ""
               $get(MasterObj + "KCalEDate_txtCalendar").value = ""
               document.getElementById(MasterObj + "txtToTime").value = "";
               document.getElementById(MasterObj + "txtFromTime").value = "";
            document.getElementById(MasterObj + "txtCardReaderNo").value = "";
            document.getElementById(MasterObj + "CmbCardReaderModel").value = "0";
            document.getElementById(MasterObj + "txtCardReaderName").value = "";
            document.getElementById(MasterObj + "CmbTakhliye").value = "0";
            document.getElementById(MasterObj + "txtLocation").value = "";
            document.getElementById(MasterObj + "txtIP").value = "";
            document.getElementById(MasterObj + "txtTRT").value = "";
            $get(MasterObj + "ChkActive").checked = true;
            $get(MasterObj + "ChkDeActive").checked = false;
        }

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.returnValue = SaveFlag;
            window.close();
            
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            $get(MasterObj + "txtSDate").value  = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
             $get(MasterObj + "txtEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value

           
            if ($get(MasterObj + "txtSDate").value == "//")
                $get(MasterObj + "txtSDate").value = "";
                
            else  if ($get(MasterObj + "txtEDate").value == "//")
                $get(MasterObj + "txtEDate").value = "";

            try {


                if ($get(MasterObj + "txtSDate").value =="") {
                    alert("لطفا تاريخ شروع را وارد کنيد");
                    document.getElementById(MasterObj + "KCalSDate_txtCalendar").focus();

                }
                else

                    if ($get(MasterObj + "txtEDate").value == "") {
                        alert("لطفا تاريخ پایان را وارد کنيد");
                        document.getElementById(MasterObj + "KCalSDate_txtCalendar").focus();

                    }
                    else


                if ($get(MasterObj + "txtSDate").value > $get(MasterObj + "txtEDate").value) {
                            alert("تاريخ شروع بزرگتر از تاريخ پايان است");
                            document.getElementById(MasterObj + "KCalSDate_txtCalendar").focus();

                        }
                        else

                            if ($get(MasterObj + "txtFromTime").value =="") {
                                alert("لطفا ساعت شروع را وارد کنيد")
                                $get(MasterObj + "txtToTime").focus();

                            }
                            else

                                if ($get(MasterObj + "txtToTime").value == "") {
                                    alert("لطفا ساعت پایان را وارد کنيد")
                                    $get(MasterObj + "txtToTime").focus();

                                }
                                else

                                    if ($get(MasterObj + "txtFromTime").value > $get(MasterObj + "txtToTime").value) {
                                        alert("ساعت شروع بزرگتر از ساعت پايان است")
                                        $get(MasterObj + "txtToTime").focus();

                                    }

                                    else if ($get(MasterObj + "txtCardReaderNo").value == "") {
                                        alert("لطفا شماره کارتخوان را وارد کنيد")
                                        $get(MasterObj + "txtCardReaderNo").focus();

                                    }

                                    else if ($get(MasterObj + "CmbCardReaderModel").value == "0") {
                                        alert("لطفا مدل کارتخوان را انتخاب نماييد")
                                        $get(MasterObj + "CmbCardReaderModel").focus();

                                    }

                                    else if ($get(MasterObj + "txtCardReaderName").value == "") {
                                        alert("لطفا نام کارتخوان  را وارد نماييد ")
                                        $get(MasterObj + "txtCardReaderName").focus();

                                    }

                                    else if ($get(MasterObj + "CmbTakhliye").value == "") {
                                        alert("لطفا مکانيزم تخليه را انتخاب نماييد ")
                                        $get(MasterObj + "CmbTakhliye").focus();
                                    }

                                    else if ($get(MasterObj + "txtLocation").value == "") {
                                        alert("لطفا محل نصب  را وارد نماييد ")
                                        $get(MasterObj + "txtLocation").focus();
                                       
                                    }

                                    else if ($get(MasterObj + "txtIP").value == "") {
                                        alert("لطفا آي پي کارتخوان را وارد نماييد ")
                                        $get(MasterObj + "txtIP").focus();
                                       
                                    }

                                    else if ($get(MasterObj + "txtTRT").value == "") {
                                        alert("لطفا تي آر تي کارتخوان را وارد نماييد ")
                                        $get(MasterObj + "txtTRT").focus();
                                        
                                    }


                                    else if ($get(MasterObj + "ChkActive").checked == false && $get(MasterObj + "ChkDeActive").checked == false) {
                                        alert("لطفا وضعيت کارتخوان  را انتخاب نماييد")
                                       
                                    }

                                    else {
                                        if ($get(MasterObj + "ChkActive").checked == true) 
                                            document.getElementById(MasterObj + "txtActiveStatus").value = 1;
                                           
                                        else
                                            document.getElementById(MasterObj + "txtActiveStatus").value = 0;

                                        document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                                        document.getElementById(MasterObj + "BtnSubmit").click();
                                       

                                    }
            }
            catch (Exception) {
                alert("اطلاعات ناقص است");
            }


        }
        
        
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickHeaderChk(obj) {
            var OGrid = document.getElementById("GrdSelectCode");
            var oLen = OGrid.rows.length

            for (var i = 1; i < oLen; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                OnClickChk(OGrid.rows(i).cells(0).firstChild);
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickChk(obj) {

            var oGrid = obj.parentElement;
            while (oGrid.tagName != "TABLE")
                oGrid = oGrid.parentElement

            var oRow = obj.parentElement;
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement
            var oIndex = oRow.rowIndex
            //========================================================
            var strXml = "<BaseInfoEntity>" + strChk + "</BaseInfoEntity>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/CardReader [ CardReaderID=" + oGrid.rows(oIndex).cells(1).innerText + "]");
            //========================================================
            if (oXmlNodes.length > 0) {
                if (oGrid.rows(oIndex).cells(0).firstChild.checked == true)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                else
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                strXml = oXmlDoc.xml;
                strChk = strXml.replace("<BaseInfoEntity>", "");
                strChk = strChk.replace("</BaseInfoEntity>", "");
            }
            else {
                strChk += "<CardReader>"
                strChk += "<CardReaderID>" + oGrid.rows(oIndex).cells(1).innerText + "</CardReaderID>"
                if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
                    strChk += "<Selected>0</Selected>"
                else
                    strChk += "<Selected>1</Selected>"

                strChk += "</CardReader>"
            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetChk() {
            var i = 0;
            var j = 0;

            var OGrid = document.getElementById("GrdSelectCode");
            if (OGrid == null)
                return
            var PageSize = OGrid.rows.length
            var strXml = "<BaseInfoEntity>" + strChk + "</BaseInfoEntity>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/CardReader");

            for (j = 0; j < oXmlNodes.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    if (OGrid.rows(i).cells(1).innerText == oXmlNodes.item(j).selectSingleNode("CategoryID").text) {
                        if (oXmlNodes.item(j).selectSingleNode("Selected").text == "1")
                            OGrid.rows(i).cells(0).firstChild.checked = true;
                        else
                            OGrid.rows(i).cells(0).firstChild.checked = false;
                    }
                }
            }
        }
        //==================================فوکوس ساعت=================
        function onFocusTime(obj) {
            obj.select();
        }

    </script>
</asp:Content>







