<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="NewDefineWorkPeriod.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.NewDefineWorkPeriod"
    ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            
        }
        .style3
        {
            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table style="width: 500px">
        <tr>
            <td colspan="4">
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" EnableViewState="true" runat="server">
                    <ContentTemplate>
                        <div style="display:none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />
                        </div>
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        نام دوره :
                                    </td>
                                    <td align="right">                                       
                                        
                                        <input id="txtName" type="text" runat="server"  
                                            align="right" />
                                        <div id="DivName" style="display:none;color:Maroon;" ></div>
                                    </td>
                                    <td>
                                        تاريخ قطعي کردن:
                                    </td>
                                    <td>
                                    <uc3:KCalendar ID="KCalEXDate" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        از تاريخ:
                                    </td>
                                    <td class="style3" >
                                        <table>
                                            <tr>
                                                <td id="SDateDiv">
                                                    <uc3:KCalendar ID="KCalSDate" runat="server" />
                                                </td>
                                                <td id="DivSDate" style="display: none; color: Maroon">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" class="style3">
                                        تا تاريخ:
                                    </td>
                                    <td class="style3">
                                    <div id="EDateDiv">
                                        <uc3:KCalendar ID="KCalEDate" runat="server" />
                                        </div>
                                        <div id="DivEDate" style="display:none;color:Maroon" ></div>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <input type="text" id="EXDate" name="EXDate" runat="server" />
        <input type="text" id="txtWorkPeriodID" name="txtWorkPeriodID" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />   
         <input type="text" id="txtMode" name="txtMode" runat="server" />  
         <input type="text" id="txtPageID" name="txtPageID" runat="server" />  
          <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />     
    </div>

    <script language="javascript" type="text/javascript">

        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var flag = 0;
       
        $get(MasterObj + "txtName").style.display = "inline";
        DivName.style.display = "none";
        SDateDiv.style.display = "inline";
        DivSDate.style.display = "none";
        EDateDiv.style.display = "inline";
        DivEDate.style.display = "none";
       
        if (document.getElementById(MasterObj + "txtMode").value == "Edit" || document.getElementById(MasterObj + "txtMode").value == "SetExpire") {
            document.getElementById('OToolBar_BtnNew').style.visibility = "hidden";
            getDate();
        }  
             
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        
        function BeginRequestHandler(sender, args) {
            
        }
        function EndRequestHandler(sender, args) {
            

            var StrVal = $get(MasterObj + "txtSubmit").value
            if (StrVal == "Save") {
                    flag = 1;
//                    if ($get(MasterObj + "txtValidate").value == "1") {                   
//                        if (document.getElementById(MasterObj + "txtMode").value == "New")
//                            OnClickBtnNew();
//                     } 
                    if(document.getElementById(MasterObj + "txtMode").value == "SetExpire")
                    {
                        getDate();
                    }                                      
                }
                if ($get(MasterObj + "txtAlert").value != "") {
                    SetMsg($get(MasterObj + "txtAlert").value)
                    $get(MasterObj + "txtAlert").value = ""
                }
                $get(MasterObj + "txtSubmit").value = "";            
        }
        //================================================
        function OnClickBtnCancel() {
            window.returnValue = flag;
            window.close();
        }
        //=====================================================
        function OnClickBtnSave() {
            if (CheckSave()) {
                Save();                                 
                if ($get(MasterObj + "SDate").value > $get(MasterObj + "EDate").value)
                    alert("تاريخ شروع از خاتمه بزرگتر است.")
                else {
                    document.getElementById(MasterObj + "txtSubmit").value = "Save";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else alert("لطفا اطلاعات را کامل کنيد!");
        }
        //====================================================
        function OnClickBtnNew() {
            //alert(0)
            $get(MasterObj + "txtName").value = "";

            $get(MasterObj + "SDate").value = "";
            $get(MasterObj + "EDate").value = "";
            $get(MasterObj + "KCalSDate_txtYear").value = "";
            $get(MasterObj + "KCalSDate_txtMonth").value = "";
            $get(MasterObj + "KCalSDate_txtDay").value = "";
            $get(MasterObj + "KCalEDate_txtYear").value = "";
            $get(MasterObj + "KCalEDate_txtMonth").value = "";
            $get(MasterObj + "KCalEDate_txtDay").value = "";
            $get(MasterObj + "KCalEXDate_txtYear").value = "";
            $get(MasterObj + "KCalEXDate_txtMonth").value = "";
            $get(MasterObj + "KCalEXDate_txtDay").value = "";
            $get(MasterObj + "KCalEDate_txtCalendar").value = "";
            $get(MasterObj + "KCalSDate_txtCalendar").value = "";
            $get(MasterObj + "KCalEXDate_txtCalendar").value = "";
            
        }
        //=======================================================
        function CheckSave() {
             if (document.getElementById(MasterObj + "txtMode").value == "New" ||  document.getElementById(MasterObj + "txtMode").value == "Edit")
                {
                if ($get(MasterObj + "txtName").value == "") {
                    $get(MasterObj + "txtName").focus(); 
                    return false;
                }
                if ($get(MasterObj + "KCalSDate_txtYear").value == "") {
                    $get(MasterObj + "KCalSDate_txtCalendar").focus();
                     return false;
                }
                if ($get(MasterObj + "KCalSDate_txtMonth").value == "") {
                    $get(MasterObj + "KCalSDate_txtCalendar").focus(); 
                    return false;
                }
                if ($get(MasterObj + "KCalSDate_txtDay").value == "") {
                    $get(MasterObj + "KCalSDate_txtCalendar").focus(); 
                    return false;
                }
                if ($get(MasterObj + "KCalEDate_txtYear").value == "") {
                    $get(MasterObj + "KCalEDate_txtCalendar").focus();
                     return false;
                }
                if ($get(MasterObj + "KCalEDate_txtMonth").value == "") {
                    $get(MasterObj + "KCalEDate_txtCalendar").focus(); 
                    return false;
                }
                if ($get(MasterObj + "KCalEDate_txtDay").value == "") {
                    $get(MasterObj + "KCalEDate_txtCalendar").focus(); 
                    return false;
                }
                return true;
            }
            else {               
                if ($get(MasterObj + "KCalEXDate_txtDay").value == "") {
                    $get(MasterObj + "KCalEXDate_txtCalendar").focus(); 
                    return false;
                }
                return true;
            }
        }
        //=========================================================
        function Save() {
            if (document.getElementById(MasterObj + "txtMode").value == "Edit" || document.getElementById(MasterObj + "txtMode").value == "New") {
                $get(MasterObj + "SDate").value = $get(MasterObj + "KCalSDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
                $get(MasterObj + "EDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
                if ($get(MasterObj + "KCalEXDate_txtYear").value != "" && $get(MasterObj + "KCalEXDate_txtMonth").value && $get(MasterObj + "KCalEXDate_txtDay").value)
                    $get(MasterObj + "EXDate").value = $get(MasterObj + "KCalEXDate_txtYear").value + "/" + $get(MasterObj + "KCalEXDate_txtMonth").value + "/" + $get(MasterObj + "KCalEXDate_txtDay").value;
                else $get(MasterObj + "EXDate").value = "";
            }
            else {
                var Date = $get(MasterObj + "SDate").value;                
                $get(MasterObj + "SDate").value = Date.substr(6, 4) + "/" + Date.substr(3, 2) + "/" + Date.substr(0, 2);
                Date = $get(MasterObj + "EDate").value;
                $get(MasterObj + "EDate").value = Date.substr(6, 4) + "/" + Date.substr(3, 2) + "/" + Date.substr(0, 2);
                $get(MasterObj + "txtName").value = (DivName.title == "") ? DivName.innerText : DivName.title;
                $get(MasterObj + "EXDate").value = $get(MasterObj + "KCalEXDate_txtYear").value + "/" + $get(MasterObj + "KCalEXDate_txtMonth").value + "/" + $get(MasterObj + "KCalEXDate_txtDay").value;
            }
        }
        //===========================================================
        function getDate() {
            var Date = $get(MasterObj + "SDate").value;
            if (document.getElementById(MasterObj + "txtMode").value == "Edit") {               
                
                $get(MasterObj + "KCalSDate_txtYear").value = Date.substr(6, 4)
                $get(MasterObj + "KCalSDate_txtMonth").value = Date.substr(3, 2);
                $get(MasterObj + "KCalSDate_txtDay").value = Date.substr(0, 2);
                $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value
                $get(MasterObj + "KCalSDate_txtCalendar").value = $get(MasterObj + "KCalSDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalSDate_txtDay").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtYear").value)
           
                Date = $get(MasterObj + "EDate").value;

                $get(MasterObj + "KCalEDate_txtYear").value = Date.substr(6, 4)
                $get(MasterObj + "KCalEDate_txtMonth").value = Date.substr(3, 2);
                $get(MasterObj + "KCalEDate_txtDay").value = Date.substr(0, 2);
                $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value
                $get(MasterObj + "KCalEDate_txtCalendar").value = $get(MasterObj + "KCalEDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEDate_txtDay").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtYear").value)
           

                Date = $get(MasterObj + "EXDate").value;
                if (Date != "") {
                    $get(MasterObj + "KCalEXDate_txtYear").value = Date.substr(6, 4)
                    $get(MasterObj + "KCalEXDate_txtMonth").value = Date.substr(3, 2);
                    $get(MasterObj + "KCalEXDate_txtDay").value = Date.substr(0, 2);
                    $get(MasterObj + "KCalEXDate_txtCalendar").value = $get(MasterObj + "KCalEXDate_txtDay").value + "/" + $get(MasterObj + "KCalEXDate_txtMonth").value + "/" + $get(MasterObj + "KCalEXDate_txtYear").value
                    $get(MasterObj + "KCalEXDate_txtCalendar").value = $get(MasterObj + "KCalEXDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEXDate_txtDay").value + "/" + $get(MasterObj + "KCalEXDate_txtMonth").value + "/" + $get(MasterObj + "KCalEXDate_txtYear").value)
                }
           
            }
            else {
                    $get(MasterObj + "txtName").style.display = "none";
                    DivName.style.display = "inline";
                    SDateDiv.style.display = "none";
                    DivSDate.style.display = "inline";
                    EDateDiv.style.display = "none";
                    DivEDate.style.display = "inline";
                    if (flag == 0) {
                        if ($get(MasterObj + "txtName").value.length > 10) {
                            DivName.innerText = $get(MasterObj + "txtName").value.substr(0, 8) + "...";
                            DivName.title = $get(MasterObj + "txtName").value;
                        }
                        else
                            DivName.innerText = $get(MasterObj + "txtName").value;                                  
                    DivSDate.innerText = Date;
                    Date = $get(MasterObj + "EDate").value;
                    DivEDate.innerText = Date;
                    Date = $get(MasterObj + "EXDate").value;
                    if (Date != "") {
                        $get(MasterObj + "KCalEXDate_txtYear").value = Date.substr(6, 4)
                        $get(MasterObj + "KCalEXDate_txtMonth").value = Date.substr(3, 2);
                        $get(MasterObj + "KCalEXDate_txtDay").value = Date.substr(0, 2);
                        $get(MasterObj + "KCalEXDate_txtCalendar").value = $get(MasterObj + "KCalEXDate_txtDay").value + "/" + $get(MasterObj + "KCalEXDate_txtMonth").value + "/" + $get(MasterObj + "KCalEXDate_txtYear").value
                        $get(MasterObj + "KCalEXDate_txtCalendar").value = $get(MasterObj + "KCalEXDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEXDate_txtDay").value + "/" + $get(MasterObj + "KCalEXDate_txtMonth").value + "/" + $get(MasterObj + "KCalEXDate_txtYear").value)
                    }
          
                }
                else {
                    if ($get(MasterObj + "txtName").value.length > 10) {
                        DivName.innerText = $get(MasterObj + "txtName").value.substr(0, 8) + "...";
                        DivName.title = $get(MasterObj + "txtName").value;
                    }  
                    else
                        DivName.innerText = $get(MasterObj + "txtName").value; 
                      
                    DivSDate.innerText = Date;
                    DivSDate.innerText = Date.substr(8, 4) + "/" + Date.substr(5, 2) + "/" + Date.substr(0, 4);
                    $get(MasterObj + "SDate").value = Date.substr(8, 4) + "/" + Date.substr(5, 2) + "/" + Date.substr(0, 4);
                    Date = $get(MasterObj + "EDate").value;
                    DivEDate.innerText = Date;
                    DivEDate.innerText = Date.substr(8, 4) + "/" + Date.substr(5, 2) + "/" + Date.substr(0, 4);
                    $get(MasterObj + "EDate").value = Date.substr(8, 4) + "/" + Date.substr(5, 2) + "/" + Date.substr(0, 4);
                    Date = $get(MasterObj + "EXDate").value;
                    if (Date != "") {
                        $get(MasterObj + "KCalEXDate_txtYear").value = Date.substr(0, 4)
                        $get(MasterObj + "KCalEXDate_txtMonth").value = Date.substr(5, 2);
                        $get(MasterObj + "KCalEXDate_txtDay").value = Date.substr(8, 2);
                        $get(MasterObj + "KCalEXDate_txtCalendar").value = $get(MasterObj + "KCalEXDate_txtDay").value + "/" + $get(MasterObj + "KCalEXDate_txtMonth").value + "/" + $get(MasterObj + "KCalEXDate_txtYear").value
                        $get(MasterObj + "KCalEXDate_txtCalendar").value = $get(MasterObj + "KCalEXDate_txtCalendar").value + "  " + F_adbsghh($get(MasterObj + "KCalEXDate_txtDay").value + "/" + $get(MasterObj + "KCalEXDate_txtMonth").value + "/" + $get(MasterObj + "KCalEXDate_txtYear").value)
                    }
                       
                }                                  
            }
            //=========================================================
            }
    </script>

</asp:Content>
