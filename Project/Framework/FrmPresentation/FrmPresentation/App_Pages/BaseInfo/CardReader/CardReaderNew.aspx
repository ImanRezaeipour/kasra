<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="CardReaderNew.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.CardReaderNew"
    Title="Untitled Page" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register src="../../../App_Utility/Calendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/KeySorting.js"></script>

    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="CardReaderNew.aspx" />
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
                        document.getElementById('OToolBar_ProgressBar').style.display = "inline";
                    }

                    function EndRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.display = "none";
                        if ($get(MasterObj + "txtAlert").value != "") {
                            SetMsg($get(MasterObj + "txtAlert").value)
                            returnValue = 1
                        }
                        $get(MasterObj + "txtSubmit").value = "";
                    }
                </script>

            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%;">
                    <tr>
                        <td>
                            نام کارتخوان
                            :</td>
                        <td>
                            <input id="txtName" runat="server" type="text" />
                        </td>
                        <td>
                            کد:</td>
                        <td>
                            <input id="txtCode" runat="server" type="text" />
                        </td>
                        <td>
                            سريال:</td>
                        <td>
                            <input id="txtSerial" runat="server" type="text" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            نوع:</td>
                        <td>
                            <asp:DropDownList ID="cmbType" runat="server" Height="16px" Width="121px" DataTextField="Title"
                                DataValueField="val">
                            </asp:DropDownList>
                        </td>
                        <td>
                            محل استقرار:</td>
                        <td>
                            <input id="txtLocation" runat="server" type="text" />
                        </td>
                        <td>
                            شماره پورت مجازی:
                        </td>
                        <td>
                            <input id="txtPort" type="text" onkeydown="OnKeyDownInt(this)" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            سیستم:</td>
                        <td>
                            <asp:DropDownList ID="CmbSystem" runat="server" Height="16px" Width="121px" DataTextField="Title"
                                DataValueField="val">
                            </asp:DropDownList>
                        </td>
                        <td>
                            شرکت سازنده:
                        </td>
                        <td>
                            <asp:DropDownList ID="CmbFactory" runat="server" onchange="OnChangeCmbFactory()" Height="16px" Width="121px" DataTextField="Title"
                                DataValueField="val">
                            </asp:DropDownList>
                        </td>
                        <td>
                            مدل:</td>
                        <td>
                            <asp:DropDownList ID="CmbModel" runat="server" Height="16px" Width="121px" DataTextField="Title"
                                DataValueField="val">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            وضعیت:</td>
                        <td>
                            <input id="ChkActive" runat="server" name="g" type="radio" checked value="1" />فعال<input
                                id="ChkNotActive" name="g" runat="server" type="radio" value="2" />غيرفعال
                        </td>
                        <td>
                            تاريخ سرويس:</td>
                        <td>
                            <uc2:KCalendar ID="Date" runat="server" />
                        </td>
                        <td>
                        </td>
                        <td>
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
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtXml" name="txtXml" runat="server" />
                    <input type="text" id="txtCardReaderID" runat="server" />
                    <input type="text" id="txtXmlModel" runat="server" />
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        //////////////////////////////////This Page//////////////////////////////////////
        
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            if (checkNotEmpty() == true) {
                MakeXML()
                document.getElementById(MasterObj + "txtSubmit").value = "Save";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function MakeXML() {
            
            var StatusID = 0
            if (document.getElementById(MasterObj + "ChkActive").checked == true)
                StatusID = 1
            else if (document.getElementById(MasterObj + "ChkNotActive").checked == true)
                StatusID = 0
            //-------------------------
            var Date = document.getElementById(MasterObj + "Date_txtYear").value + "/" + document.getElementById(MasterObj + "Date_txtMonth").value + "/" + document.getElementById(MasterObj + "Date_txtDay").value
            //-------------------------
            var XMLStr = "<Tb>"
            XMLStr += "<CardReaderID>" + document.getElementById(MasterObj + "txtCardReaderID").value + "</CardReaderID>"
            XMLStr += "<CardReaderName>" + document.getElementById(MasterObj + "txtName").value + "</CardReaderName>"
            XMLStr += "<CardReaderCode>" + document.getElementById(MasterObj + "txtCode").value + "</CardReaderCode>"
            XMLStr += "<SerialNo>" + document.getElementById(MasterObj + "txtSerial").value + "</SerialNo>"
            XMLStr += "<ReadTypeID>" + document.getElementById(MasterObj + "cmbType").value + "</ReadTypeID>"
            XMLStr += "<SubSysID>" + document.getElementById(MasterObj + "CmbSystem").value + "</SubSysID>"
            XMLStr += "<ModelID>" + document.getElementById(MasterObj + "CmbModel").value + "</ModelID>"
            XMLStr += "<ServiceDate>" + Date + "</ServiceDate>"
            XMLStr += "<Location>" + document.getElementById(MasterObj + "txtLocation").value + "</Location>"
            XMLStr += "<TRT>" + document.getElementById(MasterObj + "txtPort").value + "</TRT>"
            XMLStr += "<Active>" + StatusID + "</Active>"
            XMLStr += "</Tb>"
            
            document.getElementById(MasterObj + "txtXml").value = "<Root>" + XMLStr + "</Root>"

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function checkNotEmpty() {
            if (document.getElementById(MasterObj + "txtName").value == "") {
                alert("لطفا نام کد کارتخوان را وارد نمائید")
                return false;
            }
            else if (document.getElementById(MasterObj + "txtCode").value == "") {
                alert("لطفا کد را وارد نمائید")
                return false;
            }
            else if (document.getElementById(MasterObj + "txtSerial").value=="") {
                alert("لطفا سريال را وارد نمائید")
                return false;
            }
            else if (document.getElementById(MasterObj + "cmbType").value == "" || document.getElementById(MasterObj + "cmbType").value == 0) {
                alert("لطفا نوع را انتخاب نمائید")
                return false;
            }
            else if (document.getElementById(MasterObj + "txtLocation").value == "") {
                alert("لطفا محل استقرار  را وارد نمائید")
                return false;
            }
            else if (document.getElementById(MasterObj + "txtPort").value == "") {
                alert("لطفا  شماره پورت مجازی را وارد نمائید")
                return false;
            }
            else if (document.getElementById(MasterObj + "CmbSystem").value == "" || document.getElementById(MasterObj + "CmbSystem").value == 0) {
                alert("لطفا نام سیستم را انتخاب نمائید")
                return false;
            }
            else if (document.getElementById(MasterObj + "CmbFactory").value == "" || document.getElementById(MasterObj + "CmbFactory").value == 0) {
                alert("لطفا نام شرکت سازنده را انتخاب نمائید")
                return false;
            }
            else if (document.getElementById(MasterObj + "CmbModel").value == "" || document.getElementById(MasterObj + "CmbModel").value == 0) {
                alert("لطفا مدل را انتخاب نمائید")
                return false;
            }
            else if ((document.getElementById(MasterObj + "txtPort").value).length >2) {
                alert("شماره پورت مجازی نميتواند بيش از دورقم باشد")
                return false;
            }
            var Date = document.getElementById(MasterObj + "Date_txtYear").value + "/" + document.getElementById(MasterObj + "Date_txtMonth").value + "/" + document.getElementById(MasterObj + "Date_txtDay").value
            if (Date == "//") {
                alert('لطفا تاريخ را وارد کنيد')
                return false;
            }
            return true;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnChangeCmbFactory() {
            document.getElementById(MasterObj + "CmbModel").innerHTML = "";
            ////
            var optionEl;
            optionEl = document.createElement("OPTION")
            document.all(MasterObj + "CmbModel").options.add(optionEl)
            document.all(MasterObj + "CmbModel").all(0).innerText = "انتخاب نشده"
            document.all(MasterObj + "CmbModel").all(0).value = 0
            //=========================
            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlModel").value);
            xmlDoc.setProperty("SelectionLanguage", "XPath");
            var xmlNodes;

            xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/Lcombo[BrandID=" + document.getElementById(MasterObj + "CmbFactory").value + "]");
            if (xmlNodes.length != 0)
                for (var i = 0; i < xmlNodes.length; i++) {
                optionEl = document.createElement("OPTION")
                document.all(MasterObj + "CmbModel").options.add(optionEl)
                document.all(MasterObj + "CmbModel").all(i + 1).innerText = xmlNodes.item(i).selectSingleNode("Title").text;
                document.all(MasterObj + "CmbModel").all(i + 1).value = xmlNodes.item(i).selectSingleNode("Val").text;
            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            document.getElementById(MasterObj + "txtCardReaderID").value = 0
            
            document.getElementById(MasterObj + "txtName").value = ""
            document.getElementById(MasterObj + "txtCode").value = ""
            document.getElementById(MasterObj + "txtSerial").value = ""
            document.getElementById(MasterObj + "cmbType").value = 0
            document.getElementById(MasterObj + "txtLocation").value = ""
            document.getElementById(MasterObj + "txtPort").value = ""
            document.getElementById(MasterObj + "CmbSystem").value =0
            document.getElementById(MasterObj + "CmbFactory").value = 0
            document.getElementById(MasterObj + "CmbModel").value = 0

            document.getElementById(MasterObj + "Date_txtYear").value = ""
            document.getElementById(MasterObj + "Date_txtMonth").value = ""
            document.getElementById(MasterObj + "Date_txtDay").value = ""

            document.getElementById(MasterObj + "ChkActive").checked = true
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onblurtxtSysCodeName() {
            if (document.getElementById(MasterObj + "txtCodeName").value == "") {
                document.getElementById(MasterObj + "txtCodeName").value = document.getElementById(MasterObj + "txtSysCodeName").value
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onblurtxtSysCode() {
            if (document.getElementById(MasterObj + "txtUserCode").value == "") {
                document.getElementById(MasterObj + "txtUserCode").value = document.getElementById(MasterObj + "txtSysCode").value
            }
        }
        
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>

</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        #SelType
        {
            width: 123px;
        }
        #SelType0
        {
            width: 125px;
        }
        #SelType1
        {
            width: 127px;
        }
        #SelType2
        {
            width: 125px;
        }
        #txtName0
        {
            width: 87px;
        }
        #SelSys
        {
            width: 122px;
        }
        #SelFactory
        {
            width: 123px;
        }
        #SelModel
        {
            width: 124px;
        }
    </style>
</asp:Content>
