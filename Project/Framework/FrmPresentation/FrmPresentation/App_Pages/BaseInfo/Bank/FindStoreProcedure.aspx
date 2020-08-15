<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="FindStoreProcedure.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Bank.FindStoreProcedure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <script type="text/javascript" language="javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        var MasterObj = "ctl00_ContentPlaceHolder1_"
        function BeginRequestHandler(sender, args) {
            
        }

        function EndRequestHandler(sender, args) {
            $get(MasterObj + "txtSubmit").value = "";

        }
    </script>

    <table  >
        <tr>
            <td style="text-align :right" >
                نام روال:
            </td>
            <td>
                <input id="txtTemplate" type="text" style="width: 284px" class="TxtControls" runat="server" />
            </td>
            <td style="text-align :right" >
                نام Schema:
            </td>
            <td>
                <input id="txtSPName" type="text" style="width: 82px" class="TxtControls" runat="server"
                    align="right" />
            </td>
            <td>
                <div>
                    <img alt="پيدا کردن sp" onclick="OnClickBtnFilterSP()" src="../../../App_Utility/Images/Icons/btn_refresh.gif"
                        id="ImgFilterSP" style="cursor: pointer" />
                </div>
            </td>
            <td style="text-align :right" >
                نام Object:
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:DropDownList ID="cmbSp" Width="250px" class='txtControls' onchange="OnClickBtnFilter()"
                            runat="server">
                        </asp:DropDownList>
                        <input id="txtAlert" type="hidden" runat="server" />
                        <input id="txtValidate" type="hidden" runat="server" />
                        <input id="txtXmlTemplate" type="hidden" runat="server" />
                        <input id="txtTemplateID" type="hidden" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <table>
                    <tr>
                        <td style="text-align :right" >
                            آدرس صفحه :
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div >
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <textarea id="txtPagesPath" runat="server" dir="ltr" style="width: 1100px; height:200px;
                                            scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #b0c4de;" readonly rows="2" class='txtControls'></textarea>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <table>
                    <tr>
                        <td style="text-align: right">
                            sp های استفاده شده :
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <textarea id="txtFindSp" runat="server" dir="ltr" style="width: 1100px; height: 250px;
                                            scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #b0c4de;" readonly rows="2" class='txtControls'></textarea>
                                            <asp:HiddenField runat="server" ID="XmlFindSp" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
      <%--  <cc1:mysecurity id="OnLineUser" runat="server">
        </cc1:mysecurity>--%>
        <asp:Button ID="BtnSubmit" runat="server" Text="Button" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
    </div>
 <script language="javascript" type="text/javascript">
     var MasterObj = "ctl00_ContentPlaceHolder1_"
     function OnClickBtnFilterSP() {
         document.getElementById(MasterObj + 'txtSubmit').value = "FilterSP"
         document.getElementById(MasterObj + 'BtnSubmit').click()
     }
     //=========================================================================
     function OnClickBtnFilter() {
         document.getElementById(MasterObj + 'txtSubmit').value = "Filter"
         document.getElementById(MasterObj + 'BtnSubmit').click()
     }
     //=========================================================================
 </script>   
</asp:Content>
