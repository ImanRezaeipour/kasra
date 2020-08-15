<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageMain.aspx.cs" Inherits="FrmPresentation.App_Pages.PageMain.PageMain" ValidateRequest="false" %>

<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    
    <%--ie10--%>
     <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
    <title>سيستم جامع كنترل تردد</title>
    <link href="../../App_Utility/Images/Icons/favicon.ico" rel="Shortcut Icon" /> 
    <link rel="Stylesheet" type="text/css" href="../../App_Utility/Styles/PageMain/PageMain.css" />
    <link href="../../App_Utility/Styles/splitterStyle.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Utility/Styles/PageMainTreeStyle.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Utility/Styles/tabStyle.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Utility/Styles/multiPage.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Utility/Styles/navStyle.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Utility/Styles/menuStyle.css" rel="stylesheet" type="text/css" />  

    <link href="../../App_Utility/Styles/PageMain/themes/cupertino/jquery-ui-1.8.custom.css" rel="stylesheet" type="text/css" />
    <script src="../../App_Utility/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    
    <script src="../../App_Utility/Scripts/jquery-ui-1.8.custom.min.js" type="text/javascript"></script>
    <style type="text/css">
        .CssBtnOk
        {
	        BACKGROUND-Image:url(../../App_Utility/Images/Buttons/Btnok2.gif);	
	        BACKGROUND-REPEAT: no-repeat;	
	        BACKGROUND-COLOR: transparent;
	         BORDER-RIGHT: #346fa4 2px solid; 
	        BORDER-TOP: lightsteelblue 2px solid; 
	        BORDER-LEFT: lightsteelblue 2px solid; 
	        BORDER-BOTTOM: #346fa4 2px solid;  
	        WIDTH: 70px;
	        HEIGHT: 32px	
        }      
        li
        {
            font-family: Tahoma; 
            font-size: 12px; 
            font-weight: normal;
            cursor:hand;
        }
    </style>
    
    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/PageMain/PageMain.js">
        
    </script>
</head>
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" onload="PageLoad()"
    bgcolor="#d3d6e7" scroll="no" style="height: 80%; "
    class="PageBody" >
    <form id="form1" runat="server" style="height: 100%; vertical-align: top;">
  
    <div style="display:none;position:absolute; top:3px;left:0px;width:200px;height:70px;background-color:Transparent" >
        <img src="../../App_Utility/Images/PageMain/Arm011.gif"   />
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <script type="text/javascript" language="javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
       
        function BeginRequestHandler(sender, args) {

        }

        function EndRequestHandler(sender, args) {

            //            document.getElementById("MPPage").style.height = screen.height - 215
            //            document.getElementById("tbbody").style.height = screen.height - 150

            if (document.getElementById("txtSelMenu").value == "Desktop") {
                document.all.item('divDesktop').style.display = "inline";
                document.all.item('divTreeMenu').style.display = "none";
            }
            else {
                document.all.item('divDesktop').style.display = "none";
                document.all.item('divTreeMenu').style.display = "inline";
            }

            if (document.getElementById("txtMsg").value != "") {
                alert(document.getElementById("txtMsg").value)
                document.getElementById("txtMsg").value = ""
            }

            if (document.getElementById("txtSubmit").value == "DesktopDel") {
                document.getElementById("txtTVDesktopID").value = ""
            }
            else if (document.getElementById("txtSubmit").value == "DesktopUp") {
                document.getElementById("txtTVDesktopID").value = ""
            }
            else if (document.getElementById("txtSubmit").value == "DesktopDown") {
                document.getElementById("txtTVDesktopID").value = ""
            }
            else if (document.getElementById("txtSubmit").value == "DesktopAdd") {
                document.getElementById("txtTVDesktopID").value = ""
            }


            document.getElementById("txtSubmit").value = ""
        }
        function onmouseovertd(Sign) {

            switch (Sign) {
                case 1:
                    if (IsSelect != 2)
                        tdDesktop.className = "tdMouseOver";
                    break;
                case 0:
                    if (IsSelect != 1)
                        tdMainMenu.className = "tdMainMenuhover";
                    break
                case 2:
                    document.getElementById("imgHideMenu").src = "../../App_Utility/Images/PageMain/Up12.gif";
                    break;
                case 3:
                    document.getElementById("ImgRestore").src = "../../App_Utility/Images/PageMain/Down12.gif";
                    break;
                case 4:
                    document.getElementById("imgRefreshMenu").src = "../../App_Utility/Images/PageMain/Refresh02.gif";
                    break;
                //                case 5:  
                //                    document.getElementById("imgHome").src = "../../App_Utility/Images/PageMain/Home02.gif";  
                //                    break;  

            }

        }

        function onmouseouttd(Sign) {

            switch (Sign) {
                case 1:
                    if (IsSelect != 2)
                        tdDesktop.className = "tdDesktop";
                    break;
                case 0:
                    if (IsSelect != 1)
                        tdMainMenu.className = "tdMainMenu";
                    break;
                case 2:
                    document.getElementById("imgHideMenu").src = "../../App_Utility/Images/PageMain/Up11.gif";
                    break;
                case 3:
                    document.getElementById("ImgRestore").src = "../../App_Utility/Images/PageMain/Down11.gif";
                    break;
                case 4:
                    document.getElementById("imgRefreshMenu").src = "../../App_Utility/Images/PageMain/Refresh01.gif";
                    break;
                //                case 5:  
                //                    document.getElementById("imgHome").src = "../../App_Utility/Images/PageMain/Home01.gif";  
                //                    break;  


            }
        }
        function onclickAbout() {
            window.showModalDialog('../PageMain/About.aspx', 'widow', 'dialogWidth=500px;dialogHeight=350px;status:no;')
        }

        function SignOut(Kind) {
            if (Kind == 0) {
                document.getElementById("txtSubmit").value = "SignOut"
                document.getElementById("BtnSubmit").click()
            }
        }
        function window.onunload() {
            try {
                location.href = '../../signout.aspx' + "?ToPersonID=" + document.getElementById("txtToPersonId").value + "&SessionID=" + document.getElementById("txtSessionID").value
               
            }
            catch (e) { }

        }

    </script>   
        
        
       <center>       
        <table id="tbbody" style="width: 100%;height:100%; " cellpadding="0" cellspacing="0">
            <tr>
                <td id="tdHeader" class="CssHeaderPageMain" style="height: 5%" align="center">
                    <table id="tblHeader" style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td id="tdSysInfo" align="right" dir="rtl" style="width: 600px">
                                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td id="tdVersion" align="right" width="220">
                                        
                                            <span style="color: #062549; font-family: Tahoma; font-size: 11px; font-weight:normal;">
                                                ويرايش نرم افزار : </span>
                                            <asp:Label ID="lblVersion" runat="server" Font-Bold="false" Font-Names="Tahoma"
                                                Font-Size="11px" ForeColor="#DD5800"></asp:Label>
                                        </td>
                                        
                                        <td id="tdCompanyInfo" width="700px" align="right">
                                        
                                            <asp:Label ID="Label1" runat="server" Text="نرم افزار اتوماسيون تردد و تغذيه-Kasra eTime "
                                                Font-Bold="false" Font-Names="Tahoma" Font-Size="11px" ForeColor=" #062549"></asp:Label>
                                            <asp:Label ID="lblCompanyName" runat="server" Font-Bold="false" Font-Names="Tahoma"
                                                Font-Size="11px" ForeColor="#DD5800"></asp:Label>
                                               
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td id="tdMenuName" align="center" dir="rtl" style="width: 50px; display: none;">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lblMenuName" runat="server"></asp:Label>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="TVMenu" EventName="NodeSelected" />
                                        <asp:AsyncPostBackTrigger ControlID="TVDesktop" EventName="NodeSelected" />
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
                                        <%--<asp:AsyncPostBackTrigger ControlID="TVDesktopMenu" EventName="ItemSelected" />--%>
                                        <asp:AsyncPostBackTrigger ControlID="imgRefreshMenu" EventName="Click" />
                                       <%-- <asp:AsyncPostBackTrigger ControlID="imgHome" EventName="Click" />--%>
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td id="tdUserName" align="right" dir="rtl" style="width: 250px">
                                <span style="color: #062549; font-family: Tahoma; font-size: 11px; font-weight: normal;">
                                    نام كاربر : </span>
                                <asp:Label ID="lblUserName" runat="server" Font-Bold="false" Font-Names="Tahoma"
                                    Font-Size="11px" ForeColor="#DD5800"></asp:Label>
                            </td>
                           <%-- <td id="tdDateTime" align="right" dir="rtl" style="width: 300px">
                                <span style="color: #062549; font-family: Tahoma; font-size: 13px; font-weight: bold;">
                                    زمان ورود : </span>
                                <asp:Label ID="lblDateTime" runat="server" Font-Bold="True" Font-Names="Tahoma"
                                    Font-Size="12px" ForeColor="#DD5800"  ></asp:Label>                                    
                            </td>--%>
                            <td align="right" dir="rtl" style="width: 160px;" valign="middle">&nbsp;&nbsp;&nbsp;
                            <img src="../../App_Utility/Images/PageMain/Arm02.gif" style="height:25px;vertical-align:top;"/>                          
                            </td>
                            <td id="tdShowRight" style="height:22px;width:25px" align="center" valign="middle">
                                <img id="ImgRestore" alt="" src="../../App_Utility/Images/PageMain/Down11.gif" onclick="imgShowMenuOnClick(this)"
                                  onmouseover="onmouseovertd(3)" onmouseout="onmouseouttd(3)"   style="cursor: pointer; display: none;width:12px;height:11px;vertical-align:middle" />                                
                            </td>
                          <%-- <td style="width:10px"></td>--%>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr><td style="display:none" ><cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity>
            
            </td> </tr>
            <tr>            
                <td id="tdDown" dir="rtl" style="height: 95%;">
                   
                   <table style="width: 100%; height: 100%;" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 240px; height: 100%;" id="tdRight" valign="top">
                                <table id="tblMenu" cellpadding="0" cellspacing="0" dir="rtl" style="width: 240px;
                                    height: 100%">
                                    <tr>
                                        <td id="tdTopMenu" style="height: 30px; background-image: url('../../App_Utility/Images/PageMain/Tab.gif');">
                                            <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
                                                <tr >
                                                   
                                                     <td align="left" style="width:23px;background-image: url('../../App_Utility/Images/PageMain/BG39.gif');" >
                                                        <img  id="imgHideMenu" alt="پنهان نمودن منو و ميزكار" onmouseover="onmouseovertd(2)" src="../../App_Utility/Images/PageMain/Up11.gif" onmouseout="onmouseouttd(2)" style="vertical-align:top;"
                                                            onclick="imgHideMenuOnClick(this)" style="cursor: pointer; margin-top: 0px; width: 11px; 
                                                            height: 13px;" />&nbsp;
                                                    </td>
                                                    <td style="width:30px;background-image: url('../../App_Utility/Images/PageMain/BG39.gif'); border-left-color: #3D6192; border-left-width: 1px; border-left-style: ridge;"></td>
                                                    <td id="tdMainMenu" class="tdMainMenu" onmouseover="onmouseovertd(0)" onmouseout="onmouseouttd(0)"
                                                        style="width: 64px; cursor: pointer;" onclick="tdMainMenuOnClick()">
                                                        &nbsp;
                                                    </td>
                                                    <td id="tdDesktop" class="tdDesktop" style="width: 64px; cursor: pointer;" onmouseover="onmouseovertd(1)"
                                                        onmouseout="onmouseouttd(1)" onclick="tdDesktopOnClick()">
                                                        &nbsp;
                                                    </td>
                                                    <td ialgn="left" style="height: 31px; background-image: url('~/App_Utility/Images/PageMain/BG39.gif');">
                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                            <td align="left" style="width:23px;background-image: url('../../App_Utility/Images/PageMain/BG39.gif');">
                                                                    <asp:ImageButton ID="imgRefreshMenu" ToolTip="بارگذاري مجدد منو و ميزكار" runat="server"
                                                                        Height="20px" ImageUrl="~/App_Utility/Images/PageMain/Refresh01.gif" Width="20px"
                                                                        OnClick="imgRefreshMenu_Click"   onmouseover="onmouseovertd(4)" onmouseout="onmouseouttd(4)"/>
                                                                </td>
                                                                <td  align="left" style="width:23px;background-image: url('../../App_Utility/Images/PageMain/BG39.gif');">
                                                                <img alt="راهنما" onclick="onclickHelp()" id="imgHelp" width="20px" src="../../App_Utility/Images/PageMain/Help.png" style="cursor: hand" />
                                                                   
                                                                </td>

                                                                <td align="left" style="width: 23px; background-image: url('../../App_Utility/Images/PageMain/BG39.gif');">
                                                                   <div id="DivAboutShow">
                                                                    <img alt="درباره" onclick="onclickAbout()" src="../../App_Utility/Images/PageMain/Information.png"
                                                                        width="20px" style="cursor: hand" />
                                                                    </div>
                                                                </td>

                                                                <td align="left" style="width:23px;background-image: url('../../App_Utility/Images/PageMain/BG39.gif');">
                                                                   
                                                                </td>
                                                               <td align="left" style="width:23px;background-image: url('../../App_Utility/Images/PageMain/BG39.gif');"><img alt="signOut" src="../../App_Utility/Images/PageMain/RedSignOut.png" onclick="SignOut(0)" id="signOut" style="cursor: hand" /></td> 
                                                            </tr>
                                                        </table>
                                                    </td>                                                  
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="tdBodyMenu" style="height: 100%;" align="center" valign="top" >
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <div id="divTreeMenu" style="width: 240px; display: none; height: 80%; overflow: auto;
                                                        scrollbar-highlight-color: white; overflow: auto; width: 100%; scrollbar-arrow-color: black;
                                                        scrollbar-base-color: #b0c4de;" align="right">
                                                        <ComponentArt:TreeView ID="TVMenu" Height="520px" Width="240px" EnableViewState="true"
                                                            DragAndDropEnabled="false" NodeEditingEnabled="false" KeyboardEnabled="false"
                                                            CssClass="TreeView" NodeCssClass="TreeNode" SelectedNodeCssClass="SelectedTreeNode"
                                                            HoverNodeCssClass="HoverTreeNode" NodeEditCssClass="NodeEdit" LineImageWidth="20"
                                                            LineImageHeight="21" ExpandCollapseImageWidth="10" ExpandCollapseImageHeight="10"
                                                            DefaultImageWidth="13" DefaultImageHeight="10" NodeIndent="10" ItemSpacing="0"
                                                            NodeLabelPadding="3" CollapseImageUrl="../../App_Utility/Images/PageMain/exp.gif"
                                                            ExpandImageUrl="../../App_Utility/Images/PageMain/col.gif" ParentNodeImageUrl="../../App_Utility/Images/PageMain/folders.gif"
                                                            LeafNodeImageUrl="../../App_Utility/Images/PageMain/folder.gif" ShowLines="true"
                                                            LineImagesFolderUrl="../../App_Utility/Images/PageMain/lines/" runat="server"
                                                            DropChildEnabled="False" DropRootEnabled="False" AutoPostBackOnNodeExpand="false"
                                                            AutoPostBackOnSelect="false" AutoScroll="true" ExpandSinglePath="True" >
                                                            <ClientEvents>
                                                                <ContextMenu EventHandler="TVMenu_onContextMenu" />
                                                                <NodeSelect EventHandler="TVMenu_OnNodeSelected" />
                                                            </ClientEvents>
                                                        </ComponentArt:TreeView>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    
                                                    
                                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
                                                    <%--<asp:AsyncPostBackTrigger ControlID="TVDesktopMenu" EventName="ItemSelected" />--%>
                                                    <asp:AsyncPostBackTrigger ControlID="imgRefreshMenu" EventName="Click" />
                                                   <%-- <asp:AsyncPostBackTrigger ControlID="imgHome" EventName="Click" />--%>
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                <ContentTemplate>
                                                    <div id="divDesktop" style="width: 240px; height: 100%; display: inline;" align="center"  >
                                                        <ComponentArt:TreeView ID="TVDesktop" Height="500px" Width="240px" EnableViewState="true"
                                                            DragAndDropEnabled="false" NodeEditingEnabled="false" KeyboardEnabled="false"
                                                            NodeIndent="16" ItemSpacing="0" NodeLabelPadding="3" runat="server" DropChildEnabled="False"
                                                            DropRootEnabled="False" AutoPostBackOnNodeExpand="false" ExpandSinglePath="false"
                                                            BackColor="Transparent"  MultipleSelectEnabled="False" AutoPostBackOnSelect="false"
                                                             AutoScroll="true" >
                                                            <ClientEvents>
                                                                <ContextMenu EventHandler="TVDesktop_onContextMenu" />
                                                                <NodeSelect EventHandler="TVDesktop_OnNodeSelected" />
                                                            </ClientEvents>
                                                        </ComponentArt:TreeView>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                   
                                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
                                                   
                                                    <%-- <asp:AsyncPostBackTrigger ControlID="TVDesktopMenu" EventName="ItemSelected" />--%>
                                                    <asp:AsyncPostBackTrigger ControlID="imgRefreshMenu" EventName="Click" />
                                                   <%-- <asp:AsyncPostBackTrigger ControlID="imgHome" EventName="Click" />--%>
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td valign="top">
                                <table style="border: thin inset #003399; width: 100%; height: 100%" border="0" cellpadding="0"
                                    cellspacing="0">
                                    <tr style="height: 10px">
                                        <td align="right" valign="TOP" dir="rtl" style="width: 100%; height: 0px; border-top-color: #99CCFF;
                                            border-top-width: 2px; border-top-style: ridge">
                                            <div id="container" class="container" style="width: 100%; height: 100%">
                                                <ul id="tabul">
                                                    <li id="litab" style="display: none"><a  href="" id="addtab"></a></li>
                                                </ul>
                                                <div id="tabcontent" style="width: 100%; height: 100%; ">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
       </center>
                
    <table class="style1">
        <tr>
            <td id="tdHidden" style="display: none;">
                <asp:TextBox ID="txtFromPersonId" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtToPersonId" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtSessionID" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtSkin" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtCompanyFinatialPeriodID" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtOnLineUserID" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtSelMenu" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtTVDesktopID" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtSubmit" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtMsg" runat="server"></asp:TextBox>
                <asp:Button ID="BtnSubmit" runat="server" OnClick="BtnSubmit_Click" Text="Button" />
                <asp:TextBox ID="txtScreenHeight" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtChkBroker" runat="server"></asp:TextBox>
                <asp:TextBox ID="txt_clientId" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtDefaultURL" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtMenuItemID" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtMenuTitle" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtConfermentAccess" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtShowAbout" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <ComponentArt:Menu ID="TVDesktopMenu" runat="server" Orientation="Vertical" ContextMenu="Custom"
        Height="88px" Width="139px" ContextControlId="TVDesktop">
        <ClientEvents>
            <ItemSelect EventHandler="TVDesktopMenu_OnSelect" />
        </ClientEvents>
        <Items>
            <ComponentArt:MenuItem ID="MenuItem1" runat="server" Text="حذف از ميز كار" DefaultSubGroupCssClass=""
                SubGroupCssClass="" TextAlign="Right" Value="Del">
            </ComponentArt:MenuItem>
            <ComponentArt:MenuItem ID="MenuItem2" runat="server" Text="حركت به بالا" TextAlign="Right" Value="Up">
            </ComponentArt:MenuItem>
            <ComponentArt:MenuItem ID="MenuItem3" runat="server" Text="حركت به پايين" TextAlign="Right" Value="Down">
            </ComponentArt:MenuItem>
            <ComponentArt:MenuItem ID="MenuItem5" runat="server" Text="تفويض" TextAlign="Right" Value="Conferment">
            </ComponentArt:MenuItem>
        </Items>
    </ComponentArt:Menu>
    <ComponentArt:Menu ID="TVTreeMenu" runat="server" Orientation="Vertical" ContextMenu="Custom"
        Height="32px" Width="139px" ContextControlId="TVMenu">
        <ClientEvents>
            <ItemSelect EventHandler="TVTreeMenu_OnSelect" />
        </ClientEvents>
        <Items>
            <ComponentArt:MenuItem ID="MenuItem4" runat="server" Text="ارسال به ميز كار" DefaultSubGroupCssClass=""
                SubGroupCssClass="" TextAlign="Right" Value="Add">
            </ComponentArt:MenuItem>
             <ComponentArt:MenuItem ID="MenuItem6" runat="server" Text="تفويض" TextAlign="Right" Value="Conferment">
            </ComponentArt:MenuItem>
        </Items>
    </ComponentArt:Menu>
    </form>
    <script language="javascript" type="text/javascript">
        TVDesktop.expandAll();
    </script>

</body>
</html>



