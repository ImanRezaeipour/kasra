<%@ Page Title="------------------------------------------------------------------------------انتساب زمانبندی به گروه کارتخوان-------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="AssignScheduleToCardReaderGroup.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.AssignScheduleToCardReaderGroup" %>
<%@ Register src="../../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
        .cssInsertSelectChk
        {
            background-color: #96CFAD;
        }
        .cssDeleteSelectChk
        {
            background-color: #FFAAAA;
        }
</style>        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../../../App_Utility/Scripts/General.js" type="text/javascript"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <script language="javascript" type="text/javascript">
        window.document.title = "انتساب زمانبندی به گروه کارتخوان"
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            
        }
        function EndRequestHandler(sender, args) {
            try {
                
                var StrVal = $get(MasterObj + "txtSubmit").value

                var OGrid = $get("GrdSchduling")
                if (StrVal == "Save" && $get(MasterObj + "txtStatus").value != "2") {
                 
                    OGrid.rows(Selected).cells(0).firstChild.checked = true
                }
                
             
                if ($get(MasterObj + "txtAlert").value != "") {
                    if (($get(MasterObj + "txtStatus").value == "2"))
                        alert($get(MasterObj + "txtAlert").value);
                    else {

                        SetMsg($get(MasterObj + "txtAlert").value);
                        SaveFlag = 1;
                    }

                }

                $get(MasterObj + "txtSubmit").value = "";
                $get(MasterObj + "txtAlert").value = "";
                $get(MasterObj + "txtStatus").value = "";


                if (OGrid != null) {
                   
                    for (var i = 1; i < OGrid.rows.length; i++) {
                        if (OGrid.rows[i].PeriodTypeID == 2) {
                            var array;
                            var str = OGrid.rows[i].WeekDay
                            str = str.substr(0, str.length - 1);
                            array = str.split(',');
                            OGrid.rows(i).cells(7).innerText = ""
                            for (var j = 0; j < array.length; j++) {
                                if (array[j] == 0)
                                    OGrid.rows(i).cells(7).innerText += "شنبه" + ","
                                if (array[j] == 1)
                                    OGrid.rows(i).cells(7).innerText += "یکشنبه" + ","
                                if (array[j] == 2)
                                    OGrid.rows(i).cells(7).innerText += "دوشنبه" + ","
                                if (array[j] == 3)
                                    OGrid.rows(i).cells(7).innerText += "سه شنبه" + ","
                                if (array[j] == 4)
                                    OGrid.rows(i).cells(7).innerText += "چهار شنبه" + ","
                                if (array[j] == 5)
                                    OGrid.rows(i).cells(7).innerText += "پنج شنبه" + ","
                                if (array[j] == 6)
                                    OGrid.rows(i).cells(7).innerText += "جمعه" + ","
                            }
                        }
                    }
                }
            }
            catch (Exception) {
                alert("اطلاعات ناقص است");
            }
        }
    </script>
    <table>
        <tr>
            <td align="center">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
         <tr>
            <td  align ="center">
                <table>
                    <tr>
                        <td style="width:220px">
                            <fieldset dir="rtl" style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                                border-left: lightblue thin outset; border-bottom: lightblue thin solid;" >
                                <legend style="color: lightblue">گروه کارتخوان</legend>
                                <table style="width:200px">
                                    <tr>
                                        <td>
                                            <div align="right">
                                                <asp:DropDownList ID="CmbCardReader" name="CmbCardReader" Style="width: 130px" runat="server"
                                                    onchange="OnChangeCmbCardReaderGroup()" class="TxtControls">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="right">
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server"  UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                    
                                                        <div class="DivStyle" style="scrollbar-highlight-color: white; overflow: auto; width: 200px;
                                                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 450px; margin-right: 0px;">
                                                            <asp:PlaceHolder ID="GridViewPlaceHolder2" runat="Server" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td>
                            <fieldset dir="rtl" style="border-right: lightblue thin inset; border-top: lightblue thin solid;
                                border-left: lightblue thin outset; border-bottom: lightblue thin solid;">
                                <legend style="color: lightblue">زمانبندي</legend>
                                <table style="width: 400px; height:300px" >
                                    <tr>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                                    <asp:HiddenField ID="txtStatus" runat="server" />
                                                    <div class="DivStyle" style="scrollbar-highlight-color: white; overflow: auto; width: 750px;
                                                        scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 480px; margin-right: 0px;">
                                                        <asp:PlaceHolder ID="GridViewPlaceHolder1" runat="Server" />
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <div style="display: none">
                                <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                                    runat="server" />
                                <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                                 <asp:Button ID="BtnSubmit2" runat="server" Text="BtnSubmit2" OnClick="BtnSubmit2_Click" />
                                <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                                <input type="text" id="txtXmlStr" name="txtXmlStr" runat="server" />
                                <input type="text" id="txtSchedulingID" name="txtSchedulingID" runat="server" />
                                <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                                <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />
                                <input type="text" id="SDate" name="SDate" runat="server" />
                                <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                                    runat="server" />
                                <input type="text" id="EDate" name="EDate" runat="server" />
                                <input type="text" id="txtCardSchedulingID" name="txtCardSchedulingID" runat="server" />
                                <input type="text" id="txtCardReaderGroupID" name="txtCardReaderGroupID" runat="server" />
                            </div>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                &nbsp;
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var strCrdReader = "<root></root>";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var SaveFlag = 0;
        var Selected = -1;
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        var OGrid = $get("GrdSchduling");
        if (OGrid != null) {
            for (var i = 1; i < OGrid.rows.length; i++) {

                if (OGrid.rows[i].PeriodTypeID == 2) {

                    var array;
                    var str = OGrid.rows[i].WeekDay
                    str = str.substr(0, str.length - 1);
                    array = str.split(',');
                    OGrid.rows(i).cells(7).innerText = ""
                    for (var j = 0; j < array.length; j++) {
                        if (array[j] == 0)
                            OGrid.rows(i).cells(7).innerText += "شنبه" + ","
                        if (array[j] == 1)
                            OGrid.rows(i).cells(7).innerText += "یکشنبه" + ","
                        if (array[j] == 2)
                            OGrid.rows(i).cells(7).innerText += "دوشنبه" + ","
                        if (array[j] == 3)
                            OGrid.rows(i).cells(7).innerText += "سه شنبه" + ","
                        if (array[j] == 4)
                            OGrid.rows(i).cells(7).innerText += "چهار شنبه" + ","
                        if (array[j] == 5)
                            OGrid.rows(i).cells(7).innerText += "پنج شنبه" + ","
                        if (array[j] == 6)
                            OGrid.rows(i).cells(7).innerText += "جمعه" + ","
                    }
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.returnValue = SaveFlag;
            window.close();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickGrd(SelectedRow) {

            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
           
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
         var OGrid = $get("GrdSchduling");
         var CheckedFlag=false;
         for (var i = 0; i < OGrid.rows.length; i++) {
             if (OGrid.rows(i).cells(0).firstChild.checked == true)
                 CheckedFlag = true;
         }
         if ($get(MasterObj + "CmbCardReader").value == "0")
             alert("لطفا گروه کارتخوان را انتخاب نماييد");
         else if (CheckedFlag == false)
             alert("لطفا یک زمانبندي را به گروه کارتخوان انتساب دهيد");
         else {
             $get(MasterObj + "txtCardReaderGroupID").value = $get(MasterObj + "CmbCardReader").value

             document.getElementById(MasterObj + "txtSubmit").value = "Save";
             document.getElementById(MasterObj + "BtnSubmit").click();
         }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickCrdReaderCHK(Obj) {
            Selected = Obj.parentElement.parentElement.rowIndex;
            var SelectedRow = Obj.parentElement.parentElement;
            var OGrid = document.getElementById("GrdSchduling");

            for (var i = 1; i < OGrid.rows.length; i++) {
                if (OGrid.rows(i).cells(0).firstChild.checked == true)
                    OGrid.rows(i).cells(0).firstChild.checked = false;
            }
            OGrid.rows(SelectedRow.rowIndex).cells(0).firstChild.checked = true;

            document.getElementById(MasterObj + "txtSchedulingID").value = Obj.parentNode.parentNode.getAttribute("SchedulingID")
         
            
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnChangeCmbCardReaderGroup() {

            document.getElementById(MasterObj + "txtCardReaderGroupID").value = document.getElementById(MasterObj + "CmbCardReader").value;
            document.getElementById(MasterObj + "txtSubmit").value = "ChangeCardReaderGroup";
            document.getElementById(MasterObj + "BtnSubmit2").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>
    
</asp:Content>
