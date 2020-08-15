<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdvancedSearch.ascx.cs" Inherits="AdvancedSearch.AdvancedSearch"  %>
 <script src="SpryAssets/SpryCollapsiblePanel.js" type="text/javascript"></script>
 <link href="SpryAssets/SpryCollapsiblePanel.css" rel="stylesheet" type="text/css" />

 <div id="CollapsiblePanel1" class="CollapsiblePanel">
  <div class="CollapsiblePanelTab" tabindex="0">جستجوي پيشرفته</div>

  <div class="CollapsiblePanelContent"> 
<asp:Literal ID="litContent" runat="server"></asp:Literal>

   </div>
     
</div>

 <script type="text/javascript" language="javascript">
    //var CollapsiblePanel1 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel1",{contentIsOpen:false}); 
    </script>
    
<table>
    <tr>
        <td style="display:none">
        <input id="txtFilterStr"  name="txtFilterStr" runat="server" type="text" />
         <input id="txtHtml" name="txtHtml" runat="server" type="text" />
        </td>
    </tr>
</table>

 <script language='javascript' type='text/javascript' src='Script.js'></script>
 