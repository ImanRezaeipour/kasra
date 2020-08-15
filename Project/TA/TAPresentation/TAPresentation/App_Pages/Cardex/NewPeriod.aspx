<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="NewPeriod.aspx.cs" Inherits="TAPresentation.App_Pages.Cardex.NewPeriod"
    Title="Untitled Page" ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 64%;">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="NewPeriod.aspx" />
            </td>
        </tr>
        <tr>
            <td>
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
                        if (StrVal != "") {
                            if (document.getElementById(MasterObj + "txtAlert").value == "0")
                                SetMsg("Save")
                            else if (document.getElementById(MasterObj + "txtAlert").value == "1")
                                alert("کاردکس داراي دوره مي باشد و امکان تغيير تاريخ شروع و پایان گردش آن وجود ندارد")
                            else if (document.getElementById(MasterObj + "txtAlert").value == "2")
                                alert("ترتيب تاريخ آغاز و پايان رعايت نشده است")
                            else if (document.getElementById(MasterObj + "txtAlert").value == "3")
                                alert("تاريخ شروع دوره نمي تواند کمتر از تاريخ شروع گردش باشد")
                                
                            returnValue = 1
                        }
                        $get(MasterObj + "txtSubmit").value = "";
                    }
                </script>

            </td>
        </tr>
        <tr>
            <td align="center">
                <table id="Table2" border="0" cellpadding="1" cellspacing="1">
                    <tr>
                        <td style="width: 77px">
                            نام کاردکس:
                        </td>
                        <td style="width: 174px">
                           <asp:DropDownList ID="cmbName" runat="server"  name="a1" DataTextField="title" DataValueField="val"
                                Height="16px" Style="margin-right: 0px;" onchange="OnChnageCmbName(this)" 
                                Width="156px">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 75px">
                            نام دوره:
                        </td>
                        <td>
                            <input id="txtCardexPeriodName" runat="server" type="text" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 77px">
                            تاريخ شروع:
                        </td>
                        <td style="width: 174px">
                            <uc2:KCalendar ID="StartDate" runat="server" />
                        </td>
                        <td style="width: 75px">
                            تاريخ پايان:
                        </td>
                        <td>
                            <uc2:KCalendar ID="EndDate" runat="server" />
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
                    <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                        runat="server" />
                    <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                        runat="server" />
                    <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                    <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtXml" name="txtXml" runat="server" />
                    <input type="text" id="txtCardexPeriodID" name="txtCardexPeriodID" runat="server" />
                    <input type="text" id="txtLimitation" name="txtLimitation" runat="server" />
                    <input type="text" id="txtXMLCardexPeriod" name="txtXMLCardexPeriod" runat="server" />
                    
                    
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">
       
        //////////////////////////////////This Page//////////////////////////////////////

        function OnClickBtnCancel() {
            window.close()
        }
        //**********************************Page Load************************************
        if (document.getElementById(MasterObj + "txtLimitation").value == "0") {
        
            document.getElementById(MasterObj + "EndDate_txtYear").disabled = true
            document.getElementById(MasterObj + "EndDate_txtMonth").disabled = true
            document.getElementById(MasterObj + "EndDate_txtDay").disabled = true
        }
        //*******************************************************************************
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            var strSave = ''
            //-------------------------------------
            if (document.getElementById(MasterObj + "cmbName").value == "0") {
                alert("لطفا نوع کاردکس را مشخص نمائيد")
                return
            }
            if (document.getElementById(MasterObj + "txtCardexPeriodName").value == "") {
                alert("لطفا نام دوره کاردکس را مشخص نمائيد")
                return
            }
            //-------------------------------------
            var SDate = $get(MasterObj + "StartDate_txtYear").value + "/" + $get(MasterObj + "StartDate_txtMonth").value + "/" + $get(MasterObj + "StartDate_txtDay").value
            if (SDate == "//") {
                alert('لطفا تاريخ شروع را وارد کنيد')
                return
            }
            var EDate = $get(MasterObj + "EndDate_txtYear").value + "/" + $get(MasterObj + "EndDate_txtMonth").value + "/" + $get(MasterObj + "EndDate_txtDay").value
            if (EDate == "//") {
                alert('لطفا تاريخ پایان را وارد کنيد')
                return
            }
            
            if (CompareDate() == false)
                return;

            
            //-------------------------------------
            strSave += "<Root><Tb>"
            strSave += "<CardexPeriodID>" + document.getElementById(MasterObj + "txtCardexPeriodID").value + "</CardexPeriodID>"
            strSave += "<CardexID>" + document.getElementById(MasterObj + "cmbName").value + "</CardexID>"
            strSave += "<CardexPeriodName>" + document.getElementById(MasterObj + "txtCardexPeriodName").value + "</CardexPeriodName>"
            strSave += "<StartDate>" + SDate + "</StartDate>"
            strSave += "<EndDate>" + EDate + "</EndDate>"
            strSave += "</Tb></Root>"
            //-------------------------------------
            returnValue = 1
            document.getElementById(MasterObj + "txtXml").value = strSave
            document.getElementById(MasterObj + "txtSubmit").value = "Save"
            document.getElementById(MasterObj + "BtnSubmit").click()


        }
        //*******************************************************************************
        function CompareDate() {
            var ED = document.getElementById(MasterObj + "EndDate_txtYear").value + document.getElementById(MasterObj + "EndDate_txtMonth").value + document.getElementById(MasterObj + "EndDate_txtDay").value
            var SD = document.getElementById(MasterObj + "StartDate_txtYear").value + document.getElementById(MasterObj + "StartDate_txtMonth").value + document.getElementById(MasterObj + "StartDate_txtDay").value
            if (ED < SD) {
                alert('تاريخ پايان بايد بزرگتر از تاريخ شروع باشد')
                return false
            }
            else {
                return true
            }
        }
        //*******************************************************************************
        function OnChnageCmbName(obj) {
            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtXMLCardexPeriod").value);
            var xmlNodes;
            if (obj.value == 0)
                return 
            else
                xmlNodes = xmlDoc.documentElement.selectNodes("/CardexEntity/CardexName[val=" + obj.value + "]");

            
            if (xmlNodes.length > 0) {
                if (xmlNodes.item(0).selectSingleNode("Limitation").text == 1) {
                    
                    document.getElementById(MasterObj + "EndDate_txtYear").disabled = true
                    document.getElementById(MasterObj + "EndDate_txtMonth").disabled = true
                    document.getElementById(MasterObj + "EndDate_txtDay").disabled = true
                }
                else if (xmlNodes.item(0).selectSingleNode("Limitation").text == 0) {
                    document.getElementById(MasterObj + "EndDate_txtYear").disabled = false
                    document.getElementById(MasterObj + "EndDate_txtMonth").disabled = false
                    document.getElementById(MasterObj + "EndDate_txtDay").disabled = false
                }
            }            
        }
        //*******************************************************************************
        function OnClickBtnNew() {
        
            
            document.getElementById(MasterObj + "txtCardexPeriodID").value = 0
            document.getElementById(MasterObj + "cmbName").value = 0
            document.getElementById(MasterObj + "txtCardexPeriodName").value = ""

            document.getElementById(MasterObj + "txtLimitation").value = ""
            
            $get(MasterObj + "StartDate_txtYear").value = ""
            $get(MasterObj + "StartDate_txtMonth").value = ""
            $get(MasterObj + "StartDate_txtDay").value = ""

            $get(MasterObj + "EndDate_txtYear").value = ""
            $get(MasterObj + "EndDate_txtMonth").value = ""
            $get(MasterObj + "EndDate_txtDay").value = ""

            document.getElementById(MasterObj + "EndDate_txtYear").disabled = false
            document.getElementById(MasterObj + "EndDate_txtMonth").disabled = false
            document.getElementById(MasterObj + "EndDate_txtDay").disabled = false

        }
        //*******************************************************************************
       
        //*******************************************************************************
        //*******************************************************************************
    </script>

</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        #Table2
        {
            width: 512px;
        }
        #Select1
        {
            width: 153px;
        }
        #cmbName
        {
            width: 121px;
        }
    </style>
</asp:Content>
