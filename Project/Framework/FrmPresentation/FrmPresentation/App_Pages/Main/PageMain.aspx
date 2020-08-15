<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageMain.aspx.cs" Inherits="FrmPresentation.App_Pages.Main.PageMain"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>سيستم جامع كنترل تردد</title>
    <link href="../../App_Utility/Styles/GeneralStyles.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/FrmPresentation/App_Utility/Scripts/Tab/resources/css/ext-all.css" />
    <script type="text/javascript" src="/FrmPresentation/App_Utility/Scripts/Tab/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="/FrmPresentation/App_Utility/Scripts/Tab/ext-all.js"></script>
    <link rel="stylesheet" type="text/css" href="/FrmPresentation/App_Utility/Scripts/Tab/Menu/menu/menus.css" />    
    <script type="text/javascript" src="/FrmPresentation/App_Utility/Scripts/Tab/TabCloseMenu.js"></script>
    
    <script language="javascript" type="text/javascript">

        var varMenuItemID = 0
        var vartable;
        /*---------------------------------------------------------------------*/
        function Pageunload() {
            $get("txtSubmit").value = "SignOut";
            $get("BtnSubmit").click();

        }
        /*---------------------------------------------------------------------*/
        function onload() {
            document.getElementById("div1").style.display = "inline"
            offState("LeftTD")
            tdPageTitle.innerHTML = document.getElementById("txtPageTitle").value
            document.getElementById("MainFrame").src = document.getElementById("txtDefaultPage").value
        }
        /*---------------------------------------------------------------------*/
        function HomeOnClick() {
            window.open("/FrmPresentation/App_Pages/Login/Login.aspx", "_self")
        }
        /*---------------------------------------------------------------------*/
        function onItemClick(item) {
            offState("LeftTD")
            tdPageTitle.innerHTML = item.text
            document.getElementById("MainFrame").src = item.url
        }
        /*---------------------------------------------------------------------*/
    </script>
 
          
</head>
<body scroll="no" onload="onload()" onunload="Pageunload()" style="margin: 0px">
    <form id="form1" runat="server">
    <div style="position: absolute; text-align: right;" dir="rtl">
        <table class="csstdPageTitle">
            <tr>
                <td id="tdPageTitle">
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;
                </td>
                <td style="color: #FF66B3">
                    نام کاربر:
                </td>
                <td id="tdUserName" runat="server">
                </td>
            </tr>
        </table>
    </div>
    <asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>
   
    <div>
        <div>

            <script type="text/javascript" language="javascript">
                Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                function BeginRequestHandler(sender, args) {
                    //var elem = args.get_postBackElement();
                    //$get("PostbackControlName").value = elem.id;
                }
                function EndRequestHandler(sender, args) {
                    //if ($get("PostbackControlName").value == "tvControl") {
                    //alert( document.getElementById("hdnURL").value )
                    // document.getElementById("MainFrame").src = document.getElementById("hdnURL").value
                    //TdPageName.innerHTML = document.getElementById("hdnUserName").value 

                    // }
                    // $get("PostbackControlName").value = "";

                }
            </script>

            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td class="tablemaster">
                        <table id="table1" cellspacing="0" cellpadding="0" border="0">
                            <tr>
                                <td id="tdttt" align="right">
                                    <asp:Literal ID="LiteralMenujs" runat="server">
                        
                                    </asp:Literal>
                                    <asp:Literal ID="Literal1" runat="server">
                        
                                    </asp:Literal>
                                    <div id="tabs" style="padding: 0px; margin: 0px">
                                    </div>
                                    <div dir="ltr">
                                        <asp:Literal ID="LiteralMenu" runat="server">
                        
                                        </asp:Literal>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <table id="MainDefulttable" cellspacing="0" cellpadding="0" border="0">
                                        <tr>
                                        <td id="LeftTD"  valign="top" width="1024">
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                        <iframe id="MainFrame" runat="server" src=""
                                                            frameborder="0" style="margin: 5px; border: 1px solid #6593CF; width: 100%; height: 650px">
                                                        </iframe>
                                                        <asp:HiddenField ID="hdnURL" runat="server" />
                                                        <asp:HiddenField ID="hdnUserName" runat="server" />
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            
                            <tr>
                                <td id="DownRow" style="display: none;">
                                    <input type="text" id="txtUrl" runat="server" />
                                    <input type="text" id="PostbackControlName" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div style="display: none">
            <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
            <input id="txtSubmit" type="text" name="txtSubmit" runat="server" />
            <input type="text" id="txtXMLSubsystem" runat="server" />
            <input type="text" id="txtXMLMenuItem" runat="server" />
            <input id="txtMenuItemtitle" type="text" runat="server" />
            <input id="txtMenuItemId" type="text" runat="server" />
            <input type="text" id="txtDefaultPage" runat="server" />
            <input type="text" id="txtPageTitle" runat="server" />
        </div>
    </div>
    <script type="text/javascript">
         var stateNode;
        /*---------------------------------------------------------------------*/
        function offState(rootCell) {

            var tallyLeft = document.getElementById(rootCell).offsetLeft;
            var tallyTop = document.getElementById(rootCell).offsetTop;
            if (document.getElementById(rootCell).offsetParent) {
                var rootNodeFound = false;
                var offsetStart = document.getElementById(rootCell).offsetParent;
                while (!rootNodeFound) {
                    tallyLeft += offsetStart.offsetLeft;
                    tallyTop += offsetStart.offsetTop;
                    if (offsetStart.offsetParent)
                        offsetStart = offsetStart.offsetParent;
                    else
                        rootNodeFound = true;
                }
            }

            var shadow = document.createElement('div');
            shadow.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=90)';
            shadow.style.MozOpacity = 0.50;
            shadow.setAttribute('id', 'shadow_' + rootCell);
            shadow.style.position = 'absolute';
            shadow.style.left = tallyLeft + 'px';
            shadow.style.top = tallyTop + 'px';
            shadow.style.width = document.getElementById(rootCell).offsetWidth.toString() + 'px';
            shadow.style.height = document.getElementById(rootCell).offsetHeight.toString() + 'px';
            shadow.style.background = '#e7eeff';
            document.body.appendChild(shadow);

            var shadowMessage = document.createElement('div');
            shadowMessage.setAttribute('id', 'shadowMessage');
            shadowMessage.style.position = 'absolute';
            shadowMessage.innerHTML =
				'<table dir="rtl">' +
					'<tr>' +
						'<td dir="rtl" valign=middle style="color:#006699;font-family: Tahoma;	font-size: 11pt;	font-weight: 600;">' +
							'لطفا منتظر بمانيد' +
						'</td>' +
						'<td dir="rtl" valign=top>' +
							'<img  src="/FrmPresentation/App_Utility/Images/Please Wait/Clock_Stop.png" width="64" height="64">' +
						'</td>' +
					'</tr>' +
				'</table>';
            shadow.appendChild(shadowMessage);
            shadowMessage.style.left = ((shadowMessage.offsetParent.offsetWidth / 2) - (shadowMessage.offsetWidth / 2)).toString() + 'px';
            shadowMessage.style.top = ((shadowMessage.offsetParent.offsetHeight / 2) - (shadowMessage.offsetHeight / 2)).toString() + 'px';

            stateNode = 'shadow_' + rootCell;
        }
        /*---------------------------------------------------------------------*/
        function onState() {
            document.getElementById(stateNode).parentNode.removeChild(document.getElementById(stateNode));
        }
        /*---------------------------------------------------------------------*/

               
    </script>

    </form>
</body>
</html>
