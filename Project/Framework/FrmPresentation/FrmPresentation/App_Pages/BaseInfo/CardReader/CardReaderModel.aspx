<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="CardReaderModel.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.CardReaderModel"
    Title="Untitled Page" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/General.js"></script>

    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/Maskdiv.js"></script>

    <table>
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
                        LastSelectedRow = null;
                        if (document.getElementById(MasterObj + "txtAlert").value != "") {
                            SetMsg(document.getElementById(MasterObj + "txtAlert").value)
                            document.getElementById(MasterObj + "txtAlert").value=""
                        }
                       
                    }
                </script>

            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            شرکت سازنده:
                        </td>
                        <td>
                            <asp:DropDownList ID="CmbFactory" runat="server" Width="150px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            مدل دستگاه:
                        </td>
                        <td>
                            <input type="text" id="txtModel" runat="server" style="width: 100px" />
                        </td>
                        <td>
                            پورت اتصال:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbPortType" runat="server" Width="150px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" PageName="CardReaderModel.aspx" runat="server" />
            </td>
        </tr>
        <tr align="center">
            <td>
            <div style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #b0c4de; height: 380px; position: relative;">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
                </div>
            </td>
        </tr>
        <tr><td>
        <hr style="width: 447px;height: 3px" />
        <table>
                    <tr>
                        <td>
                            شرکت سازنده:
                        </td>
                        <td>
                            <asp:DropDownList ID="CmbFactoryNew" runat="server" Width="150px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            مدل دستگاه:
                        </td>
                        <td>
                            <input type="text" id="txtModelNew" runat="server" style="width: 100px" />
                        </td>
                        <td>
                            پورت اتصال:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbPortTypeNew" runat="server" Width="150px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
        </td></tr>
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
                    <input type="text" id="txtCardReaderModelID" runat="server" />
                    <input type="text" id="txtCardReaderModelIDNew" runat="server" />
                    <input type="text" id="txtXml" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
//            var strUrl = 'CardReaderModelNew.aspx?CardReaderModelID=0'
//            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 150px;dialogWidth: 700px;center: Yes;help: no;status: no')
//            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
//            if (rValue == 1) {
//                document.getElementById(MasterObj + "txtSubmit").value = "Filter";
//                document.getElementById(MasterObj + "BtnSubmit").click();
            //            }
            document.getElementById(MasterObj + "CmbFactoryNew").value = 0
            document.getElementById(MasterObj + "txtModelNew").value = ""
            document.getElementById(MasterObj + "cmbPortTypeNew").value = 0
            document.getElementById(MasterObj + "txtCardReaderModelIDNew").value="0"
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnEdit() {
            //LastSelected
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            if (LastSelectedRow != null) {

//                var strUrl = 'CardReaderModelNew.aspx?CardReaderModelID=' + LastSelectedRow.getAttribute("CardReaderModelID")
//                           + '&BrandID=' + LastSelectedRow.getAttribute("BrandID")
//                           + '&Model=' + LastSelectedRow.cells(1).innerText
//                           + '&PortTypeID=' + LastSelectedRow.getAttribute("PortTypeID")

//                var rValue = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 150px;dialogWidth: 700px;center: Yes;help: no;status: no')
//                if (rValue == 1) {
//                    document.getElementById(MasterObj + "txtSubmit").value = "Filter";
//                    document.getElementById(MasterObj + "BtnSubmit").click();
                //                }
                document.getElementById(MasterObj + "CmbFactoryNew").value = LastSelectedRow.getAttribute("BrandID")
                document.getElementById(MasterObj + "txtModelNew").value = LastSelectedRow.cells(1).innerText
                document.getElementById(MasterObj + "cmbPortTypeNew").value = LastSelectedRow.getAttribute("PortTypeID")
            }
            else {
                alert('لطفا سطر مورد نظر را انتخاب کنيد')
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnDel() {

            if (LastSelectedRow != null) {
                if (confirm('آيا براي حذف مطمئن هستيد؟')) {
                    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
                    document.getElementById(MasterObj + "txtSubmit").value = "Delete";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else {
                alert('لطفا سطر مورد نظر را انتخاب کنيد')
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
            document.getElementById(MasterObj + "txtCardReaderModelID").value = LastSelectedRow.getAttribute("CardReaderModelID")
            document.getElementById(MasterObj + "txtCardReaderModelIDNew").value = LastSelectedRow.getAttribute("CardReaderModelID")
            
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OndbClickGrd() {
            OnClickBtnEdit()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnShowAll()
        {
            ClearAll()
            OnClickBtnFilter()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function ClearAll() {
            document.getElementById(MasterObj + "CmbFactory").value = 0
            document.getElementById(MasterObj + "txtModel").value = ""
            document.getElementById(MasterObj + "cmbPortType").value = 0
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
            var XMLStr = "<Tb>"
            XMLStr += "<CardReaderModelID>" + document.getElementById(MasterObj + "txtCardReaderModelIDNew").value + "</CardReaderModelID>"
            XMLStr += "<Factory>" + document.getElementById(MasterObj + "CmbFactoryNew").value + "</Factory>"
            XMLStr += "<Model>" + document.getElementById(MasterObj + "txtModelNew").value + "</Model>"
            XMLStr += "<PortType>" + document.getElementById(MasterObj + "cmbPortTypeNew").value + "</PortType>"
            XMLStr += "</Tb>"
            document.getElementById(MasterObj + "txtXml").value = "<Root>" + XMLStr + "</Root>"
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function checkNotEmpty() {
            if (document.getElementById(MasterObj + "CmbFactoryNew").value == "" || document.getElementById(MasterObj + "CmbFactoryNew").value == 0) {
                alert("لطفا نام شرکت سازنده را انتخاب نمائید")
                return false;
            }
            else if (document.getElementById(MasterObj + "txtModelNew").value == "") {
                alert("لطفا مدل دستگاه را وارد نمائید")
                return false;
            }
            else if (document.getElementById(MasterObj + "cmbPortTypeNew").value == "" || document.getElementById(MasterObj + "cmbPortTypeNew").value == 0) {
                alert("لطفا پورت اتصال را انتخاب نمائید")
                return false;
            }

            return true;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>
</asp:Content>
