<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" 
    AutoEventWireup="true" CodeBehind="SumMonthlyReport.aspx.cs" 
    Inherits="TAPresentation.App_Pages.Reports.SumMonthlyReport" 
    ValidateRequest="false"%>
 
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc3" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <link href="../../App_Utility/Styles/treeStyle.css" rel="stylesheet" type="text/css" />
    <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False"
        ScriptMode="Release">
    </asp:ScriptManager>

 <script type="text/javascript" language="javascript">
     
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler)
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible"
            if (document.getElementById(MasterObj + "txtSubmit").value != "Calc")
                document.getElementById("ctl00_ProgressState").value = 1}
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden"
            document.dir = "RTL"
            document.getElementById(MasterObj + "txtRowPersonID").value = ""
            if (LastSelectedRow != null)
                LastSelectedRow.className = LastSelectedRowClass
            
            if (document.getElementById(MasterObj + "txtRChart").value == "0")
                document.getElementById(MasterObj + 'cmbGetRoleType').disabled = false
            else
                document.getElementById(MasterObj + 'cmbGetRoleType').disabled = true
                
            GetNotAccessBtn()
            
           

            $get(MasterObj + "txtSubmit").value = "" }                                                    
    </script>

    <table style="height: 100%">
        <tr valign="top">
            <td style="width: 2000px" valign="top">
                <table>
                    <tr>
                        <td>
                             دوره :
                        </td>
                        <td>
                            <asp:DropDownList Width="120px" ID="CmbPeriod" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        
                        
                        <td id="TDToPeriodText" style="display:inline">
                            تا دوره :
                        </td>
                        <td id="TDToPeriod"  style="display:inline">
                            <asp:DropDownList Width="120px" ID="CmbToPeriod" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td id="TDGetShowText">
                            نوع نمايش :
                        </td>
                        <td id="TDGetShow">
                            <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:DropDownList class="TxtControls" ID="cmbGetShowBy" runat="server" Width="120px"
                                        onchange="Filter()">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td id="TDRedio" width="100px">
                            <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <input type="radio" checked="true" runat="server" name="RSum" id="RChart" runat="server" onclick="OnclickRchart();Filter()" />چارت
                                    <input type="radio" name="RSum" runat="server" id="Rtotal" runat="server" onclick="OnclickRtotal();Filter()" />کلي
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td id="TDGetRoleTypeText">
                            سطح سازماني :
                        </td>
                        <td id="TDGetRoleType">
                            <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:DropDownList class="TxtControls" ID="cmbGetRoleType" runat="server" Width="120px"
                                        onchange="Filter()">
                                    </asp:DropDownList>
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
        <tr valign="top">
            <td style="width: 2000px" valign="top">
                <uc2:ToolBar ID="OToolBar" runat="server" PageName="SumMonthlyReport.aspx" PageID="13170" />
            </td>
        </tr>
        <tr valign="top">
            <td style="width: 2000px" valign="top">
                <table id="">
                    <tr>
                        <td>
                            <div id="shadowMessage" style="border: 2px double #6593CF; display: inline; width: 209px;
                                height: 300px;">
                                <table>
                                    <tr>
                                        <td align="left" style="border: 2px double #6593CF; height: 8px; background-color: #74A0D8;">
                                            <img alt="بستن" align="left" style="display: inline" onclick="onclickImgClose()"
                                                id="imgClose" src="../../App_Utility/Images/close1.png" />
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td id="TDTree">
                                            <div class="cssDiv" style="height: 400px; width: 260px;" id="Divtree">
                                                <ComponentArt:TreeView ID="TVNew" runat="server" Height="98%" Width="245px" AutoPostBackOnSelect="true"
                                                    KeyboardEnabled="true" MultipleSelectEnabled="true" DisplayMargin="false" ShowLines="true"
                                                    CssClass="" NodeCssClass="TreeNode" SelectedNodeCssClass="SelectedTreeNode" MultipleSelectedNodeCssClass="MultipleSelectedTreeNode"
                                                    HoverNodeCssClass="HoverTreeNode" NodeEditCssClass="NodeEdit" CutNodeCssClass="CutTreeNode"
                                                    MarginWidth="24" DefaultMarginImageWidth="24" DefaultMarginImageHeight="20" LineImageWidth="19"
                                                    LineImageHeight="20" DefaultImageWidth="16" DefaultImageHeight="16" NodeLabelPadding="3"
                                                    ParentNodeImageUrl="folders.gif" LeafNodeImageUrl="folder.gif" CollapseImageUrl="exp.gif"
                                                    ExpandImageUrl="col.gif" ExpandCollapseImageWidth="19" ExpandCollapseImageHeight="20"
                                                    ImagesBaseUrl="../../App_Utility/Images/TreeViewImage/" LineImagesFolderUrl="../../App_Utility/Images/TreeViewLine/"
                                                    ExpandSinglePath="true" OnNodeSelected="TVNew_NodeSelected" ExpandNodeOnSelect="True"
                                                    CollapseNodeOnSelect="False">
                                                </ComponentArt:TreeView>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <td id="ttt" valign="top" align="center">
                            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                                <ContentTemplate>
                                    <div style="display: none">
                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                        <asp:HiddenField ID="txtCurPage" runat="server" />
                                        <asp:HiddenField ID="txtMaxNumber" runat="server" />
                                        <asp:HiddenField ID="Totalpage" runat="server" />
                                        <input type="text" id="SDate" name="SDate" runat="server" />
                                        <input type="text" id="EDate" name="EDate" runat="server" />
                                        <input type="text" id="SDate2" name="SDate2" runat="server" />
                                        <input type="text" id="EDate2" name="EDate2" runat="server" />
                                        <input type="text" id="txtDepartmentID" name="txtDepartmentID" runat="server" />
                                        <input type="text" id="txtDeptID" name="txtDeptID" runat="server" />
                                    </div>
                                    <div class="cssDiv" id="GridViewCountainer" style="width: 100%; height: 431px; overflow:auto ">
                                        <cc3:KasraGrid ID="GrdMontlyChart" runat="server" OnRowDataBound="Grid_RowDataBound"
                                            AllowSendToPDF="true" AllowSendToExcel="true">
                                        </cc3:KasraGrid>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    <asp:AsyncPostBackTrigger ControlID="TVNew" EventName="NodeSelected" />
                                    <asp:PostBackTrigger ControlID="BtnSubmitSend" />
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
        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:HiddenField ID="txtXmlRowInfo" runat="server" />
                <asp:HiddenField ID="txtRDate" runat="server" />
                <asp:HiddenField ID="txtRPID" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit2" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit2" runat="server" Text="Button" OnClick="BtnSubmit2_Click" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />
        <input type="text" id="txtRowPersonID" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtShowMonthlyTree" runat="server" />
        <input type="text" id="txtOnlineUserDepartmentID" runat="server" />
        <input type="text" id="txtGetRoleType" runat="server" />
        <input type="text" id="txtGetIntValForRoleType" runat="server" />
        <input type="text" id="txtShowModal" runat="server" />
        <input type="text" id="txtCmbGetShowBy" name="txtCmbGetShowBy" runat="server" />
        <input type="text" id="txtSdate" runat="server" />
        <input type="text" id="txtEdate" runat="server" />
        <input type="text" id="txtCmbPeriod" runat="server" />
        <input type="text" id="txtSdate2" runat="server" />
        <input type="text" id="txtEdate2" runat="server" />
        <input type="text" id="txtCmbToPeriod" runat="server" />
        <input type="text" id="txtCmbGetRoleType" name="txtCmbGetRoleType" runat="server" />
        <input type="text" id="txtSearchFlag" name="txtSearchFlag" runat="server" />
        <input type="text" id="txtRChart" name="txtRChart" runat="server" />
        <input type="text" id="txtRtotal" name="txtRtotal" runat="server" />
        <input type="text" id="txtXmlGridSetting" name="txtXmlGridSetting" runat="server" />
        <input type="text" id="txtValidate" runat="server" />
    </div>

    <script language="javascript">
        //Declaration
        document.dir = "RTL"
        var str = ""
        document.body.className = "Layer3"
        var LastSelectedRow = null,LastSelectedRowClass = "",SearchFlag = 0,win = "",DailyState = 0,DailyInfoDialogObj = null
        
        GetNotAccessBtn()
        PageLoad()
        //*************************************EndDeclaration*************************************
       //**********************************EndOnLoad*************************************
        if (document.getElementById(MasterObj + "txtShowMonthlyTree").value != "1"){
            onclickImgClose()}
        else {
            document.getElementById("OToolBar_ImgRestor").style.display = "none"
            document.body.scroll = "yes"}
             
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst"
            document.getElementById(MasterObj + "BtnSubmit").click()}
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickRestore() {
            document.getElementById("shadowMessage").style.display = "inline"
            document.getElementById("OToolBar_Restore").style.display = "none"}
        //*************************************ThisPage***************************************
        function OnClickBtnFilter() {
            document.getElementById(MasterObj + "txtSearchFlag").value = "1"
//            document.getElementById(MasterObj + "txtDepartmentID").value = "0"
            Filter()}
        function Filter() {

            document.getElementById(MasterObj + "txtCmbGetShowBy").value = document.getElementById(MasterObj + "cmbGetShowBy").value
            document.getElementById(MasterObj + "txtCmbGetRoleType").value = document.getElementById(MasterObj + "cmbGetRoleType").value
            SearchFlag=1
            document.getElementById(MasterObj + "txtSubmit").value = "Search"
            document.getElementById(MasterObj + "BtnSubmit").click()
        }
        function OnClickBtnSearch() {
            document.getElementById(MasterObj + "txtSearchFlag").value = "0"
//            $get(MasterObj + "txtDepartmentID").value = "0"
            Search()}
        function Search(){
            SearchFlag = 1
            
            document.getElementById(MasterObj + "txtCmbGetShowBy").value = document.getElementById(MasterObj + "cmbGetShowBy").value
            document.getElementById(MasterObj + "txtCmbGetRoleType").value = document.getElementById(MasterObj + "cmbGetRoleType").value
            document.getElementById(MasterObj + "txtSubmit").value = "Search"
            document.getElementById(MasterObj + "BtnSubmit").click()}
        function OnClickBtnShowAll(){
            document.getElementById(MasterObj + "txtSearchFlag").value = "0"
            $get(MasterObj + "SDate").value = ""
            $get(MasterObj + "EDate").value = ""
            $get(MasterObj + "SDate2").value = ""
            $get(MasterObj + "EDate2").value = ""
            
            $get(MasterObj + "txtCmbGetShowBy").value = "0"
            $get(MasterObj + "txtCmbGetRoleType").value = "0"
           
            $get(MasterObj + "txtSubmit").value = "ShowAll"
            $get(MasterObj + "BtnSubmit").click()}
        function onclickImgClose() {
            if ($get(MasterObj + "txtShowModal").value == "1") {
                if (win.parent.document.all.item("ImgRestore").style.display == "inline") {
                    document.body.scroll = "no"}}
            else {
                if (window.parent.document.all.item("ImgRestore").style.display == "inline") {
                    document.body.scroll = "no"}}
            document.getElementById("shadowMessage").style.display = "none"
            document.getElementById("OToolBar_ImgRestor").style.display = "inline"}
        function OnClickImgRestor() {
            document.body.scroll = "yes"
            document.documentElement.scrollTop = "yes"
            document.getElementById("shadowMessage").style.display = "inline"
            document.getElementById("OToolBar_ImgRestor").style.display = "none"
        }
        document.body.attachEvent('onkeydown', onkeydownBody)
        var keyCode = 0
        function onkeydownBody() {
            keyCode = event.keyCode
            setTimeout("keyCode=0", 1000)}

        //==================================================================================
        function OnClickGrd(SelectedRow){
            if (LastSelectedRow != null)
                LastSelectedRow.className = LastSelectedRowClass
            LastSelectedRowClass = SelectedRow.className
            LastSelectedRow = SelectedRow
            SelectedRow.className = "CssSelectedItemStyle"

           
            var LastSelectedRowGrd = SelectedRow;
            //            var DepID = LastSelectedRowGrd.getAttribute("personelid");
            $get(MasterObj + "txtDeptID").value = LastSelectedRowGrd.personelid;

            CheckClick();

        }
        //==================================================================================
        function CheckClick() {

            var oGrd = document.getElementById(MasterObj + "GrdMontlyChart");

            if (oGrd)
                var len = oGrd.rows.length
            else
                return
            //--------------------------------------------- 

            var oCell = window.event.srcElement
            var oRow = window.event.srcElement
            while (oCell.tagName != "TD")
                oCell = oCell.parentElement
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement
            //---------------------------------------------
            if (oCell.cellIndex == 0) {
                OnClickGrdChart(oCell);
            }
        }
        //==================================================================================
        var DetailDialogObj = null;
        var DetailState = 0;
        //==================================================================================
        function OnClickGrdChart(obj) {

            var row = window.event.srcElement.parentElement
            var index;
            if (obj == 0) {
                obj = window.event.srcElement;
                index = window.event.srcElement.cellIndex;
            }
            else index = obj.cellIndex;

           
            if (DetailState == 0) {
                while (row.tagName != 'TR')
                    row = row.parentElement
                if (DetailState != 1) {
                    if (row != null) {
                        var url = "MainMonthlyReport.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value
                          + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                          + "&DepID=" + $get(MasterObj + "txtDeptID").value
                          + "&Sdate=" + $get(MasterObj + "Sdate").value
                          + "&Edate=" + $get(MasterObj + "Edate").value
                          + "&CmbPeriod=" + $get(MasterObj + "CmbPeriod").value
                          + "&Sdate2=" + $get(MasterObj + "Sdate2").value
                          + "&Edate2=" + $get(MasterObj + "Edate2").value
                          + "&CmbToPeriod=" + $get(MasterObj + "CmbToPeriod").value
                          + "&ShowModal=1";
//                       alert(encodeURI(url))
                        var winPro = "dialogHeight:" + window.screen.height + ";dialogWidth: " + window.screen.width + ";center: Yes;help: no;status:no;minimize: yes;";
                        DetailDialogObj = window.showModelessDialog(encodeURI(url), window, winPro)
                        DetailState = 1;
                    }     
                }
            }
            else {
                try {
                    if (DetailState == 1) {
                        if (DetailDialogObj != null) {
                        
                            DetailDialogObj.document.getElementById(MasterObj + "txtShowModal").value = 1;
                            DetailDialogObj.document.getElementById(MasterObj + "txtSdate").value = $get(MasterObj + "Sdate").value;
                            DetailDialogObj.document.getElementById(MasterObj + "txtEdate").value = $get(MasterObj + "Edate").value;
                            DetailDialogObj.document.getElementById(MasterObj + "txtSdate2").value = $get(MasterObj + "Sdate2").value;
                            DetailDialogObj.document.getElementById(MasterObj + "txtEdate2").innerText = $get(MasterObj + "Edate2").value;
                            DetailDialogObj.document.getElementById(MasterObj + "txtCmbPeriod").value = $get(MasterObj + "CmbPeriod").value;
                            DetailDialogObj.document.getElementById(MasterObj + "txtCmbToPeriod").value = $get(MasterObj + "CmbToPeriod").value;
                            DetailDialogObj.document.getElementById(MasterObj + "txtSessionID").value = $get(MasterObj + "txtSessionID").value;
                            DetailDialogObj.document.getElementById(MasterObj + "txtOnLineUser").value = $get(MasterObj + "txtOnLineUser").value;
                            DetailDialogObj.document.getElementById(MasterObj + "txtDepID").value = $get(MasterObj + "txtDeptID").value;
                           

                            DetailDialogObj.OnClickBtnFilter();
                        }
                    }
                }
                catch (e) {
                    DetailState = 0
                    OnClickGrdChart(obj)
                }
            }
        }

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
       function GetNotAccessBtn() {
            if (document.getElementById('OToolBar_btnDefineٌWorkTimes'))
                document.getElementById('OToolBar_btnDefineٌWorkTimes').style.display = "none"
            if (document.getElementById('OToolBar_btnDefinitionDayStructure'))
                document.getElementById('OToolBar_btnDefinitionDayStructure').style.display = "none"
            if (document.getElementById('OToolBar_btnDefineGroup'))
                document.getElementById('OToolBar_btnDefineGroup').style.display = "none"
            if (document.getElementById('OToolBar_btnReplaceChanges'))
                document.getElementById('OToolBar_btnReplaceChanges').style.display = "none"
            if (document.getElementById('OToolBar_BtnRegCredit'))
                document.getElementById('OToolBar_BtnRegCredit').style.display = "none"
            if (document.getElementById('OToolBar_btnCalendar'))
                document.getElementById('OToolBar_btnCalendar').style.display = "none"
            if (document.getElementById('OToolBar_btnCodeLimit'))
                document.getElementById('OToolBar_btnCodeLimit').style.display = "none"
            if (document.getElementById('OToolBar_BtnDefineRoot'))
                document.getElementById('OToolBar_BtnDefineRoot').style.display = "none"
            if (document.getElementById('OToolBar_BtnCalc'))
                document.getElementById('OToolBar_BtnCalc').style.display = "none"
            if (document.getElementById('OToolBar_btnCardtable'))
                document.getElementById('OToolBar_btnCardtable').style.display = "none"
            if (document.getElementById('OToolBar_BtnShowAll'))
                document.getElementById('OToolBar_BtnShowAll').style.display = "none"
            if (document.getElementById('OToolBar_BtnFilter'))
                document.getElementById('OToolBar_BtnFilter').style.display = "none"
            if (document.getElementById('OToolBar_BtnCreditInfo'))
                document.getElementById('OToolBar_BtnCreditInfo').style.display = "none"
//            CorrectToolBar()
            }        
       
       
        
        function OnclickRchart() {
            document.getElementById(MasterObj + 'txtRChart').value = "1"
            document.getElementById(MasterObj + 'txtRtotal').value = "0"
            document.getElementById(MasterObj + 'cmbGetRoleType').disabled = true
            document.getElementById(MasterObj + 'cmbGetRoleType').value = "0"
            document.getElementById("OToolBar_ImgRestor").style.display = "inline"
            document.body.scroll = "no"}
        function OnclickRtotal() {
            document.getElementById(MasterObj + 'txtRChart').value = "0"
            document.getElementById(MasterObj + 'txtRtotal').value = "1"
            document.getElementById(MasterObj + 'cmbGetRoleType').disabled = false
            document.getElementById(MasterObj + 'txtDepartmentID').value = "0"
            onclickImgClose()
            document.getElementById("OToolBar_ImgRestor").style.display = "none"
            document.body.scroll = "yes"}

            function PageLoad() {
            win = window.dialogArguments
             
            if (document.getElementById(MasterObj + 'RChart').checked == true)
                document.getElementById(MasterObj + 'cmbGetRoleType').disabled = true
            else
                document.getElementById(MasterObj + 'cmbGetRoleType').disabled = false}
        function OnClickGrdMontlyChart(obj) {
            var LastSelectedRow = obj.parentElement, DepID = LastSelectedRow.personelid
            
            if (DepID < 0)
                DepID = LastSelectedRow.personCode
            var url = "SumMonthlyReport.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value
              + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
              + "&DepID=" + DepID
              + "&Sdate=" + $get(MasterObj + "Sdate").value
              + "&Edate=" + $get(MasterObj + "Edate").value
              + "&CmbPeriod=" + $get(MasterObj + "CmbPeriod").value
              + "&Sdate2=" + $get(MasterObj + "Sdate2").value
              + "&Edate2=" + $get(MasterObj + "Edate2").value
              + "&CmbToPeriod=" + $get(MasterObj + "CmbToPeriod").value
              + "&ShowModal=1";
            url = encodeURI(url)
            window.showModelessDialog(url, window, 'dialogHeight: 1400px;dialogWidth: 1400px;center: Yes;help: no;status: no;minimize: yes')}
        function OnTreeClick(evt) {
            var src = window.event != window.undefined ? window.event.srcElement : evt.target
            var nodeClick = src.tagName.toLowerCase() == "a",index,len
            if (nodeClick) {
                var nodeText = src.innerText || src.innerHTML
                var nodeValue = GetNodeValue(src)
                index = nodeValue.indexOf('#', 0)
                len = nodeValue.length
                nodeValue = nodeValue.substr(index + 1, len - index)
                $get(MasterObj + "txtDepartmentID").value = nodeValue
            }
            return false //comment this if you want postback on node click
        }
        function GetNodeValue(node) {
            var nodePath = node.href.substring(node.href.indexOf(",") + 2, node.href.length - 2)
            var nodeValues = nodePath.split("\\")
            if (nodeValues.length > 1)
                nodeValue = nodeValues[nodeValues.length - 1]
            else
                nodeValue = nodeValues[0].substr(1)
            return nodeValue}
        //=====================================================================================================
        function OnClickBtnOnePDF() {
            document.getElementById(MasterObj + "txtSubmit").value = "OnePDF"
            document.getElementById(MasterObj + "BtnSubmitSend").click()
        }
        //=====================================================================================================
        function OnClickBtnOneExcel() {
            document.getElementById(MasterObj + "txtSubmit").value = "OneExcel"
            document.getElementById(MasterObj + "BtnSubmitSend").click()
        }
        //=====================================================================================================
    </script>
</asp:Content>
