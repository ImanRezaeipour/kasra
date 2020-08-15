<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SumMonthlyReportchart.aspx.cs"
    MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" Inherits="TAPresentation.App_Pages.Reports.SumMonthlyReportchart"
    ValidateRequest="false"%>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
.DivStyle
{
    border: 2px double #6593CF;
    display: inline; 
    width: 209px;
    height: 300px;
}
.TdStyle
{
    border: 2px double #6593CF; 
    height: 8px; 
    background-color: #74A0D8;
}
</style>
    <link href="../../App_Utility/Styles/treeStyle.css" rel="stylesheet" type="text/css" />
    <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False"
        ScriptMode="Release">
    </asp:ScriptManager>
    <table style="height: 100%">
        <tr valign="top">
            <td  valign="top">
                <table>
                    <tr>
                        <td>
                            دوره
                        </td>
                        <td>
                            <asp:DropDownList Width="120px" ID="CmbPeriod" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        
                        
                        <td id="TDToPeriodText">
                            تا دوره
                        </td>
                        <td id="TDToPeriod">
                            <asp:DropDownList Width="120px" ID="CmbToPeriod" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                        <td id="TDGetShowText">
                            نوع نمايش
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
                                    <input type="radio" checked="true" name="RSum" id="RChart" runat="server" onclick="OnclickRchart();Filter()" />چارت
                                    <input type="radio" name="RSum" id="Rtotal" runat="server" onclick="OnclickRtotal();Filter()" />کلي
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td id="TDGetRoleTypeText">
                            سطح سازماني
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
            <td  valign="top">
                <uc2:ToolBar ID="OToolBar" runat="server" PageName="SumMonthlyReport.aspx" PageID="13170" />
            </td>
        </tr>
        <tr valign="top">
            <td  valign="top">
                <table>
                    <tr>
                        <td>
                            <div id="shadowMessage" class="DivStyle" >
                                <table>
                                    <tr>
                                        <td align="left" class="TdStyle" >
                                            <img alt="بستن" align="left" style="display: inline" onclick="onclickImgClose()"
                                                id="imgClose" src="../../App_Utility/Images/close1.png" />
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td id="TDTree">
                                            <div class="cssDiv"  style="height: 400px; width: 260px;" id="Divtree">
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
                                        <input type="text" id="txtDepartmentID" name="txtDepartmentID" runat="server" />
                                    </div>
                                    <asp:Chart ImageType="Png" ID="Chart1" runat="server" BackColor="227, 239, 255" Palette="Light"
                                        Width="700px" Height="400px" borderlinestyle="Solid" backgradientendcolor="128, 255, 128"
                                        backgradienttype="TopBottom" BorderlineWidth="2" BorderlineColor="128, 255, 128"
                                        BackHatchStyle="DashedDownwardDiagonal" BackImageTransparentColor="227, 239, 255"
                                        BackSecondaryColor="227, 239, 255" OnClick="Chart1_Click" BackGradientStyle="LeftRight">
                                        <Series>
                                            <asp:Series Name="کارکرد" XAxisType="Primary" XValueType="Int32" Font="KasraB Traffic, 14.25pt, style=Bold"
                                                YValueType="Int32" BorderColor="Brown" Color="LightSteelBlue" ShadowColor="Yellow"
                                                ShadowOffset="1" ChartType="bar" YValuesPerPoint="4" BackGradientStyle="VerticalCenter">
                                            </asp:Series>
                                            <asp:Series Name="کل حضور" XAxisType="Primary" XValueType="Int32" YValueType="Int32"
                                                Font="KasraB Traffic, 14.25pt, style=Bold" BorderColor="Brown" Color="SeaGreen"
                                                ShadowColor="Yellow" ShadowOffset="1" ChartType="bar" YValuesPerPoint="4" BackGradientStyle="VerticalCenter">
                                            </asp:Series>
                                            <asp:Series Name="اضافه کار" XAxisType="Primary" XValueType="Int32" YValueType="Int32"
                                                Font="KasraB Traffic, 14.25pt, style=Bold" BorderColor="Brown" Color="Yellow"
                                                ShadowColor="Yellow" ShadowOffset="1" ChartType="bar" YValuesPerPoint="4" BackGradientStyle="VerticalCenter">
                                            </asp:Series>
                                            <asp:Series Name="کسر کار" XAxisType="Primary" XValueType="Int32" YValueType="Int32"
                                                Font="KasraB Traffic, 14.25pt, style=Bold" BorderColor="Brown" Color="Crimson"
                                                ShadowColor="Yellow" ShadowOffset="1" ChartType="bar" YValuesPerPoint="4" BackGradientStyle="VerticalCenter">
                                            </asp:Series>
                                            <asp:Series Name="استحقاقي" XAxisType="Primary" XValueType="Int32" YValueType="Int32"
                                                Font="KasraB Traffic, 14.25pt, style=Bold" BorderColor="Brown" Color="#FF99CC"
                                                ShadowColor="Yellow" ShadowOffset="1" ChartType="bar" YValuesPerPoint="4" BackGradientStyle="VerticalCenter">
                                            </asp:Series>
                                             <asp:Series Name="استعلاجي" XAxisType="Primary" XValueType="Int32" YValueType="Int32"
                                                Font="KasraB Traffic, 14.25pt, style=Bold" BorderColor="Brown" Color="#6699FF"
                                                ShadowColor="Yellow" ShadowOffset="1" ChartType="bar" YValuesPerPoint="4" BackGradientStyle="VerticalCenter">
                                            </asp:Series>
                                              <asp:Series Name="ماموريت" XAxisType="Primary" XValueType="Int32" YValueType="Int32"
                                                Font="KasraB Traffic, 14.25pt, style=Bold" BorderColor="Brown" Color="#66FF66"
                                                ShadowColor="Yellow" ShadowOffset="1" ChartType="bar" YValuesPerPoint="4" BackGradientStyle="VerticalCenter">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea BackColor="NavajoWhite" BackGradientStyle="LeftRight" Name="ChartArea1"
                                                ShadowOffset="5">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                        <Legends>
                                            <asp:Legend Enabled="true" Name="Default" LegendStyle="Table" BackColor="Transparent"
                                                Font="KasraB Traffic, 8pt, style=Bold">
                                            </asp:Legend>
                                        </Legends>
                                        <BorderSkin SkinStyle="Sunken"></BorderSkin>
                                    </asp:Chart>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    <asp:AsyncPostBackTrigger ControlID="TVNew" EventName="NodeSelected" />
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
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtShowMonthlyTree" runat="server" />
        <input type="text" id="txtOnlineUserDepartmentID" runat="server" />
        <input type="text" id="txtGetRoleType" runat="server" />
        <input type="text" id="txtGetIntValForRoleType" runat="server" />
        <input type="text" id="txtShowModal" runat="server" />
        <input type="text" id="txtCmbGetShowBy" name="txtCmbGetShowBy" runat="server" />
        <input type="text" id="txtCmbPeriod" runat="server" />
        <input type="text" id="txtCmbToPeriod" runat="server" />
        <input type="text" id="txtCmbGetRoleType" name="txtCmbGetRoleType" runat="server" />
        <input type="text" id="txtRChart" name="txtRChart" runat="server" />
        <input type="text" id="txtRtotal" name="txtRtotal" runat="server" />
        <input type="text" id="txtXmlGridSetting" name="txtXmlGridSetting" runat="server" />
        <input type="text" id="txtSearchFlag" name="txtSearchFlag" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/Reports/SumMonthlyReportchart.js" type="text/javascript"></script>
</asp:Content>
