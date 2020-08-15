<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="CardReaderModelNew.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.CardReaderModelNew"
    Title="Untitled Page" %>

<%@ Register src="../../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/General.js"></script>

    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/Maskdiv.js"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <script type="text/javascript" language="javascript">
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function BeginRequestHandler(sender, args) {
            
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function EndRequestHandler(sender, args) {
            
            
            if (document.getElementById(MasterObj + "txtAlert").value != "") {
                SetMsg(document.getElementById(MasterObj + "txtAlert").value)
                document.getElementById(MasterObj + "txtAlert").value = ""
            }
            returnValue=1
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>

    <table>
        <tr>
            <td>
            
                <uc1:ToolBar ID="OToolBar" runat="server" />
            
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
        <tr><td>
        
        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
                <div style="display: none">
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtCardReaderModelID" runat="server" />
                    <input type="text" id="txtXml" runat="server" />
                    <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                </div>
        </td></tr>
    </table>
    
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
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
            var XMLStr = "<Tb>"
            XMLStr += "<CardReaderModelID>" + document.getElementById(MasterObj + "txtCardReaderModelID").value + "</CardReaderModelID>"
            XMLStr += "<Factory>" + document.getElementById(MasterObj + "CmbFactory").value + "</Factory>"
            XMLStr += "<Model>" + document.getElementById(MasterObj + "txtModel").value + "</Model>"
            XMLStr += "<PortType>" + document.getElementById(MasterObj + "cmbPortType").value + "</PortType>"
            XMLStr += "</Tb>"
            document.getElementById(MasterObj + "txtXml").value = "<Root>" + XMLStr + "</Root>"
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function checkNotEmpty() {
            if (document.getElementById(MasterObj + "CmbFactory").value == "" || document.getElementById(MasterObj + "CmbFactory").value == 0) {
                alert("لطفا نام شرکت سازنده را انتخاب نمائید")
                return false;
            }
            else if (document.getElementById(MasterObj + "txtModel").value == "" ) {
                alert("لطفا مدل دستگاه را وارد نمائید")
                return false;
            }
            else if (document.getElementById(MasterObj + "cmbPortType").value == "" || document.getElementById(MasterObj + "cmbPortType").value == 0) {
                alert("لطفا پورت اتصال را انتخاب نمائید")
                return false;
            }
            
            return true;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            document.getElementById(MasterObj + "CmbFactory").value = 0
            document.getElementById(MasterObj + "txtModel").value = ""
            document.getElementById(MasterObj + "cmbPortType").value = 0
            document.getElementById(MasterObj + "txtCardReaderModelID").value="0"
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>
</asp:Content>
