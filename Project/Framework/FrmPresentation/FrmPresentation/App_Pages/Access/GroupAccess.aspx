<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroupAccess.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.GroupAccess"
    MasterPageFile="../../App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<%@ Register Src="../../App_Utility/ToolBar/NewToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="~/App_Utility/ToolBar/Paging.ascx" TagName="Paging" TagPrefix="uc5" %>
<%@ Register Src="~/App_Utility/ToolBar/Shortkey.ascx" TagName="Shortkey" TagPrefix="uc2" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderShortKey" runat="Server">
<script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>

    <script language="javascript" src="../../App_Utility/Scripts/Access/GroupAccess.js">
        
    </script>
<uc2:Shortkey ID="OShortkey" runat="server"  />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderToolbar" runat="Server">
<uc1:ToolBar ID="OToolBar" runat="server"  />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderSearch" runat="Server">
  <table>
                                <tr>
                                    <td>
                                        پرسنلي :
                                    </td>
                                    <td>
                                        <uc4:ComboBox ID="CmbPerson" runat="server"  />
                                    </td>
                                </tr>
                            </table>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" src="../../App_Utility/Scripts/General.js" type="text/javascript"></script>

    <script language="javascript" src="../../App_Utility/Scripts/KeySorting.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/Moving.js"></script>

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/Maskdiv.js"></script>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var MasterObjSearch = "ctl00_Snap3_ContentPlaceHolderSearch_";
        /////-------------------------------------------
    </script>

    <table >
        <tr >
            <td valign="top" align="right">
                <asp:ScriptManager ID="ScriptManager1" runat="server" 
                    ScriptMode="Release">
                </asp:ScriptManager>

                <script type="text/javascript" language="javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {
                        //if (args.get_postBackElement().id == "ctl00_ContentPlaceHolder1_BtnSubmit")
//                        
                    }

                    function EndRequestHandler(sender, args) {
//                        

                        var StrVal = $get(MasterObj + "txtSubmit").value
                        //alert(document.getElementById(MasterObj + "txtrecID").value)
                        //if (StrVal == "BtnNext" | StrVal == "BtnPrev" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const") {
                        if (StrVal != "") {
                            LastSelectedRow = "";
                            if ($get(MasterObj + "lblTo").value == "") {
                                document.getElementById('OPaging_txtFromData').value = "";
                                document.getElementById('OPaging_txtToData').value = "";
                                document.getElementById('OPaging_txtTotalData').value = "";

                                document.getElementById('OPaging_BtnNext').disabled = true;
                                document.getElementById('OPaging_BtnPrv').disabled = true;
                                document.getElementById('OPaging_BtnFirst').disabled = true;
                                document.getElementById('OPaging_BtnLast').disabled = true;
                            }
                            else if ($get(MasterObj + "lblTo").value != "") {
                                document.getElementById('OPaging_txtFromData').value = $get(MasterObj + "lblFrom").value;
                                document.getElementById('OPaging_txtToData').value = $get(MasterObj + "lblTo").value;
                                document.getElementById('OPaging_txtTotalData').value = $get(MasterObj + "lblTotal").value;
                                document.getElementById('OPaging_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
                                document.getElementById('OPaging_txtTotalPage').value = $get(MasterObj + "Totalpage").value;

                                if (parseInt(document.getElementById("OPaging_txtCurPage").value) == parseInt(document.getElementById("OPaging_txtTotalPage").value))
                                    document.getElementById('OPaging_BtnNext').disabled = true
                                else
                                    document.getElementById('OPaging_BtnNext').disabled = false;

                                if (parseInt($get(MasterObj + "lblFrom").value) == 1)
                                    document.getElementById('OPaging_BtnPrv').disabled = true
                                else
                                    document.getElementById('OPaging_BtnPrv').disabled = false;

                                document.getElementById('OPaging_BtnFirst').disabled = false;
                                document.getElementById('OPaging_BtnLast').disabled = false;
                            }
                        }
                        if ($get(MasterObj + "txtAlert").value != "")
                            SetMsg($get(MasterObj + "txtAlert").value);
                        $get(MasterObj + "txtAlert").value = "";
                        $get(MasterObj + "txtSubmit").value = "";

//                        if (StrVal == "CheckIDBeforeDelete") {
//                            if ($get(MasterObj + "txtAlert").value == "1") {
//                                var Msg = 'این و با حذف آن اطلاعات مربوطه حذف مي شوند' + String.fromCharCode(13) + 'آيا براي حذف موافقيد؟';
//                                if (confirm(Msg) == true) {
//                                    $get(MasterObj + "txtSubmit").value = "Delete";
//                                    $get(MasterObj + "BtnSubmit").click();
//                                }
//                            }
//                            else {
//                                $get(MasterObj + "txtSubmit").value = "Delete";
//                                $get(MasterObj + "BtnSubmit").click();
//                            }
//                        }

                        
                    }
                </script>

                <table>
                    <tr>
                        <td>
                            <table>
                            <tr><td>
                            <uc5:Paging ID="OPaging" runat="server"  />
                            </td></tr>
                                <tr>
                                    <td id="GrdTD"  align="center" valign="top">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                                <asp:HiddenField ID="txtAlert" runat="server" />
                                                <asp:HiddenField ID="lblFrom" runat="server" />
                                                <asp:HiddenField ID="lblTo" runat="server" />
                                                <asp:HiddenField ID="Totalpage" runat="server" />
                                                <asp:HiddenField ID="txtCurPage" runat="server" />
                                                <asp:HiddenField ID="lblTotal" runat="server" />
                                                <asp:HiddenField ID="txtPageSize" runat="server" />
                                                <asp:HiddenField ID="txtPageNumber" runat="server" />
                                                <asp:HiddenField ID="txtOrderString" runat="server" />
                                                <asp:HiddenField ID="txtPersonCode" runat="server" />
                                                <asp:HiddenField ID="CurPage" runat="server" />
                                                <asp:HiddenField ID="txtGroupAccessID" runat="server" />
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
                    <input type="text" id="txtSessionID" runat="server" />
                    <input type="text" id="txtOnLineUser" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
                    <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
                    <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
                    <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
                    <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
                    <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                        runat="server" />
                    <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                        runat="server" />
                    <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                    <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                    <input type="text" id="txtGroupِDesc" runat="server" />
                    <input type="text" id="txtGroupName" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                </div>
            </td>
        </tr>
    </table>

   

</asp:Content>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
 
</asp:Content>
