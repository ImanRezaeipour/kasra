<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="ErjaCartable.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.WorkFlow.ErjaCartable" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .linkClass
        {
            text-decoration:underline;
            text-align:center;
            color:Blue;
            cursor:pointer;
        }
        .TableStyle
        {
            border: thin groove #000000; 
            background-color: #C5D5E9;
            scrollbar-hightlight-color: white;
            overflow: auto; 
            scrollbar-arrow-color: black; 
            scrollbar-base-color: #B1D3FF;
            height:370px; 
            clear: right; 
            clip: rect(auto, auto, auto, auto);
            vertical-align: top; 
            float: right;
            width:550px;
            height:120px;
        }
        
    </style>
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="1800" runat="server">
    </asp:ScriptManager>
     <div style="display:none"> <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" /></div>
    <table align="right">
        <tr>
            <td valign="top"  align="right">
                <table class="TableStyle"  align="right">
                    <tr>
                        <td  colspan="4">
                            <uc1:ToolBar ID="OToolBar" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            نوع ارجاع :
                        </td>
                        <td align="right" style="width:180px" >
                            <asp:DropDownList ID="CmbErja" runat="server" CssClass="TxtControls" onchange="OnChangeCmbErja()">
                            </asp:DropDownList>
                        </td>
                        <td id="TDPerson" >
                            پرسنلي :
                        </td>
                        <td id="TDCmbPerson">
                            <uc4:ComboBox ID="CmbPerson" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            شرح :
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="txtDescr" CssClass="TxtControls" runat="server" TextMode="MultiLine"
                                Width="470px" Height="50px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="center">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                    <asp:HiddenField ID="txtValidate" runat="server" />
                                    <asp:HiddenField ID="txtDocAction" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtErjaXml" name="txtActionXml" runat="server" />
        <input type="text" id="txtActionXml" name="txtActionXml" runat="server" />
    </div>
    <script type="text/javascript" src="../../../App_Utility/Scripts/jquery-1.4.1.min.js"></script>
    <script>
        document.body.style.overflowY = "hidden";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var StrChk = "";
        OnChangeCmbErja();
        //===============================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //--------------------------------------------------------------------------------------------
        function BeginRequestHandler(sender, args) {
        }
        //--------------------------------------------------------------------------------------------
        function EndRequestHandler(sender, args) {
            //----------------------------------------------------------------------------------------       
            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value == "1") {
                    SetMsg($get(MasterObj + "txtAlert").value);
                    window.returnValue = 1;
                    window.close();
                }
                else
                    alert($get(MasterObj + "txtAlert").value);
            }
        }
        //===============================================================================================
        function OnChangeCmbErja() {
            if ($("#" + MasterObj + "CmbErja").val() == "-1" || $("#" + MasterObj + "CmbErja").val() == "-2") {
                $("#" + MasterObj + "CmbPerson_txtCode").val("");
                $("#" + MasterObj + "CmbPerson_txtPCode").val("");
                $("#" + MasterObj + "CmbPerson_txtName").val("");
                $("#TDCmbPerson").css("display", "none");
                $("#TDPerson").css("display", "none");
            }
            else {
                $("#TDCmbPerson").css("display", "inline");
                $("#TDPerson").css("display", "inline");
            }
        }
        //===============================================================================================
        function OnClickBtnErja() {
            if (chkIsEmty()) {
                $("#" + MasterObj + "txtActionXml").val("<Root>" + MakeXmlAction($("#" + MasterObj + "CmbErja").val(), $("#" + MasterObj + "CmbPerson_txtCode").val(), "P") + "</Root>");
                $get(MasterObj + "txtSubmit").value = "Action";
                $get(MasterObj + "BtnSubmit").click();
         }
        }
        //===============================================================================================
        function MakeXmlAction(Action, RPID, RPType) {
            StrChk = $("#" + MasterObj + "txtErjaXml").val();
            var oXmlDoc = new ActiveXObject("MICROSOFT.XMLDOM")
            oXmlDoc.async = "false"
            oXmlDoc.loadXML("<Root>" + StrChk + "</Root>");
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
            for (var i = 0; i < oXmlNodes.length; i++) {
                var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(i));
                f.selectSingleNode("ActorDesc").text = $("#" + MasterObj + "txtDescr").val();
                oXmlDoc.childNodes[0].appendChild(f);
            }
            var strXml = oXmlDoc.xml;
            StrChk = strXml.replace("<Root>", "");
            StrChk = StrChk.replace("</Root>", "");
            StrChk += "<ActionTb>"
            StrChk += "<Action>" + Action + "</Action>"
            if (RPID != "")
                StrChk += "<R_P_ID>" + RPID + "</R_P_ID>"
            if (RPType != "")
                StrChk += "<R_P_Type>" + RPType + "</R_P_Type>"
            StrChk += "</ActionTb>"
            return StrChk;
        }
        //===============================================================================================
        function chkIsEmty() {
            if (($("#" + MasterObj + "CmbErja").val() == "-3" || $("#" + MasterObj + "CmbErja").val() == "-4")
            && $("#" + MasterObj + "CmbPerson_txtCode").val() == "") {
                alert("وارد کردن پرسنل ارجاع شونده الزامي است");
                $("#" + MasterObj + "CmbPerson_txtPCode").focus();
                return false;
            }
            else if ($("#" + MasterObj + "txtDescr").val().toString().trim() == "") {
                alert("وارد کردن شرح الزامي است");
                $("#" + MasterObj + "txtDescr").focus();
                return false;
            }
            else
                return true;
        }
        //===============================================================================================
    </script>
</asp:Content>
