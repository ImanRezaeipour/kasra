<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganChart.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.OrganizationChart.OrganChart"
    ValidateRequest="false" MasterPageFile="../../../App_Utility/MasterPage/MasterBule.master" %>
    <%@ Register assembly="ComponentArt.Web.UI" namespace="ComponentArt.Web.UI" tagprefix="ComponentArt" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="../../../App_Utility/Scripts/KeySorting.js"></script>

    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/General.js"></script>

    <script language="javascript" src="../../../App_Utility/Scripts/farsi.js"></script>

    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/Maskdiv.js"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release">
    </asp:ScriptManager>

    <script type="text/javascript" language="javascript">
        var elem
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {

            //if (args.get_postBackElement().id == "ctl00_ContentPlaceHolder1_BtnSubmit")
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
            elem = args.get_postBackElement();
        }

        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";

            if (elem.id == 'ctl00_ContentPlaceHolder1_BtnSubmitPerson') {

                var OGrid = document.getElementById("GrdPersonRole");
                //alert($get(MasterObj + "txtPersonValue").value)
                //alert("***********"+RowIndex)
                OGrid.rows(RowIndex).cells(3).innerText = $get(MasterObj + "txtPersonValue").value

                for (var i = 1; i < OGrid.rows.length; i++) {
                    OGrid.rows(i).cells(0).firstChild.disabled = false;
                    OGrid.rows(i).cells(1).firstChild.disabled = false;
                    OGrid.rows(i).cells(2).firstChild.disabled = false;
                    OGrid.rows(i).cells(2).childNodes(1).disabled = false;
                    OGrid.rows(i).cells(4).firstChild.disabled = false;
                    OGrid.rows(i).cells(5).firstChild.disabled = false;
                    if (OGrid.rows.length - 1 == RowIndex)
                        OGrid.rows(i).cells(6).firstChild.disabled = false;
                }
                //                OGrid.rows(RowIndex).cells(4).firstChild.disabled = false;
                //                if (OGrid.rows.length - 1 == RowIndex)
                //                    OGrid.rows(RowIndex).cells(6).firstChild.disabled = false;

                //--------------------------------------------------------

                var strXml = "<Root>" + str + "</Root>"
                var RoleID = OGrid.rows(RowIndex).getAttribute('RoleID')

                if (OGrid.rows(RowIndex).cells(0).firstChild.value == "0" || OGrid.rows(RowIndex).cells(0).firstChild.value == "")
                    return;
                if (OGrid.rows(RowIndex).cells(1).firstChild.value == "")
                    return;
                if (OGrid.rows(RowIndex).cells(2).firstChild.value == "")
                    return;

                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(strXml);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [RoleID=" + RoleID + " and RowIndex=" + RowIndex + "]");

                if (oXmlNodes.length > 0) {

                    oXmlNodes.item(0).selectSingleNode("PersonCode").text = OGrid.rows(RowIndex).cells(2).firstChild.value
                    if (oXmlNodes.item(0).selectSingleNode("Selected").text == 0)
                        oXmlNodes.item(0).selectSingleNode("Selected").text = 1;

                    strXml = oXmlDoc.xml;
                    str = strXml.replace("<Root>", "");
                    str = str.replace("</Root>", "");
                }
                else {
                    str += "<Tb>"
                    str += "<RowIndex>" + RowIndex + "</RowIndex>"
                    str += "<DepartmentID>" + document.getElementById(MasterObj + "txtDepartmentID").value + "</DepartmentID>"
                    str += "<RoleID>" + RoleID + "</RoleID>"
                    str += "<RoleType>" + OGrid.rows(RowIndex).cells(0).firstChild.value + "</RoleType>"
                    str += "<RoleTitle>" + OGrid.rows(RowIndex).cells(1).firstChild.value + "</RoleTitle>"
                    str += "<PersonCode>" + OGrid.rows(RowIndex).cells(2).firstChild.value + "</PersonCode>"
                    str += "<Selected>1</Selected>"
                    str += "</Tb>"
                }

            }

            //-------------------------------------------------------------
            if (elem.id == 'ctl00_ContentPlaceHolder1_BtnPSubmit') {

                var PSubmit = $get(MasterObj + "txtPSubmit").value

                switch (PSubmit) {
                    case "New":

                        if ($get(MasterObj + "txtPAlert").value != "")
                            SetMsg($get(MasterObj + "txtPAlert").value)
                        else
                            CreateNewDepartment()
                        break;
                    case "Edit":
                        if ($get(MasterObj + "txtPAlert").value != "")
                            SetMsg($get(MasterObj + "txtPAlert").value)
                        else {
                            PopupCreate.style.display = "inline"
                            document.getElementById(MasterObj + "txtFlagMode").value = "2";
                            EditDepartment()
                        }
                        break;
                    case "Save":
                        //alert($get(MasterObj + "txtPAlert").value)
                        if ($get(MasterObj + "txtPAlert").value != "") {
                            PopupCreate.style.display = "inline"
                            SetMsg($get(MasterObj + "txtPAlert").value)
                            $get(MasterObj + "txtDepartmentID").value = "0";
                            onClickBtnOK();
                        }
                        break;
                    case "SaveNew":
                        document.getElementById(MasterObj + "txtFlagMode").value = "1";
                        document.getElementById(MasterObj + "txtDepartmentID").value = "0"
                        if ($get(MasterObj + "txtPAlert").value != "") {
                            SetMsg($get(MasterObj + "txtPAlert").value)
                            PopupCreate.style.display = "inline"
                        }
                        if ($get(MasterObj + "txtNewDepartmentCode").value != "")
                            CreateNewDepartment();
                        $get(MasterObj + "txtDepartmentID").value = "0";
                        onClickBtnOK();
                        break;
                }

                $get(MasterObj + "txtPAlert").value = "";
                $get(MasterObj + "txtPSubmit").value = "";
            }

            //-------------------------------------------------------------
            if (elem.id == 'ctl00_ContentPlaceHolder1_BtnSubmitPersonRole') {
                if ($get(MasterObj + "txtTmpPRCode").value != "") {
                    FillTabTable();
                    SearchPopup.style.display = "inline"
                }
            }
            //-------------------------------------------------------------
            if (elem.id == 'ctl00_ContentPlaceHolder1_BtnSubmit') {
                str = "";
                if ($get(MasterObj + "txtSubmit").value == "AdvanceFilter") {
                    $get(MasterObj + "txtSubmit").value = "";
                    Cleargrd(XTabTable);
                    SearchPopup.style.display = "none"
                }
                //-----------------
                if ($get(MasterObj + "txtSubmit").value == "DelDepartment") {
                    $get(MasterObj + "txtSubmit").value = "";
                    SetMsg($get(MasterObj + "txtAlert").value)
                }
                //-----------------
                if ($get(MasterObj + "txtSubmit").value == "Modify") {
                    $get(MasterObj + "txtSubmit").value = "";
                    SetMsg($get(MasterObj + "txtAlert").value)
                }
            }

            if ($get(MasterObj + "txtSubmit").value == "ImgRefreshPerson") {

                document.getElementById('ImgRefreshPerson').disabled = true;
                document.getElementById('MaskedDiv').style.display = 'none';
                document.getElementById('ModalPopupDiv').style.display = 'none';

            }
            //alert(document.getElementById(MasterObj + "txtDepartmentID").value)
        }
    </script>

    <script language="javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var str = '';

        /////-------------------------------------------
    </script>

    <table scroll="no">
        <tr>
            <td align="right" valign="top">
                <table style="height: 499px; width: 884px;">
                    <tr>
                        <td valign="top" style="height: 38px">
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 46px;">
                                        &nbsp;برسنلی
                                    </td>
                                    <td style="width: 53px">
                                        <input id="txtPersonCode" name="txtPersonCode" onkeydown="OnKeyDownInt(this)" onblur="OnBlurTxtPersonCode()"
                                            type="text" runat="server" dir="rtl" style="width: 60px" 
                                            class="TxtControls" />
                                    </td>
                                    <td style="width: 120px">
                                        نام و نام خانوادکی :
                                    </td>
                                    <td style="width: 180px">
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:DropDownList onkeypress="return KeySort(this,false)" onchange="onChangeCmbPersonName()"
                                                    ID="CmbPersonName" runat="server" Width="150px" CssClass="DropDownList">
                                                </asp:DropDownList>
                                                <img id="ImgRefreshPerson" alt="به روزرساني نام" onclick="onClickImgRefreshPerson()"
                                                    src="../../../App_Utility/Images/Icons/Refresh1.png" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ImgRefreshPersonSubmit" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td align="left">
                                        &nbsp;</td>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="height: 16px">
                            <uc1:ToolBar ID="OToolBar" runat="server" PageName="OrganChart.aspx" PageID="1107" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top" style="height: 406px">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <table style="width: 894px; height: 405px">
                                        <tr>
                                            <td id="TDTree" align="right" valign="top" style="border-right: lightblue thin inset;
                                                border-top: lightblue thin solid; border-left: lightblue thin outset; width: 130px;
                                                border-bottom: lightblue thin solid; height: 311px">
                                                <div style="width: 187px; height: 396px; scrollbar-hightlight-color: white; overflow: auto;
                                                    scrollbar-arrow-color: black; scrollbar-base-color: #B1D3FF;">
                                                    <asp:TreeView ID="tvControl" ForeColor="Blue" SelectedNodeStyle-ForeColor="Red" SelectedNodeStyle-VerticalPadding="0"
                                                        runat="server" LineImagesFolder="../../../App_Utility/Images/TreeLineImages"
                                                        ShowLines="True" AutoGenerateDataBindings="False" OnSelectedNodeChanged="tvControl_SelectedNodeChanged">
                                                    </asp:TreeView>
                                                    <asp:HiddenField ID="txtTreePersonCode" runat="server" />
                                                    
                                                </div>
                                                <table border="0" cellpadding="0" cellspacing="0" width="200">
                                                  <tr>
                                                    <td class="TreeViewHeader">واحد سازماني</td>
                                                  </tr>
                                                </table>
                                                
                                                <ComponentArt:TreeView ID="TVNew" runat="server" Height="300px" 
                                                        Width="200px"
                                                        EnableViewState="true"
                                                          DragAndDropEnabled="true"
                                                          NodeEditingEnabled="true"
                                                          KeyboardEnabled="true"
                                                          MultipleSelectEnabled="true"
                                                          KeyboardCutCopyPasteEnabled="true"
                                                          DisplayMargin="true"
                                                          ShowLines="true"
                                                          CssClass="TreeViewMargin"
                                                          NodeCssClass="TreeNode"
                                                          SelectedNodeCssClass="SelectedTreeNode"
                                                          MultipleSelectedNodeCssClass="MultipleSelectedTreeNode"
                                                          HoverNodeCssClass="HoverTreeNode"
                                                          NodeEditCssClass="NodeEdit"
                                                          CutNodeCssClass="CutTreeNode"
                                                          MarginWidth="24"
                                                          DefaultMarginImageWidth="24"
                                                          DefaultMarginImageHeight="20"
                                                          LineImageWidth="19"
                                                          LineImageHeight="20"
                                                          DefaultImageWidth="16"
                                                          DefaultImageHeight="16"
                                                          NodeLabelPadding="3"
                                                          ParentNodeImageUrl="folders.gif"
                                                          LeafNodeImageUrl="folder.gif"
                                                          CollapseImageUrl="exp.gif"
                                                          ExpandImageUrl="col.gif"
                                                          ExpandCollapseImageWidth="19"
                                                          ExpandCollapseImageHeight="20"
                                                          ImagesBaseUrl="../../../App_Utility/Images/TreeViewImage/"
                                                          LineImagesFolderUrl="../../../App_Utility/Images/TreeViewLine/"
                                                          OnNodeMoved="TVNew_NodeMoved"
                                                          AutoPostBackOnNodeMove="true"
                                                          OnNodeRenamed="TVNew_NodeRenamed"
                                                          AutoPostBackOnNodeRename="true"
                                                          OnNodeCopied="TVNew_NodeCopied"
                                                          ExpandSinglePath="true">
                                                          <ClientEvents>
                                                              <NodeBeforeMove EventHandler="TVNew_onNodeBeforeMove" />
                                                              <NodeBeforeRename EventHandler="TVNew_onNodeBeforeRename" />
                                                            </ClientEvents>
                                                    </ComponentArt:TreeView>
                                            </td>
                                            <td id="TDGrid" align="center" valign="top" style="height: 311px">
                                                <div style="display: none">
                                                    <asp:HiddenField ID="txtDepartmentID" runat="server" />
                                                    <asp:HiddenField ID="txtDelFalg" runat="server" />
                                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                                    <asp:HiddenField ID="txtSaveXml" runat="server" />
                                                    <asp:HiddenField ID="txtCurPage" runat="server" />
                                                    <asp:HiddenField ID="txtSearch" runat="server" />
                                                    <asp:HiddenField ID="lblFrom" runat="server" />
                                                    <asp:HiddenField ID="lblTo" runat="server" />
                                                    <asp:HiddenField ID="lblTotal" runat="server" />
                                                </div>
                                                <div style="width: 100%; scrollbar-hightlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                                    scrollbar-base-color: #B1D3FF; height: 400px">
                                                    <asp:PlaceHolder EnableViewState="false" ID="GridViewPlaceHolder" runat="Server" />
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    <asp:AsyncPostBackTrigger ControlID="tvControl" EventName="SelectedNodeChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:HiddenField ID="txtPersonValue" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmitPerson" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <div style="display: none">
                <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID" runat="server" />        
                    <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="txtTmpPersonCode" name="txtTmpPersonCode" runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="txtOnlineUserCode" name="txtOnlineUserCode" runat="server" />
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
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtPSubmit" name="txtPSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <asp:Button ID="ImgRefreshPersonSubmit" runat="server" OnClick="ImgRefreshPersonSubmit_Click" />
                    <asp:Button ID="BtnPSubmit" runat="server" Text="BtnPSubmit" OnClick="BtnPSubmit_Click" />
                    <asp:Button ID="BtnSubmitPerson" runat="server" Text="BtnSubmitPerson" OnClick="BtnSubmitPerson_Click" />
                    <asp:Button ID="BtnSubmitTree" runat="server" Text="BtnSubmitTree" OnClick="BtnSubmitTree_Click" />
                    <asp:Button ID="BtnSubmitPersonRole" runat="server" Text="BtnSubmitPersonRole" OnClick="BtnSubmitPersonRole_Click" />
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div dir="rtl" id="PopupCreate" style="border-left: lightsteelblue 3px solid; border-right: #346fa4 3px solid;
                            border-top: lightsteelblue 3px solid; border-bottom: #346fa4 3px solid; position: absolute;
                            top: 200px; left: 200px; display: none; background-color: #e7eeff; right: 250px;
                            width: 488px;">
                            <table cellpadding="0" cellspacing="0" style="height: 43px; width: 497px;">
                                <tr>
                                    <td align="right" style="height: 13px; width: 113px;">
                                        نام واحد<td align="right" style="height: 13px; width: 126px;">
                                            <input id="txtOrgName" type="text" runat="server" style="width: 120px;" />
                                        </td>
                                        <td align="right" style="height: 13px; width: 105px;">
                                            نام واحد مافوق
                                        </td>
                                        <td align="right" style="height: 13px; width: 126px;">
                                            <select id="SelParentName" onkeypress="return KeySort(this,false)" runat="server">
                                                <option></option>
                                            </select>
                                        </td>
                                        <td align="right" style="height: 13px">
                                        
                                        <img  alt="نام واحد مافوق"
                                             id="BtnParentName" onclick="OnClickBtnParentName()" 
                                             src="/FrmPresentation/App_Utility/Images/Icons/select.png"
                                                style="cursor: pointer"  />
                                        </td>
                                </tr>
                                <tr>
                                    <td align="right" style="height: 11px; width: 113px;">
                                        نوع واحد
                                    </td>
                                    <td align="right" style="height: 11px; width: 126px;">
                                        <select id="SelOrgType" runat="server">
                                            <option></option>
                                        </select>
                                    </td>
                                    <td align="right" style="height: 11px; width: 105px;">
                                        کد واحد
                                    </td>
                                    <td align="right" style="height: 11px; width: 120px;">
                                        <input id="txtDepartmnetCode" type="text" runat="server" style="width: 120px;" />
                                    </td>
                                    <td align="right" style="height: 11px">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="5">
                                        <table cellpadding="3" cellspacing="2">
                                            <tr>
                                                <td>
                                                    <input id="BtnPSave" type="button" value="ذخيره" title="ذخيره" style="cursor: pointer"
                                                        onclick="OnClickBtnPSave()" />
                                                </td>
                                                <td>
                                                    <input id="BtnPSaveNew" type="button" value="ذخيره و ايجاد" style="cursor: pointer"
                                                        title="ذخيره و ايجاد" onclick="OnClickBtnPSaveNew()" />
                                                </td>
                                                <td>
                                                    <input id="BtnPCancel" type="button" value="انصراف" style="cursor: pointer" title="انصراف"
                                                        onclick="OnClickBtnPCancel()" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <asp:HiddenField ID="txtNewDepartmentCode" runat="server" />
                        <asp:HiddenField ID="txtFlagMode" runat="server" />
                        <asp:HiddenField ID="txtXmlDepartmnet" runat="server" />
                        <asp:HiddenField ID="txtDepID" runat="server" />
                        <asp:HiddenField ID="txtAccessDepartment" runat="server" />
                        <asp:HiddenField ID="txtPAlert" runat="server" />
                        <asp:HiddenField ID="txtColseFlag" runat="server" />
                        <asp:HiddenField ID="txtAllDepartmentXML" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnPSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div dir="rtl" id="SearchPopup" style="border-left: lightsteelblue 3px solid; border-right: #346fa4 3px solid;
                            border-top: lightsteelblue 3px solid; border-bottom: #346fa4 3px solid; position: absolute;
                            top: 200px; left: 200px; display: none; background-color: #e7eeff; right: 400px;
                            width: 288px;">
                            <table>
                                <tr>
                                    <td>
                                        واحدسازمانی :
                                        <asp:DropDownList ID="CmbDepartment" onkeypress="return KeySort(this,false)" onChange="onChangeCmbDepartment()"
                                            runat="server" Width="150px" CssClass="DropDownList">
                                        </asp:DropDownList>
                                        <img  alt="انتخاب واحد سازمانی"
                                        id="BtnSearchDepartment"  onclick="onClickBtnSearchDepartment()"
                                            
                                            src="/FrmPresentation/App_Utility/Images/Icons/select.png"
                                            />&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <table id="XTabTable_Header" style="border-right: #6666cc thin inset; border-top: #6666cc thin solid;
                                            border-left: #6666cc thin outset; width: 267px; border-bottom: #6666cc thin solid;
                                            height: 25px" cellspacing="0" cellpadding="0" border="0">
                                            <thead style="display: inline">
                                                <tr>
                                                    <td style="width: 65px; background-color: #e2d8ff" align="center">
                                                        نوع سمت
                                                    </td>
                                                    <td style="width: 63px; background-color: #e2d8ff" align="center">
                                                        نام سمت
                                                    </td>
                                                </tr>
                                            </thead>
                                        </table>
                                        <div style="scrollbar-highlight-color: white; overflow: auto; width: 99.81%; scrollbar-arrow-color: black;
                                            scrollbar-base-color: #b0c4de; height: 88.3%">
                                            <table id="XTabTable">
                                                <thead style="display: none">
                                                </thead>
                                            </table>
                                            <input id="BtnOK" name="BtnOK" type="button" value="فیلتر" onclick="onClickBtnOK()" /><input
                                                id="BtnCancel" onclick="onClickBtnCancel()" name="BtnCancel" type="button" value="انصراف" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <asp:HiddenField ID="txtPersonRoles" runat="server" />
                        <asp:HiddenField ID="txtTmpPRCode" runat="server" />
                        <asp:HiddenField ID="txtXmlPersonRoles" runat="server" />
                        <asp:HiddenField ID="txtTmpPDepartmentID" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmitPersonRole" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>

    <script language="javascript">
        //*************************************Declaration*************************************

        var RowIndex;
        var newrowindex = 0

        //alert($get(MasterObj + "tvControl").value)
        //alert(document.getElementById(MasterObj + "tvControl").value)
        //*************************************EndDeclaration*************************************

        //*************************************OnLoad*************************************
        //document.body.attachEvent('onkeydown', SetEnter)
        //document.body.attachEvent('onkeypress', SetEnter)
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


        //**********************************EndOnLoad*************************************

        //*************************************Toolbar*************************************
        function OnClickBtnNewAndAssignRole() {

            if ($get(MasterObj + "txtDepartmentID").value == "" && $get(MasterObj + "txtDepartmentID").value != "0") {
                alert("یک واحد سازمانی را انتخاب نمایید")
                return;
            }
            url = "NewAndAssignRole.aspx?DepartmentID=" + $get(MasterObj + "txtDepartmentID").value
            var rr = "";
            rr = window.showModalDialog(url, window, "dialogHeight: 160px;dialogWidth: 450px;center: Yes;help: no;status: no")
            
            
            if (rr != "" && rr != "undefined") {
                $get(MasterObj + "txtTmpPDepartmentID").value = $get(MasterObj + "txtDepartmentID").value
                onClickBtnOK();
            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            if (str == "") {
                alert("هیج موردی برای ذخیره وجود ندارد")
                return;
            }
            $get(MasterObj + "txtSaveXml").value = "<Root>" + str + "</Root>"
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML($get(MasterObj + "txtSaveXml").value);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=1]");

//            if (oXmlNodes.length == 0) {
//                alert("موردی برای ذخیره انتخاب نشده است")
//                return;
//            }

            document.getElementById(MasterObj + "txtSubmit").value = "Modify";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {

            if ($get(MasterObj + "txtDelFalg").value == "1")
                $get(MasterObj + "txtDepartmentID").value = "0"

            document.getElementById(MasterObj + "txtDepID").value = "0";
            document.getElementById(MasterObj + "SelParentName").innerHTML = "";
            document.getElementById(MasterObj + "txtPSubmit").value = "New";
            document.getElementById(MasterObj + "txtFlagMode").value = "1"; //Insert Mode
            document.getElementById(MasterObj + "BtnPSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnEdit() {
            //document.getElementById(MasterObj + "txtDepartmentID").value = "2";
            if (document.getElementById(MasterObj + "txtDepartmentID").value == "") {
                alert('لطفا يک واحد از چارت براي ويرايش انتخاب کنيد')
                return
            }
            document.getElementById(MasterObj + "txtDepID").value = document.getElementById(MasterObj + "txtDepartmentID").value
            document.getElementById(MasterObj + "txtFlagMode").value = "2";  //Update Mode
            document.getElementById(MasterObj + "txtPSubmit").value = "Edit";
            document.getElementById(MasterObj + "BtnPSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnDel() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            var OGrid = document.getElementById("GrdPersonRole");

            if (str == "") {
                if ($get(MasterObj + "txtDepartmentID").value != "") {
                    if (OGrid.rows.length - 1 > 1) {
                        alert("ابتدا بایستی سمتهای هر واحد پاک گردد")
                        return;
                    }
                }
                else if ($get(MasterObj + "txtDepartmentID").value == "" || $get(MasterObj + "txtDepartmentID").value == "0") {
                    alert("هیج موردی برای حذف انتخاب نشده است")
                    return;
                }
            }
            var Msg = "آيا براي حذف مطمئن هستيد؟"
            if (confirm(Msg) == true) {

                document.getElementById(MasterObj + "txtSaveXml").value = "<Root>" + str + "</Root>"
                document.getElementById(MasterObj + "txtSubmit").value = "DelDepartment";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnAdvanceFilter() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            
            $get(MasterObj + "txtTmpPRCode").value = $get(MasterObj + "txtPersonCode").value
            if ($get(MasterObj + "txtTmpPRCode").value == "")
                $get(MasterObj + "txtTmpPRCode").value = "0"
            document.getElementById(MasterObj + "BtnSubmitPersonRole").click();
        }
        //*************************************EndToolbar*************************************

        //*************************************ThisPage***************************************
        function SetEnter() {
            if (event.srcElement.id == "OToolBar_txtCurPage")
                return;

            if (event.srcElement.id == MasterObj + "txtPersonCode" || event.srcElement.id == MasterObj + "CmbPersonName") {
                if (window.event.keyCode == 13)
                    OnClickBtnSearch()
            }
            else
                window.event.keyCode = 9

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            document.getElementById(MasterObj + "txtTreePersonCode").value = document.getElementById(MasterObj + "txtPersonCode").value
            if (document.getElementById(MasterObj + "txtTreePersonCode").value == "")
                document.getElementById(MasterObj + "txtTreePersonCode").value = "0";
            document.getElementById(MasterObj + "txtSubmit").value = "Filter";
            //document.getElementById(MasterObj + "BtnSubmitTree").click();
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onChangeCmbPersonName() {
            document.getElementById(MasterObj + "txtPersonCode").value = document.getElementById(MasterObj + "CmbPersonName").value
            if (document.getElementById(MasterObj + "CmbPersonName").value == 0)
                document.getElementById(MasterObj + "txtPersonCode").value = ""
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurTxtPersonCode() {

            document.getElementById(MasterObj + "CmbPersonName").value = document.getElementById(MasterObj + "txtPersonCode").value
            if (document.getElementById(MasterObj + "txtPersonCode").value == "" || document.getElementById(MasterObj + "txtPersonCode").value == "0")
                document.getElementById(MasterObj + "CmbPersonName").value = 0
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onchangeRoleType(obj) {
            var OGrid = document.getElementById("GrdPersonRole");
            RowIndex = obj.parentElement.parentElement.rowIndex;
            var strXml = "<Root>" + str + "</Root>"
            var RoleID = OGrid.rows(RowIndex).getAttribute('RoleID');
            
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [RoleID=" + RoleID + " and RowIndex=" + RowIndex + "]");
            if (OGrid.rows(RowIndex).cells(0).firstChild.value == "0" || OGrid.rows(RowIndex).cells(0).firstChild.value == "") {
            if (oXmlNodes.length > 0)
                OGrid.rows(RowIndex).cells(0).firstChild.value=oXmlNodes.item(0).selectSingleNode("RoleType").text
                alert("وارد کردن نوع سمت الزامی است")
                return;
            }
            if (oXmlNodes.length > 0) {
                oXmlNodes.item(0).selectSingleNode("RoleType").text = OGrid.rows(RowIndex).cells(0).firstChild.value
                if (oXmlNodes.item(0).selectSingleNode("Selected").text == 0)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1;

                strXml = oXmlDoc.xml;
                str = strXml.replace("<Root>", "");
                str = str.replace("</Root>", "");
            }
            else {
                str += "<Tb>"
                str += "<RowIndex>" + RowIndex + "</RowIndex>";
                str += "<DepartmentID>" + document.getElementById(MasterObj + "txtDepartmentID").value + "</DepartmentID>"
                str += "<RoleID>" + RoleID + "</RoleID>"
                str += "<RoleType>" + OGrid.rows(RowIndex).cells(0).firstChild.value + "</RoleType>"
                str += "<RoleTitle>" + OGrid.rows(RowIndex).cells(1).firstChild.value + "</RoleTitle>"
                str += "<PersonCode>" + OGrid.rows(RowIndex).cells(2).firstChild.value + "</PersonCode>"
                str += "<Selected>1</Selected>"
                str += "</Tb>"
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onClickSelectPerson(Obj) {


            var RequsterAction = "Btndata";
            var RequsterPageID = 0
            //alert(event.srcElement.id)

            //ctl00_ContentPlaceHolder1_GrdPersonRole_ctl02_Btndata


            url = "../Person/SelectPerson.aspx?ShowFlag=1" + " &RequsterPageID=1107" + " &RequsterAction=" + RequsterAction;
            var returnValue
            returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 750px;center: Yes;help: no;status: no")

            if (returnValue != "" && returnValue != undefined) {

                var OGrid = document.getElementById("GrdPersonRole");
                RowIndex = Obj.parentElement.parentElement.rowIndex;

                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(returnValue);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=1]");

                if (oXmlNodes.length > 0)
                    OGrid.rows(RowIndex).cells(2).firstChild.value = oXmlNodes.item(0).selectSingleNode("PersonCode").text

                onblurPersonCode(OGrid.rows(RowIndex).cells(2).firstChild)
            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onblurPersonCode(obj) {
       // alert(1)
            var OGrid = document.getElementById("GrdPersonRole");
            RowIndex = obj.parentElement.parentElement.rowIndex;
            //var strXml = "<Root>" + str + "</Root>"
            //var RoleID = 1;
            //alert("RowIndex:" + RowIndex)
            $get(MasterObj + "txtPersonValue").value = OGrid.rows(RowIndex).cells(2).firstChild.value;
            //-----------------------------------------------------------
            if (OGrid.rows(RowIndex).cells(2).firstChild.value != "" && OGrid.rows(RowIndex).cells(2).firstChild.value != "0") {
                //alert("server")
                for (var i =1; i < OGrid.rows.length; i++) {
                    OGrid.rows(i).cells(0).firstChild.disabled = true;
                    OGrid.rows(i).cells(1).firstChild.disabled = true;
                    OGrid.rows(i).cells(2).firstChild.disabled = true;
                    OGrid.rows(i).cells(2).childNodes(1).disabled = true;
                    OGrid.rows(i).cells(4).firstChild.disabled = true;
                    OGrid.rows(i).cells(5).firstChild.disabled = true;
                    OGrid.rows(i).cells(6).firstChild.disabled = true;
                }
                document.getElementById(MasterObj + "BtnSubmitPerson").click();
            }
            else {
                for (var i = 1; i < OGrid.rows.length; i++) {
                    OGrid.rows(i).cells(0).firstChild.disabled = false;
                    OGrid.rows(i).cells(1).firstChild.disabled = false;
                    OGrid.rows(i).cells(2).firstChild.disabled = false;
                    OGrid.rows(i).cells(2).childNodes(1).disabled = false;
                    OGrid.rows(i).cells(4).firstChild.disabled = false;
                    OGrid.rows(i).cells(5).firstChild.disabled = false;
                    if (OGrid.rows.length - 1 == RowIndex)
                        OGrid.rows(i).cells(6).firstChild.disabled = false;
                }
            }
            //-----------------------------------------------------------
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onfocusPersonCode(obj) {
            var OGrid = document.getElementById("GrdPersonRole");
           var RowIndex1= obj.parentElement.parentElement.rowIndex;
//             OGrid.rows(RowIndex1).cells(4).firstChild.disabled = true;
            //             OGrid.rows(RowIndex1).cells(6).firstChild.disabled = true;

            for (var i = 1; i < OGrid.rows.length; i++) {
                OGrid.rows(i).cells(0).firstChild.disabled = true;
                OGrid.rows(i).cells(1).firstChild.disabled = true;
                if (RowIndex1 != i) {
                    OGrid.rows(i).cells(2).firstChild.disabled = true;
                    OGrid.rows(i).cells(2).childNodes(1).disabled = true;
                }
                OGrid.rows(i).cells(4).firstChild.disabled = true;
                OGrid.rows(i).cells(5).firstChild.disabled = true;
                OGrid.rows(i).cells(6).firstChild.disabled = true;
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onblurRoleTitle(obj) {
            var OGrid = document.getElementById("GrdPersonRole");
            RowIndex = obj.parentElement.parentElement.rowIndex;
            //alert(RowIndex)
            var strXml = "<Root>" + str + "</Root>"
            var RoleID = OGrid.rows(RowIndex).getAttribute('RoleID')

            if (OGrid.rows(RowIndex).cells(0).firstChild.value == "0" || OGrid.rows(RowIndex).cells(0).firstChild.value == "")
                return;
            if (OGrid.rows(RowIndex).cells(1).firstChild.value == "")
                return;

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [RoleID=" + RoleID + " and RowIndex=" + RowIndex + "]");

            if (oXmlNodes.length > 0) {

                oXmlNodes.item(0).selectSingleNode("RoleTitle").text = OGrid.rows(RowIndex).cells(1).firstChild.value
                if (oXmlNodes.item(0).selectSingleNode("Selected").text == 0)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1;


                strXml = oXmlDoc.xml;
                str = strXml.replace("<Root>", "");
                str = str.replace("</Root>", "");
            }
            else {
                str += "<Tb>"
                str += "<RowIndex>" + RowIndex + "</RowIndex>"
                str += "<DepartmentID>" + document.getElementById(MasterObj + "txtDepartmentID").value + "</DepartmentID>"
                str += "<RoleID>" + RoleID + "</RoleID>"
                str += "<RoleType>" + OGrid.rows(RowIndex).cells(0).firstChild.value + "</RoleType>"
                str += "<RoleTitle>" + OGrid.rows(RowIndex).cells(1).firstChild.value + "</RoleTitle>"
                str += "<PersonCode>" + OGrid.rows(RowIndex).cells(2).firstChild.value + "</PersonCode>"
                str += "<Selected>1</Selected>"
                str += "</Tb>"
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickChkDelRole(obj) {
            //

            var OGrid = document.getElementById("GrdPersonRole");
            RowIndex = obj.parentElement.parentElement.rowIndex;
            //-------------------------
            str += "<RoleID>" + RoleID + "</RoleID>"
            str += "<RoleType>" + OGrid.rows(RowIndex).cells(0).firstChild.value + "</RoleType>"
            str += "<RoleTitle>" + OGrid.rows(RowIndex).cells(1).firstChild.value + "</RoleTitle>"
            str += "<PersonCode>" + OGrid.rows(RowIndex).cells(2).firstChild.value + "</PersonCode>"
            if (
                OGrid.rows(RowIndex).RoleID == 0 ||
                OGrid.rows(RowIndex).cells(0).firstChild.value == 0 ||
                OGrid.rows(RowIndex).cells(1).firstChild.value == ""
             ) {
                alert("مجاز به این کار نمی باشید")
                OGrid.rows(RowIndex).cells(4).firstChild.checked = false;
                return;
            }
            //-------------------------


            //alert(RowIndex)
            if (obj.checked == true) {

                OGrid.rows(RowIndex).style.backgroundColor = "#FFCCFF";
                OGrid.rows(RowIndex).cells(0).firstChild.disabled = true;
                OGrid.rows(RowIndex).cells(1).firstChild.disabled = true
                OGrid.rows(RowIndex).cells(2).childNodes(0).disabled = true;
                OGrid.rows(RowIndex).cells(2).childNodes(1).disabled = true;
            }
            else if (obj.checked == false) {
                OGrid.rows(RowIndex).style.backgroundColor = "";
                OGrid.rows(RowIndex).cells(0).firstChild.disabled = false;
                OGrid.rows(RowIndex).cells(1).firstChild.disabled = false
                OGrid.rows(RowIndex).cells(2).childNodes(0).disabled = false;
                OGrid.rows(RowIndex).cells(2).childNodes(1).disabled = false;
            }
            //---UpdateXml:Selected=0------------------------------------------------------------

            var strXml = "<Root>" + str + "</Root>"
            var RoleID = OGrid.rows(RowIndex).getAttribute('RoleID')

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [RoleID=" + RoleID + " and RowIndex=" + RowIndex + "]");

            if (oXmlNodes.length > 0) {

                oXmlNodes.item(0).selectSingleNode("RoleTitle").text = OGrid.rows(RowIndex).cells(1).firstChild.value

                //alert(obj.checked)
                if (obj.checked == true) {
                    //alert("sss")
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0;
                }
                else if (obj.checked == false)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1;


                strXml = oXmlDoc.xml;
                str = strXml.replace("<Root>", "");
                str = str.replace("</Root>", "");
            }
            else {
                str += "<Tb>"
                str += "<RowIndex>" + RowIndex + "</RowIndex>"
                str += "<DepartmentID>" + document.getElementById(MasterObj + "txtDepartmentID").value + "</DepartmentID>"
                str += "<RoleID>" + RoleID + "</RoleID>"
                str += "<RoleType>" + OGrid.rows(RowIndex).cells(0).firstChild.value + "</RoleType>"
                str += "<RoleTitle>" + OGrid.rows(RowIndex).cells(1).firstChild.value + "</RoleTitle>"
                str += "<PersonCode>" + OGrid.rows(RowIndex).cells(2).firstChild.value + "</PersonCode>"
                //alert(OGrid.rows(RowIndex).cells(4).firstChild.checked)
                if (obj.checked == true)
                    str += "<Selected>0</Selected>"
                else if (obj.checked == false)
                    str += "<Selected>1</Selected>"

                str += "</Tb>"
            }
            //------------------------------------------------------------------------

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnDelPerson(obj) {
            var OGrid = document.getElementById("GrdPersonRole");
            RowIndex = obj.parentElement.parentElement.rowIndex;
            OGrid.rows(RowIndex).cells(2).firstChild.value = "";
            OGrid.rows(RowIndex).cells(3).innerText = "";
            //---UpdateXml:PersonCode=0------------------------------------------------------------

            var strXml = "<Root>" + str + "</Root>"
            var RoleID = OGrid.rows(RowIndex).getAttribute('RoleID')

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [RoleID=" + RoleID + " and RowIndex=" + RowIndex + "]");

            if (oXmlNodes.length > 0) {

                oXmlNodes.item(0).selectSingleNode("RoleTitle").text = OGrid.rows(RowIndex).cells(1).firstChild.value
                oXmlNodes.item(0).selectSingleNode("PersonCode").text = 0
                if (oXmlNodes.item(0).selectSingleNode("Selected").text == 0)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1;

                strXml = oXmlDoc.xml;
                str = strXml.replace("<Root>", "");
                str = str.replace("</Root>", "");
            }
            else {
                str += "<Tb>"
                str += "<RowIndex>" + RowIndex + "</RowIndex>"
                str += "<DepartmentID>" + document.getElementById(MasterObj + "txtDepartmentID").value + "</DepartmentID>"
                str += "<RoleID>" + RoleID + "</RoleID>"
                str += "<RoleType>" + OGrid.rows(RowIndex).cells(0).firstChild.value + "</RoleType>"
                str += "<RoleTitle>" + OGrid.rows(RowIndex).cells(1).firstChild.value + "</RoleTitle>"
                str += "<PersonCode>0</PersonCode>"
                str += "<Selected>1</Selected>"
                str += "</Tb>"
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNewRow(obj) {

            var OGrdPersonRole = document.getElementById("GrdPersonRole");
            var GridLen = OGrdPersonRole.rows.length - 1;
            RowIndex = obj.parentElement.parentElement.rowIndex;

            if (OGrdPersonRole.rows(RowIndex).cells(0).firstChild.value == "0" || OGrdPersonRole.rows(RowIndex).cells(1).firstChild.value == "") {
                alert("اطلاعات کامل نیست")
                return;
            }
            var oRow = OGrdPersonRole.insertRow();
            oRow.setAttribute('RoleID', 0);

            var oCell0 = oRow.insertCell();
            oCell0.innerHTML = OGrdPersonRole.rows(GridLen).cells(0).innerHTML
            oCell0.firstChild.value = "0";
            oCell0.firstChild.disabled = false;

            var oCell1 = oRow.insertCell();
            oCell1.innerHTML = OGrdPersonRole.rows(GridLen).cells(1).innerHTML
            oCell1.firstChild.value = "";
            oCell1.firstChild.disabled = false

            var oCell2 = oRow.insertCell();
            oCell2.innerHTML = OGrdPersonRole.rows(GridLen).cells(2).innerHTML
            oCell2.firstChild.value = "";
            oCell2.firstChild.disabled = false;

            var oCell3 = oRow.insertCell();
            oCell3.innerHTML = OGrdPersonRole.rows(GridLen).cells(3).innerHTML
            oCell3.innerText = "";

            var oCell4 = oRow.insertCell();
            oCell4.innerHTML = OGrdPersonRole.rows(GridLen).cells(4).innerHTML
            oCell4.firstChild.checked = false;

            var oCell5 = oRow.insertCell();
            oCell5.innerHTML = OGrdPersonRole.rows(GridLen).cells(5).innerHTML

            var oCell6 = oRow.insertCell();
            oCell6.innerHTML = OGrdPersonRole.rows(GridLen).cells(6).innerHTML

            OGrdPersonRole.rows(GridLen).cells(6).firstChild.disabled = true;
        }
        //*******************************************SearchPopup*********************************
        function FillTabTable() {
            root = '/BaseInfoEntity/PersonRoles'
            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            if ($get(MasterObj + "txtXmlPersonRoles").value == "")
                $get(MasterObj + "txtXmlPersonRoles").value = "<Root></Root>"


            xmlDoc.loadXML($get(MasterObj + "txtXmlPersonRoles").value);
            xmlDoc.setProperty("SelectionLanguage", "XPath");

            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes(root);

            var x = 0
            if (xmlNodes.length != 0) {
                for (; x < xmlNodes.length; ++x) {
                    Param = '"' + xmlNodes.item(x).selectSingleNode('RoleTypeTitle').text + '"#"'
							     + xmlNodes.item(x).selectSingleNode('RoleTitle').text + '"#'
                    /******************************************************************/
                    AddRow(XTabTable, "DepartmentID", xmlNodes.item(x).selectSingleNode('DepartmentID').text, x + 1, Param)
                    /******************************************************************/
                }
            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function AddRow(oGrid, AttrName, AttrValue, cntRow, Param) {
            //يک سطر اضافه ميکند
            oGrid.insertRow()
            oGrid.rows(newrowindex).className = "XItemStyle";

            //Set CreditID Attribute
            oGrid.rows(newrowindex).setAttribute(AttrName, AttrValue)

            //به تعداد آيتمهاي متغير پارام ستون با مقاديرشان ايجاد ميکند								
            var cell
            cell = 0
            var p = new String
            var x = 0
            var text = ''
            var sText = ''

            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).cells(cell).innerHTML = "<input type='radio' name='Group' onclick='onclickChkRole(this)'>"
            cell = cell + 1;
            oGrid.rows(0).cells(0).firstChild.checked = true;
            $get(MasterObj + "txtTmpPDepartmentID").value = oGrid.rows(0).getAttribute('DepartmentID');

            while (x < getCntChar('#', Param)) {
                p = getArray(Param, x, '#')

                oGrid.rows(newrowindex).insertCell()
                text = p.substring(1, p.length - 1)
                if (text.length > 20)
                    sText = text.substr(0, 20) + "..."
                else
                    sText = text

                oGrid.rows(newrowindex).cells(cell).innerText = sText
                oGrid.rows(newrowindex).cells(cell).title = text
                cell = cell + 1
                x = x + 1


            }


            //align
            oGrid.rows(newrowindex).cells(0).style.width = "20px"
            oGrid.rows(newrowindex).cells(1).style.width = "90px"
            oGrid.rows(newrowindex).cells(2).style.width = "150px"

            newrowindex = newrowindex + 1
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function Cleargrd(obj) {
            j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
            newrowindex = 0
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickChkRole(Obj) {
            var OGrid = document.getElementById("XTabTable");
            RowIndex = Obj.parentElement.parentElement.rowIndex;
            $get(MasterObj + "txtTmpPDepartmentID").value = OGrid.rows(RowIndex).getAttribute('DepartmentID');
            $get(MasterObj + "CmbDepartment").value = $get(MasterObj + "txtTmpPDepartmentID").value

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onChangeCmbDepartment() {
            $get(MasterObj + "txtPersonCode").value = "";
            $get(MasterObj + "txtTmpPDepartmentID").value = $get(MasterObj + "CmbDepartment").value;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onClickBtnOK() {
            document.getElementById(MasterObj + "txtSubmit").value = "AdvanceFilter";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onClickBtnCancel() {
            Cleargrd(XTabTable);
            SearchPopup.style.display = "none";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onClickBtnSearchDepartment() {
            //url = "SelectDepartment.aspx?DepartmentID=" + document.getElementById(MasterObj + "CmbDepartment").value;
            url = "SelectDepartment.aspx?ShowFlag=1&ShowTypeSelDept=0"
            returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 750px;center: Yes;help: no;status: no")

            if (returnValue != "" & returnValue != undefined) {

                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(returnValue);

                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=1]");
                if (oXmlNodes.length > 0) {
                    document.getElementById(MasterObj + "CmbDepartment").value = oXmlNodes.item(0).selectSingleNode("DepartmentID").text
                    document.getElementById(MasterObj + "txtTmpPDepartmentID").value = oXmlNodes.item(0).selectSingleNode("DepartmentID").text
                }
            }
        }
        //<PopupCreate><><><><><><><><><PopupCreate><><><><><><><><><PopupCreate><><><><><><>
        function CheckNotDuplicateDepName() {
            
            root = "/GeneralEntity/Lcombo[Title='"+document.getElementById(MasterObj + "txtOrgName").value+"']"
            var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
            if ($get(MasterObj + "txtAllDepartmentXML").value == "")
                $get(MasterObj + "txtAllDepartmentXML").value = "<GeneralEntity></GeneralEntity>"


            xmlDoc.loadXML($get(MasterObj + "txtAllDepartmentXML").value);
            xmlDoc.setProperty("SelectionLanguage", "XPath");

            var xmlNodes;
            xmlNodes = xmlDoc.documentElement.selectNodes(root);

            var x = 0
            if (xmlNodes.length != 0) 
            {
                alert("نام واحد تکراری است ")
                return false 
            }
            return true
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnPSave() {
            if (CheckNotDuplicateDepName()==true)
            {
                CreateXmlSave();
                if (document.getElementById(MasterObj + "txtSaveXml").value == "")
                    return

                if (document.getElementById(MasterObj + "txtFlagMode").value == "1" && document.getElementById(MasterObj + "SelOrgType").value == "48") {
                    alert('امکان ايجاد مدير عامل از اين صفحه وجود ندارد')
                    return
                }
                document.getElementById(MasterObj + "txtPSubmit").value = "Save";
                document.getElementById(MasterObj + "BtnPSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnPSaveNew() {
            //document.getElementById(MasterObj + "txtDepID").value = "0";
            if (CheckNotDuplicateDepName()==true)
            {
                document.getElementById(MasterObj + "txtDepID").value = document.getElementById(MasterObj + "txtDepartmentID").value
                $get(MasterObj + "txtColseFlag").value = "1";

                CreateXmlSave();
                if (document.getElementById(MasterObj + "txtSaveXml").value == "")
                    return

                if (document.getElementById(MasterObj + "txtFlagMode").value == "1" && document.getElementById(MasterObj + "SelOrgType").value == "48") {
                    alert('امکان ايجاد مدير عامل از اين صفحه وجود ندارد')
                    return
                }
                document.getElementById(MasterObj + "txtPSubmit").value = "SaveNew";
                if (document.getElementById(MasterObj + "txtDepID").value == "")
                    document.getElementById(MasterObj + "txtDepID").value = "0"
                
                document.getElementById(MasterObj + "BtnPSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnParentName() {

            url = "SelectDepartment.aspx?ShowFlag=1&ShowTypeSelDept=0"
            returnValue = window.showModalDialog(url, window, "dialogHeight: 700px;dialogWidth: 750px;center: Yes;help: no;status: no")
            //alert(returnValue)
            if (returnValue != "" & returnValue != undefined) {

                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(returnValue);

                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=1]");
                if (oXmlNodes.length > 0) {
                    document.getElementById(MasterObj + "SelParentName").value = oXmlNodes.item(0).selectSingleNode("DepartmentID").text

                }
            }


        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnPCancel() {
            PopupCreate.style.display = "none"
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function CreateNewDepartment() {

            document.getElementById(MasterObj + "txtFlagMode").value == "1"
            document.getElementById(MasterObj + "txtOrgName").value = ""
            //alert($get(MasterObj + "txtDepartmentID").value)
            if ($get(MasterObj + "txtDepartmentID").value == "")
                document.getElementById(MasterObj + "SelParentName").value = 0
            else
                document.getElementById(MasterObj + "SelParentName").value = $get(MasterObj + "txtDepartmentID").value;
            document.getElementById(MasterObj + "SelOrgType").value = 0
            document.getElementById(MasterObj + "txtDepartmnetCode").value = document.getElementById(MasterObj + "txtNewDepartmentCode").value
            //alert(document.getElementById(MasterObj + "SelParentName").value)
            //alert(document.getElementById(MasterObj + "SelParentName").innrHTML)
            if (document.getElementById(MasterObj + "SelParentName").value == "") {
                $get(MasterObj + "txtPAlert").value = "NoAccess"
                SetMsg($get(MasterObj + "txtPAlert").value)
            }
            else
                PopupCreate.style.display = "inline";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function CreateXmlSave() {
            var str = '';
            document.getElementById(MasterObj + "txtSaveXml").value = ""

            if (document.getElementById(MasterObj + "txtOrgName").value == "" || document.getElementById(MasterObj + "txtOrgName").value == "0") {
                alert('لطفا نام واحد را انتخاب کنيد')
                return
            }

            if (document.getElementById(MasterObj + "txtFlagMode").value != "2" && document.getElementById(MasterObj + "SelOrgType").value != "48") {
                if (document.getElementById(MasterObj + "SelParentName").value == "" || document.getElementById(MasterObj + "SelParentName").value == "0") {
                    alert('لطفا نام واحد مافوق را انتخاب کنيد')
                    return
                }
            }
            if (document.getElementById(MasterObj + "SelOrgType").value == "" || document.getElementById(MasterObj + "SelOrgType").value == "0") {
                alert('لطفا نوع واحد را انتخاب کنيد')
                return
            }
            if (document.getElementById(MasterObj + "txtDepartmnetCode").value == "" || document.getElementById(MasterObj + "txtDepartmnetCode").value == "0") {
                alert('لطفا کد واحد را انتخاب کنيد')
                return
            }
            str += '<Root><Tb>'

            document.getElementById(MasterObj + "txtDepID").value = document.getElementById(MasterObj + "txtDepartmentID").value
            str += '<DepartmentID>' + document.getElementById(MasterObj + "txtDepID").value + '</DepartmentID>'
            str += '<Name>' + document.getElementById(MasterObj + "txtOrgName").value + '</Name>'
            str += '<ParentID>' + document.getElementById(MasterObj + "SelParentName").value + '</ParentID>'
            str += '<Type>' + document.getElementById(MasterObj + "SelOrgType").value + '</Type>'
            str += '<DepartmentCode>' + document.getElementById(MasterObj + "txtDepartmnetCode").value + '</DepartmentCode>'
            //str += '<PersonCode>' + document.getElementById(MasterObj + "txtOnlineUserCode").value + '</PersonCode>'
            str += '</Tb></Root>'
            document.getElementById(MasterObj + "txtSaveXml").value = str
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function EditDepartment() {
            document.getElementById(MasterObj + "txtFlagMode").value == "2"
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlDepartmnet").value);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetDepartmentProperties");
            var len = oXmlNodes.length

            for (j = 0; j < len; j++) {
                document.getElementById(MasterObj + "txtOrgName").value = oXmlNodes.item(j).selectSingleNode("Name").text
                document.getElementById(MasterObj + "SelParentName").value = oXmlNodes.item(j).selectSingleNode("ParentID").text
                document.getElementById(MasterObj + "SelOrgType").value = oXmlNodes.item(j).selectSingleNode("Type").text
                document.getElementById(MasterObj + "txtDepartmnetCode").value = oXmlNodes.item(j).selectSingleNode("DepartmentCode").text
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onClickImgRefreshPerson() {
            OpenModelPopup();
            document.getElementById(MasterObj + "txtSubmit").value = "ImgRefreshPerson";
            document.getElementById(MasterObj + "ImgRefreshPersonSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //**********************************EndThisPage*************************************
        function onclickTree(Obj) {
            //alert(Obj.parentElement.id)
        }

        //////////////////////////////////////////////////////////////////////////////
        function TVNew_onNodeBeforeMove(sender, eventArgs) {
            var doMove = false;
            var targetNode = eventArgs.get_newParentNode();
            var sourceNode = eventArgs.get_node();

            

            
            if (targetNode)
                doMove = confirm("انتقال '" + sourceNode.get_text() + "' به '" + targetNode.get_text() + "'?");
            else
                doMove = confirm("انتقال '" + sourceNode.get_text() + "' به ريشه اصلي?");
           

            if (doMove) {
            
                return true;
            }
            else
                eventArgs.set_cancel(true);
        }

        function TVNew_onNodeBeforeRename(sender, eventArgs) {
            var doRename = true;
            
            if (!confirm("تغيير نام '" + eventArgs.get_node().get_text() + "' به '" + eventArgs.get_newText() + "'?")) {
                eventArgs.set_cancel(true);
                doRename = false;
            }
            
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

    <link href="../../../App_Utility/Styles/treeStyle.css" rel="stylesheet" 
        type="text/css" />

</asp:Content>

