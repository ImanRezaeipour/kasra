<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="FrmPresentation.App_Pages.test.WebForm3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head id="Head1" runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <title>Client-side TabStrip</title>
	

    <link href="../../App_Utility/Styles/ComponentArt/Tab/tabStyle.css" type="text/css" rel="stylesheet" />
  </head>

  <body>
    <form id="Form1" method="post" runat="server">


 <table cellspacing="10" cellpadding="10" class="pghbg">
   <tr><td>

    <ComponentArt:TabStrip id="TabStrip1"
      CssClass="TopGroup"
      SiteMapXmlFile="tabData.xml"
      DefaultItemLookId="DefaultTabLook"
      DefaultSelectedItemLookId="SelectedTabLook"
      DefaultDisabledItemLookId="DisabledTabLook"
      DefaultGroupTabSpacing="1"
      ImagesBaseUrl="../../App_Utility/Images/ComponentArt/Tab/images/" 
      MultiPageId="MultiPage1"
      runat="server">
    <ItemLooks>
      <ComponentArt:ItemLook LookId="DefaultTabLook" CssClass="DefaultTab" 
      HoverCssClass="DefaultTabHover" LabelPaddingLeft="10" LabelPaddingRight="10"
      LabelPaddingTop="5" LabelPaddingBottom="4" 
       
       LeftIconWidth="3" LeftIconHeight="21" 
      RightIconWidth="3" RightIconHeight="21" />
      <ComponentArt:ItemLook LookId="SelectedTabLook" 
      CssClass="SelectedTab" LabelPaddingLeft="10" LabelPaddingRight="10" 
      LabelPaddingTop="4" LabelPaddingBottom="4" 
       LeftIconWidth="3" LeftIconHeight="21" 
      RightIconWidth="3" RightIconHeight="21" />
    </ItemLooks>
    </ComponentArt:TabStrip>

    <ComponentArt:MultiPage id="MultiPage1" CssClass="MultiPage" runat="server">

      <ComponentArt:PageView ID="PageView1" CssClass="PageContent" runat="server">
        <font color="blue">Web Site Settings</font><br><br>
        <table cellspacing="0" cellpadding="3" border="0">
        <tr>
          <td class="PageContent" width="90">Description: </td>
          <td class="PageContent"><asp:TextBox id="TextBox1" Text="Default Web Site" width="180" runat="server" /></td>
          <td class="PageContent"></td>
        </tr>
        <tr>
          <td class="PageContent" width="90">IP Address: </td>
          <td class="PageContent">
            <asp:DropDownList ID="DropDownList1" width="180" Runat="server">
              <asp:ListItem Value="All Unassigned">All Unassigned</asp:ListItem>
              <asp:ListItem Value="188.160.141.24">188.160.141.24</asp:ListItem>
              <asp:ListItem Value="188.160.141.25">188.160.141.25</asp:ListItem>
              <asp:ListItem Value="188.160.141.26">188.160.141.26</asp:ListItem>
            </asp:DropDownList>
          </td>
          <td class="PageContent"><asp:Button id="Button1" Text="Advanced..." runat="server" /></td>
        </tr>
        <tr>
          <td class="PageContent" width="90">TCP Port: </td>
          <td class="PageContent">
            <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
              <td><asp:TextBox id="TextBox2" Text="80" runat="server" width="50" /></td>
              <td class="PageContent" width="50">SSL Port: </td>
              <td align="right" width="50"><asp:TextBox id="TextBox3" Text="" runat="server" width="50" /></td>
            </tr>
            </table>
          </td>
          <td class="PageContent"></td>
        </tr>
        </table>
      </ComponentArt:PageView>

      <ComponentArt:PageView ID="PageView2" CssClass="PageContent" runat="server">
        <font color="blue">Connection Settings</font><br><br>
        <table cellspacing="0" cellpadding="3" border="0">
        <tr>
          <td class="PageContent" >
            Connection Timeout: &nbsp;&nbsp;&nbsp; <asp:TextBox id="TextBox4" Text="900" runat="server" width="80" /> seconds
          </td>
        </tr>
        <tr>
          <td class="PageContent">
            <asp:CheckBox id="CheckBox1" Text="HTTP Keep-Alives Enabled" Checked="true" runat="server" />
          </td>
        </table>
      </ComponentArt:PageView>

      <ComponentArt:PageView ID="PageView3" CssClass="PageContent" runat="server">
        <font color="blue">Logging Settings</font><br><br>
        Active Log Format: <br>
        <asp:DropDownList ID="DropDownList2" Width="250" Runat="server">
          <asp:ListItem Value="W3C Extended Log File Format">W3C Extended Log File Format</asp:ListItem>
          <asp:ListItem Value="Microsoft IIS Log File Format">Microsoft IIS Log File Format</asp:ListItem>
          <asp:ListItem Value="NCSA Common Log File Format">NCSA Common Log File Format</asp:ListItem>
        </asp:DropDownList>
        &nbsp;
        <asp:Button id="Button2" Text="Properties..." runat="server" />
      </ComponentArt:PageView>

      <ComponentArt:PageView ID="PageView4" CssClass="PageContent" runat="server">
        <font color="blue">Application Settings</font><br><br>
        <table cellspacing="0" cellpadding="3" border="0">
        <tr>
          <td class="PageContent" width="90">Starting Point: </td>
          <td class="PageContent">&lt;Default Web Site&gt;</td>
          <td class="PageContent"></td>
        </tr>
        <tr>
          <td class="PageContent" width="90">Application Name: </td>
          <td class="PageContent"><asp:TextBox id="TextBox5" Text="Default Application" runat="server" width="150" /></td>
          <td class="PageContent"><asp:Button id="Button5" Text="Remove" runat="server" Width="120" /></td>
        </tr>
        </table>
      </ComponentArt:PageView>

      <ComponentArt:PageView ID="PageView5" CssClass="PageContent" runat="server">
        <font color="blue">Permissions Settings</font><br><br>
        <table cellspacing="0" cellpadding="3" border="0">
        <tr>
          <td class="PageContent" width="90"><nobr>Execute Permissions: </nobr></td>
          <td class="PageContent">
            <asp:DropDownList ID="DropDownList3" Width="150" Runat="server">
              <asp:ListItem Value="None">None</asp:ListItem>
              <asp:ListItem Value="Scripts Only" Selected="true">Scripts Only</asp:ListItem>
              <asp:ListItem Value="Scripts and Executables">Scripts and Executables</asp:ListItem>
            </asp:DropDownList>
          </td>
          <td class="PageContent"><asp:Button id="Button6" Text="Configuration..." runat="server" Width="120" /></td>
        </tr>
        <tr>
          <td class="PageContent" width="90"><nobr>Application Protection: </nobr></td>
          <td class="PageContent">
            <asp:DropDownList ID="DropDownList4" Width="150" Runat="server">
              <asp:ListItem Value="Low (IIS Process)">Low (IIS Process)</asp:ListItem>
              <asp:ListItem Value="Medium (Pooled)">Medium (Pooled)</asp:ListItem>
              <asp:ListItem Value="High (Isolated)">High (Isolated)</asp:ListItem>
            </asp:DropDownList>
          </td>
          <td class="PageContent"><asp:Button id="Button7" Text="Unload" runat="server" Width="120" /></td>
        </tr>
        </table>
      </ComponentArt:PageView>

    </ComponentArt:MultiPage>
    
</td></tr></table>
 


    <div style="position:absolute;top:0px;left:0px;visibility:hidden;">
      <img src="../../App_Utility/Images/ComponentArt/Tab/images/tab_bg.gif" width="0" height="0" alt="" />
      <img src="../../App_Utility/Images/ComponentArt/Tab/images/hover_tab_bg.gif" width="0" height="0" alt="" />
      <img src="../../App_Utility/Images/ComponentArt/Tab/images/selected_tab_bg.gif" width="0" height="0" alt="" />
    </div>

    </form>
  </body>
</html>




