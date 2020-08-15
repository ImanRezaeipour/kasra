<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="AbsentAndPresent.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.AbsentAndPresent" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc1" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <link href="../../App_Utility/Styles/FixGridHeader.css" rel="stylesheet" type="text/css" />
      <link href="../../App_Utility/Styles/treeStyle.css" rel="stylesheet" type="text/css" />
   <style type="text/css"  >
        .DivStyle
        {
            border: 2px double #6593CF; 
            display: inline; 
            width: 209px;
            height: 300px;
        }
        .DivShadow
        {
            border: 2px double #6593CF; 
            height: 8px; 
            background-color: #74A0D8;
        }
   </style>

   
    <div class="ManagerColor"></div>
      <table style="height: 100%">
          <tr>
              <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="400000000" runat="server">
              </asp:ScriptManager>
          </tr>
        <tr valign="top">
            <td style="width: 2000px" valign="top">
                <table>
                    <tr>
                        <td>نوع :</td>
                        <td><asp:DropDownList runat="server" ID="CmbType" CssClass="TxtControls" style=" width:120px" onchange="OnChangeCmbType()"></asp:DropDownList> </td>
                        <td>
                            تاريخ :
                        </td>
                        <td>
                            <uc1:KCalendar ID="KCalDate" runat="server" />
                            &nbsp;
                        </td>
                        <td>
                            از ساعت :
                        </td>
                        <td>
                            <input id="txtSTime" type="text" class="TxtControls" style="width: 50px" runat="server"
                                onblur="Timechk(this),OnBlurSTime()" value="00:00" onfocus="OnFocuseTxtSTime()" onkeydown="OnKeyDownTime(this)" />
                        </td>
                        <td>
                            تا ساعت :
                        </td>
                        <td>
                            <input id="txtETime" type="text" class="TxtControls" style="width: 50px;" runat="server"
                                onblur="Timechk(this)" value="00:00" onfocus="OnFocuseTxtETime()" onkeydown="OnKeyDownTime(this)"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr valign="top">
            <td style="width: 2000px" valign="top">
                 <uc2:ToolBar ID="OToolBar" runat="server"  />
            </td>
        </tr>
        <tr valign="top">
            <td style="width: 2000px" valign="top">
                <table id="">
                    <tr>
                        <td>
                            <div id="shadowMessage" class="DivStyle" >
                                <table>
                                    <tr>
                                        <td align="left" class="DivShadow" >
                                            <img alt="بستن" align="left" style="display: inline" onclick="onclickImgClose()"
                                                id="imgClose" src="../../App_Utility/Images/close1.png" />
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td>
                                            <div class="cssDiv" style="height: 350px; width: 260px;">
                                                <componentart:treeview ID="TVNew" runat="server" Height="98%" 
                                              Width="245px"
                                              AutoPostBackOnSelect="true"
                                              KeyboardEnabled="true"
                                              MultipleSelectEnabled="true"
                                              DisplayMargin="false"
                                              ShowLines="true"
                                              CssClass=""
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
                                              ImagesBaseUrl="../../App_Utility/Images/TreeViewImage/"
                                              LineImagesFolderUrl="../../App_Utility/Images/TreeViewLine/"
                                              ExpandSinglePath="true"
                                              OnNodeSelected="TVNew_NodeSelected"
                                              ExpandNodeOnSelect="True" CollapseNodeOnSelect="False">
                                        </componentart:treeview>
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
                                        <asp:HiddenField ID="txtCurPage" runat="server" />
                                        <asp:HiddenField ID="Totalpage" runat="server" />
                                        <asp:HiddenField ID="lblFrom" runat="server" />
                                        <asp:HiddenField ID="lblTo" runat="server" />
                                        <asp:HiddenField ID="lblTotal" runat="server" />
                                        <asp:HiddenField ID="hdnDepartmentName" runat="server" />
                                        <asp:HiddenField ID="hdnDepartmentType" runat="server" />
                                        <asp:HiddenField ID="CurPage" runat="server" />
                                        <input type="text" id="SDate" name="SDate" runat="server" />
                                        <input type="text" id="EDate" name="EDate" runat="server" />
                                        <input type="text" id="txtDepartmentID" name="txtDepartmentID" runat="server" />
                                        <input type="text" id="txtDepartmentName" name="txtDepartmentName" runat="server" />
                                        <input type="text" id="txtTreeDepartmentID" name="txtTreeDepartmentID" runat="server" />
                                        <input type="text" id="txtTreeDepartmentName" name="txtTreeDepartmentName" runat="server" />
                                    </div>
                                    <div class="cssDiv" id="GridViewCountainer" style="width: 100%; height: 431px;">
                                        <cc2:KasraGrid ID="GrdAbsentPresent" runat="server" 
                                        OnRowDataBound="Grid_RowDataBound"  AllowSendToPDF="true"  AllowSendToExcel="true">
                                        </cc2:KasraGrid>
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
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
        <input type="text" id="txtPersonID" name="txtPersonID" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtShowMonthlyTree" runat="server" />
        <input type="text" id="txtOnlineUserDepartmentID" runat="server" />
        <input type="text" id="txtGetAccessID" runat="server" />
        <input type="text" id="txtGetRoleType" runat="server" />
        <input type="text" id="txtSearchFlag" name="txtSearchFlag" runat="server" />
        <input type="text" id="txtSTimeSearch" name="txtSTimeSearch" runat="server" />
        <input type="text" id="txtETimeSearch" name="txtETimeSearch" runat="server" />
        <input type="text" id="txtDate" name="txtDate" runat="server" />
        <input type="text" id="txtCurDate" name="txtCurDate" runat="server" />
        <input type="text" id="txtReportDate" name="txtReportDate" runat="server" />
    </div>
 <script src="../../App_Utility/Scripts/Reports/AbsentAndPresent.js" type="text/javascript"></script>
</asp:Content>

