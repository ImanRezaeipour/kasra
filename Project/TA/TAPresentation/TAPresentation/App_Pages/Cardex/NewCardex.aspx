<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="NewCardex.aspx.cs" Inherits="TAPresentation.App_Pages.Cardex.NewCardex"
    Title="Untitled Page" ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 64%;">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="NewCardex.aspx" />
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
                                alert("کاردکس داراي دوره مي باشد و امکان تغيير تاريخ شروع و پایان گردش آن وجود ندارد")
                            else
                                SetMsg("Save")
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
                        <td style="width: 102px">
                            نام کاردکس:
                        </td>
                        <td style="width: 122px">
                            <input id="txtCradexName" runat="server" type="text" />
                        </td>
                        <td style="width: 117px">
                            تاريخ شروع گردش:
                        </td>
                        <td style="width: 125px">
                            <uc2:KCalendar ID="StartDate" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 102px">
                            دوره:
                        </td>
                        <td style="width: 122px">
                            <asp:DropDownList ID="cmbPeriod" runat="server" name="a1" DataTextField="Title" DataValueField="Val"
                                Height="16px" Style="margin-right: 0px;" Width="150px">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 125px">
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
                    <input type="text" id="txtCardexID" name="txtCardexID" runat="server" />
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">
        
        //////////////////////////////////This Page//////////////////////////////////////

        function OnClickBtnCancel() {
            window.close()
        }
        //*******************************************************************************
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
            var strSave = ''
            var Date=$get(MasterObj + "StartDate_txtYear").value + "/" + $get(MasterObj + "StartDate_txtMonth").value + "/" + $get(MasterObj + "StartDate_txtDay").value
            var limitation=0,PeriodID=0
            
            
            if( document.getElementById(MasterObj+ "txtCradexName").value=="")
            {
                alert('لطفا نام را وارد کنيد')
                return
            }
            if (Date == "//") {
                alert('لطفا تاريخ را وارد کنيد')
                return
            }
            
                limitation = 0
                PeriodID =document.getElementById(MasterObj + "cmbPeriod").value
                if(PeriodID=="" || PeriodID==-1)
                {
                    alert('لطفا دوره را انتخاب کنيد')
                    return 
                }
            
            
            strSave +="<Root><Tb>"
            strSave +="<CardexName>"+document.getElementById(MasterObj+"txtCradexName").value+"</CardexName>"
            strSave +="<StartDate>"+Date+"</StartDate>"
            strSave += "<Limitation>" + limitation + "</Limitation>"
            strSave +="<PeriodID>"+PeriodID+"</PeriodID>"
            strSave +="<CardexID>"+document.getElementById(MasterObj + "txtCardexID").value+"</CardexID>"
            strSave +="</Tb></Root>"

            returnValue = 1
            document.getElementById(MasterObj + "txtXml").value = strSave
            document.getElementById(MasterObj + "txtSubmit").value = "Save"
            document.getElementById(MasterObj + "BtnSubmit").click()
            
            
        }
        //*******************************************************************************
        function OnClickBtnNew() {
            document.getElementById(MasterObj + "txtCardexID").value=0
            document.getElementById(MasterObj + "cmbPeriod").value = 0
            document.getElementById(MasterObj + "txtCradexName").value = ""
            
            document.getElementById(MasterObj + "cmbPeriod").disabled = false
            $get(MasterObj + "StartDate_txtYear").value = ""
            $get(MasterObj + "StartDate_txtMonth").value = ""
            $get(MasterObj + "StartDate_txtDay").value=""
            
        }
		//*******************************************************************************
		function ShowResult() {
		    if (document.getElementById(MasterObj + "txtResult").value == "3" || document.getElementById(MasterObj + "txtResult").value == "5") {
		        document.getElementById(MasterObj + "txtResult").value = ""

		        if (confirm(document.getElementById(MasterObj + "txtAlert").value)) {
		            document.getElementById(MasterObj + "txtAlert").value = ""
		            document.getElementById(MasterObj + "txtFlagDo").value = 1
		            returnValue = 1
		            document.getElementById(MasterObj + "txtSubmit").value = "Save"
		            document.getElementById(MasterObj + "BtnSubmit").click()

		        }
		        else
		            document.getElementById(MasterObj + "txtAlert").value = ""
		    }

		    if (document.getElementById(MasterObj + "txtAlert").value != '') {
		        //  alert(document.getElementById(MasterObj + "txtAlert").value)
		        if (document.getElementById(MasterObj + "txtAlert").value == "Save" ||
                document.getElementById(MasterObj + "txtAlert").value == "SaveFail")
		            SetMsg(document.getElementById(MasterObj + "txtAlert").value)
		        else
		            alert(document.getElementById(MasterObj + "txtAlert").value)
		        document.getElementById(MasterObj + "txtAlert").value = ''
		    }
		}
        //*******************************************************************************
        //*******************************************************************************
    </script>

</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        #Table2
        {
            width: 564px;
        }
    </style>
</asp:Content>
