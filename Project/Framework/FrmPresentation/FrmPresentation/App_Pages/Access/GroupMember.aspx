<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroupMember.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.GroupMember"
    MasterPageFile="../../App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="~/App_Utility/ToolBar/NewToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="~/App_Utility/ToolBar/Shortkey.ascx" TagName="Shortkey" TagPrefix="uc2" %>
<%@ Register Src="~/App_Utility/ToolBar/Paging.ascx" TagName="Paging" TagPrefix="uc5" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc4" %>
<asp:Content ID="Contenthead" runat="server" ContentPlaceHolderID="head">

</asp:Content>
<asp:Content ID="ContentShortKey" ContentPlaceHolderID="ContentPlaceHolderShortKey" runat="Server">
   <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/Access/GroupMember.js">
       
    </script>
<uc2:Shortkey ID="OShortkey" runat="server"  />
</asp:Content>
<asp:Content ID="ContentToolbar" ContentPlaceHolderID="ContentPlaceHolderToolbar" runat="Server">
<uc1:ToolBar ID="OToolBar" runat="server"  />
</asp:Content>
<asp:Content ID="ContentSearch" ContentPlaceHolderID="ContentPlaceHolderSearch" runat="Server">
 <table>
                    <tr>
                        <td>
                            نام گروه:
                        </td>
                        <td>
                            <div align="right">
                                <input style="width: 200px;" type="text" id="txtGroupName" runat="server" class="TxtControls" /></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            شرح:
                        </td>
                        <td>
                            <div align="right">
                                <textarea style="width: 350px; height: 50px" id="TxtGroupDesc" type="text" runat="server"
                                    class="TxtControls"></textarea>
                            </div>
                        </td>
                    </tr>
                </table>
</asp:Content>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" >
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
            $get(MasterObj + "txtAlert").value = StrVal
            //if (StrVal == "BtnNext" | StrVal == "BtnPrev" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const") {
            LastSelectedRow = "";
            CountChkSelected = 0
            if (StrVal == "ImgRefreshPerson") {

                document.getElementById('ImgRefreshPerson').disabled = true;
                document.getElementById('MaskedDiv').style.display = 'none';
                document.getElementById('ModalPopupDiv').style.display = 'none';

            }

            if (StrVal != "") {

                LastSelectedRow = "";
                CountChkSelected = 0
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
            SetChk()
            if (StrVal == "Delete") {
                if ($get(MasterObj + "txtAlert").value != "")
                    SetMsg($get(MasterObj + "txtAlert").value);
            }
            $get(MasterObj + "txtSubmit").value = "";
            if (document.getElementById(MasterObj + "txtGroupAccessID").value != "0")
                document.getElementById('OToolBar_BtnSelect').style.display = "inline"

        }
    </script>
    <table>
        <tr>
            <td>
                <div align="right">
                    <table>
                        <tr>
                            <td>
                                پرسنلي :
                            </td>
                            <td>
                                <uc4:ComboBox ID="CmbPerson" runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr align="right">
            <td align="right">
                <div align="right">
                    <input type="checkbox" id="chkAllSelected" runat="server" onclick="onclickchkAllSelected(this)" />نمايش
                    انتخاب شده ها
                </div>
            </td>
        </tr>
         <tr><td>
                            <uc5:Paging ID="OPaging" runat="server"  />
                            </td></tr>
        <tr>
            <td align="center" valign="top">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtOnLineUser" runat="server" />
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="lblTo" runat="server" />
                        <asp:HiddenField ID="lblFrom" runat="server" />
                        <asp:HiddenField ID="lblTotal" runat="server" />
                        <asp:HiddenField ID="CurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtGroupAccessID" runat="server" />
                        <asp:HiddenField ID="txtPersonCode" runat="server" />
                        <asp:HiddenField ID="txtChkAllXML" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="txtSaveXml" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <input type="text" id="txtSessionID" runat="server" />
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        
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
        <input type="text" id="txtXMLGroupView" name="txtGroupView" runat="server" />
        <input type="text" id="txtXMLModify" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
    </div>
</asp:Content>

