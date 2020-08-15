<%@ Page Title="مديرِت دوره" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="WorkPriodNew.aspx.cs" Inherits="FrmPresentation.App_Pages.Setting.WorkPriodNew" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/NewCalendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
     <!--toolbar-->
    <table style="width: 97%">
        <tr>
            <td align="center" >
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        </table>
        <table align="center" class="DivStyle"   >
        <tr>
            <td>
                دوره
            </td>
            <td>
               <input id="txtWorkPriod" type="text" style="width: 137px" runat="server" class="TxtControls" />
                    
            </td>
        </tr>
        <tr>
            <td>
                از تاريخ
            </td>
            <td>
                <uc3:KCalendar ID="KCalSDate" runat="server" />
            </td>
            <td>
                تا تاريخ
            </td>
            <td>
                <uc3:KCalendar ID="KCalEDate" runat="server" />
            </td>
            <td>
                تاريخ قطعی شدن
            </td>
            <td>
                <uc3:KCalendar ID="KCalConfirmDate" runat="server" />
            </td>
        </tr>
        <tr>
        <td style="height:50px"></td>
        </tr>
        <tr>
        <td>
        
               <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" /> 
                  <asp:HiddenField ID="txtID" runat="server" /> 
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
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
     <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtSdate" name="txtSdate" runat="server" />
        <input type="text" id="txtEdate" name="txtEdate" runat="server" />
         <input type="text" id="txtConfirm" name="txtConfirm" runat="server" />
          <input type="text" id="txtSystemID" name="txtSystemID" runat="server" />
             <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
             <input type="text" id="txtPriod" name="txtPriod" runat="server" />
             <input type="text" id="txtXmlDiscription" name="txtXmlDiscription" runat="server" />

    </div>
    <script language="javascript" type="text/javascript">
        document.body.scroll = "no";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var SaveFlag = 0; SaveNewFlag = 0;
        
        //====================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            document.getElementById("OToolBar_ProgressBar").style.visibility = "visible";
        }
        //====================================================================================
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value == "1") {
                    SaveFlag = 1;
                    window.returnValue = SaveFlag;
                    SetMsg($get(MasterObj + "txtAlert").value);
                    window.close()
                     
                }

                else {
                    alert($get(MasterObj + "txtAlert").value);
                }
            }
          
            document.getElementById(MasterObj + "txtsubmit").value = ""
            document.getElementById(MasterObj + "txtAlert").value = ""
        }
         //=========================load Discription========================================
        if (document.getElementById(MasterObj + "txtID").value != 0) {
            if ($get(MasterObj + "txtXmlDiscription").value != "<SettingEntity></Description>" || $get(MasterObj + "txtXmlDiscription").value != "<SettingEntity/>") {
                var str = $get(MasterObj + "txtXmlDiscription").value
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(str)
//                        alert(str)
                var XmlNode = oXmlDoc.documentElement.selectNodes("/SettingEntity/Description");
                if (XmlNode.length != 0) {
                    $get(MasterObj + "txtWorkPriod").value = XmlNode.item(0).selectSingleNode("Name").text.toString();
                    $get(MasterObj + "KCalSDate_txtYear").value = XmlNode.item(0).selectSingleNode("SDate").text.substr(0, 4)
                    $get(MasterObj + "KCalSDate_txtMonth").value = XmlNode.item(0).selectSingleNode("SDate").text.substr(5, 2)
                    $get(MasterObj + "KCalSDate_txtDay").value = XmlNode.item(0).selectSingleNode("SDate").text.substr(8, 2)
                    $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
                    $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)

                    $get(MasterObj + "KCalEDate_txtYear").value = XmlNode.item(0).selectSingleNode("EDate").text.substr(0, 4)
                    $get(MasterObj + "KCalEDate_txtMonth").value = XmlNode.item(0).selectSingleNode("EDate").text.substr(5, 2)
                    $get(MasterObj + "KCalEDate_txtDay").value = XmlNode.item(0).selectSingleNode("EDate").text.substr(8, 2)
                    $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
                    $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
                    if (XmlNode.item(0).selectSingleNode("ExpireDate").text == "") {
                        $get(MasterObj + "KCalConfirmDate_txtYear").value = ""
                        $get(MasterObj + "KCalConfirmDate_txtMonth").value = ""
                        $get(MasterObj + "KCalConfirmDate_txtDay").value = ""
                        $get(MasterObj + "KCalConfirmDate_txtCalendar").value = ""
                    }

                    $get(MasterObj + "txtSystemID").value = XmlNode.item(0).selectSingleNode("SystemID").text.toString();

                }
            }
        }
       
        //==============================ذخیره============================

        function OnClickBtnSave() {

            var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
            var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value
            var CDate = $get(MasterObj + "KCalConfirmDate_txtYear").value + "/" + $get(MasterObj + "KCalConfirmDate_txtMonth").value + "/" + $get(MasterObj + "KCalConfirmDate_txtDay").value
           
            if (SDate == "//")
                SDate = "";
               
            if (EDate == "//")
                EDate = "";
            if (CDate == "//")
                CDate = "";
            if (ChkNotIsEmpty()) {
                var Str = "<Root>"
                Str = Str + "<Tb>"
                Str = Str + "<Name>" + document.getElementById(MasterObj + "txtWorkPriod").value + "</Name>"
                Str = Str + "<SDate>" + SDate +"</SDate>"
                Str = Str + "<EDate>" + EDate +"</EDate>"
                Str = Str + "<ExpireDate>"+ CDate +"</ExpireDate>"
                Str = Str + "<SystemID>" + document.getElementById(MasterObj +"txtSystemID").value +"</SystemID>"
                Str = Str + "<ID>" + document.getElementById(MasterObj +"txtID").value + "</ID>"
                Str = Str + "</Tb>"
                Str = Str + "</Root>"
                document.getElementById(MasterObj + "txtXmlSave").value = Str;
//                alert(Str)
                $get(MasterObj + "txtSubmit").value = "Modify";
                $get(MasterObj + "BtnSubmit").click();
            }
        }
        
            
            // ===================================چک کردن خالی نبودن آبجکت ها=============================
            function ChkNotIsEmpty() {
                var SDate = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value
                var EDate = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value

                if (document.getElementById(MasterObj + "txtWorkPriod").value == "") {
                    alert("لطفا نام دوره را وارد نماييد");
                    document.getElementById(MasterObj + "txtWorkPriod").focus();
                    return false;
                }


                else if ($get(MasterObj + "KCalSDate_txtCalendar").value == "") {
                    alert("لطفا تاريخ شروع را وارد نماييد");
                    $get(MasterObj + "KCalSDate_txtCalendar").focus();
                    return false;
                }
                else if ($get(MasterObj + "KCalEDate_txtCalendar").value == "") {
                    alert("لطفا تاريخ پايان را وارد نماييد");
                    $get(MasterObj + "KCalEDate_txtCalendar").focus();
                    return false;
                }

                else if (SDate > EDate) {
                    alert("تاريخ شروع بزرگتر از تاریخ پايان است")
                    return false;
                }

                return true;

            }
             
             </script>
</asp:Content>
