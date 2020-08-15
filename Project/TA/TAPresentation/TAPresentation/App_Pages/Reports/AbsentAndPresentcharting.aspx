<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master"
    AutoEventWireup="true" CodeBehind="AbsentAndPresentcharting.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.AbsentAndPresentcharting"
    ValidateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="~/App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc1" %>
<%@ Register assembly="ComponentArt.Web.UI" namespace="ComponentArt.Web.UI" tagprefix="ComponentArt" %>
<%@ Register assembly="System.Web.DataVisualization" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../../App_Utility/Styles/treeStyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript" src="~/App_Utility/Scripts/Maskdiv.js"></script>

    <script type="text/javascript" language="javascript" src="~/App_Utility/NewCalendar/Script/KCalendar.js"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <script type="text/javascript" language="javascript">
     
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
        }
        function EndRequestHandler(sender, args) {

            //document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
            //var StrVal = $get(MasterObj + "txtSubmit").value

            //----------------------------------
            $get(MasterObj + "txtSubmit").value = "";
            if (document.getElementById(MasterObj + "txtChartDetail").value!=""){
                OnClickGrdAllperson(document.getElementById(MasterObj + "txtChartDetail").value)
                document.getElementById(MasterObj + "txtChartDetail").value = ""
            }
        }                                          
    </script>

    <table style="height: 100%">
        <tr valign="top">
            <td  valign="top">
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
                                onblur="Timechk(this),OnBlurSTime()" value="00:00" onfocus="OnFocuseTxtSTime()"  />
                        </td>
                        <td>
                            تا ساعت :
                        </td>
                        <td>
                             <input id="txtETime" type="text" class="TxtControls" style="width: 50px" runat="server"
                                onblur="Timechk(this)" value="00:00" onfocus="OnFocuseTxtETime()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td >
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr valign="top">
        <td align="center" ><table><tr align="center">
        <td>
                            <div id="shadowMessage" style="border: 2px double #6593CF; display: inline; width: 180px;
                                height: 300px;">
                                <table>
                                    <tr>
                                        <td align="left" style="border: 2px double #6593CF; height: 8px; background-color: #74A0D8;">
                                            <img alt="بستن" align="left" style="display: inline" onclick="onclickImgClose()"
                                                id="imgClose" src="../../App_Utility/Images/close1.png" />
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td>
                                            <div class="cssDiv" style="height: 400px; width: 220px;">
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
            <td align="center" >
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="hdnDepartmentName" runat="server" />
                            <asp:HiddenField ID="hdnDepartmentType" runat="server" />
                            <asp:HiddenField ID="txtChartDetail" runat="server" />
                            <asp:HiddenField ID="txtXml" runat="server" />
                            <input type="text" id="SDate" name="SDate" runat="server" />
                            <input type="text" id="EDate" name="EDate" runat="server" />
                            <input type="text" id="txtDepartmentID" name="txtDepartmentID" runat="server" />
                            <input type="text" id="txtDepartmentName" name="txtDepartmentName" runat="server" />
                        </div>
                        <asp:Chart ImageType="Png" ID="Chart1" runat="server" BackColor="227, 239, 255" Palette="Light"
                            Width="500px" Height="400px" borderlinestyle="Solid" backgradientendcolor="128, 255, 128"
                            backgradienttype="TopBottom" BorderlineWidth="2" BorderlineColor="128, 255, 128"
                             BackHatchStyle="DashedDownwardDiagonal" BackImageTransparentColor="227, 239, 255"
                            BackSecondaryColor="227, 239, 255" OnClick="Chart1_Click"  BackGradientStyle="LeftRight"    >
                            <Series>
                                <asp:Series Name="کل پرسنل" XAxisType="Primary" XValueType="Double" Font="KasraB Traffic, 14.25pt, style=Bold"
                                    YValueType="Int32" BorderColor="Brown" Color="LightSteelBlue" ShadowColor="Yellow"
                                    ShadowOffset="1" ChartType="bar" YValuesPerPoint="2" BackGradientStyle="VerticalCenter" >
                                </asp:Series>
                                <asp:Series Name="حاضرين موظف" XAxisType="Primary" XValueType="Double" YValueType="Int32"
                                    Font="KasraB Traffic, 14.25pt, style=Bold" BorderColor="Brown" Color="SeaGreen"
                                    ShadowColor="Yellow" ShadowOffset="1" ChartType="bar" YValuesPerPoint="2" BackGradientStyle="VerticalCenter">
                                </asp:Series>
                                <asp:Series Name="اضافه کار" XAxisType="Primary" XValueType="Double" YValueType="Int32"
                                    Font="KasraB Traffic, 14.25pt, style=Bold" BorderColor="Brown" Color="Yellow"
                                    ShadowColor="Yellow" ShadowOffset="1" ChartType="bar" YValuesPerPoint="2" BackGradientStyle="VerticalCenter">
                                </asp:Series>
                                <asp:Series Name="غايبين" XAxisType="Primary" XValueType="Double" YValueType="Int32"
                                    Font="KasraB Traffic, 14.25pt, style=Bold" BorderColor="Brown" Color="Crimson"
                                    ShadowColor="Yellow" ShadowOffset="1" ChartType="bar" YValuesPerPoint="2" BackGradientStyle="VerticalCenter">
                                </asp:Series>
                                <asp:Series Name="غايبين مجاز" XAxisType="Primary" XValueType="Double" YValueType="Int32"
                                    Font="KasraB Traffic, 14.25pt, style=Bold" BorderColor="Brown" Color="#FF99CC"
                                    ShadowColor="Yellow" ShadowOffset="1" ChartType="bar" YValuesPerPoint="2" BackGradientStyle="VerticalCenter">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea BackColor="NavajoWhite" BackGradientStyle="LeftRight" 
                                Name="ChartArea1" ShadowOffset="5"  >
                                
                                </asp:ChartArea>
                            </ChartAreas>
                            <Legends >
                                <asp:Legend Enabled="false" Name="Default" LegendStyle="Table" BackColor="Transparent"
                                    Font="KasraB Traffic, 8pt, style=Bold">
                                    <Position Y="70" Height="30" Width="18" X="0" ></Position>
                                </asp:Legend>
                            </Legends>
                            <BorderSkin SkinStyle="Sunken" ></BorderSkin>
                        </asp:Chart>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        <asp:AsyncPostBackTrigger ControlID="Chart1" EventName="click" />
                        <asp:AsyncPostBackTrigger ControlID="TVNew" EventName="NodeSelected" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            </tr></table></td>
        </tr>
    </table>
    <div style="display: none">
       <cc1:MySecurity ID="OnLineUser" runat="server" ></cc1:MySecurity>
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
        <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtAccessBtn" runat="server" />
        <input type="text" id="txtLDow" runat="server" />
        <input type="text" id="txtLMazad" runat="server" />
        <input type="text" id="txtLOtherEzafekar" runat="server" />
        <input type="text" id="txtLKasr" runat="server" />
        <input type="text" id="txtLEST" runat="server" />
        <input type="text" id="txtLSickCode" runat="server" />
        <input type="text" id="txtLComissionCode" runat="server" />
        <input type="text" id="txtLOtherMorakhasi" runat="server" />
        <input type="text" id="txtOnlineUserDepartmentID" runat="server" />
        <input type="text" id="txtGetAccessID" runat="server" />
        <input type="text" id="txtGetRoleType" runat="server" />
        <input type="text" id="txtGetIntValForRoleType" runat="server" />
        <input type="text" id="txtShowModal" runat="server" />
        <input type="text" id="txtDepID" runat="server" />
        <input type="text" id="txtCmbGetShowBy" name="txtCmbGetShowBy" runat="server" />
        <input type="text" id="txtSdate" runat="server" />
        <input type="text" id="txtEdate" runat="server" />
        <input type="text" id="txtCmbPeriod" runat="server" />
        <input type="text" id="txtCmbGetRoleType" name="txtCmbGetRoleType" runat="server" />
        <input type="text" id="txtSearchFlag" name="txtSearchFlag" runat="server" />
        <input type="text" id="txtSTimeSearch" name="txtSTimeSearch" runat="server" />
        <input type="text" id="txtETimeSearch" name="txtETimeSearch" runat="server" />
        <input type="text" id="txtDate" name="txtDate" runat="server" />
        <input type="text" id="txtCurDate" runat="server" />
    </div>

    <script type="text/javascript" language="javascript" src="../../App_Utility/Scripts/Reports/AbsentAndPresentcharting.js">

       
    </script>

</asp:Content>
