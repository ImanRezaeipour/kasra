<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OTree.ascx.cs" Inherits="FrmPresentation.App_Utility.NewTree.OTree" %>
<%@ Register assembly="ComponentArt.Web.UI" namespace="ComponentArt.Web.UI" tagprefix="ComponentArt" %>
<table border="0" id="TBMain" IsMainTable="true" runat="server"  dir="rtl" align="right" 
    cellpadding="0" cellspacing="0"  >
    <tr>
        <td style="width: 250px;" valign="top" onclick='aa()'>
            <div style="border: 1px solid #66CCFF; width: 250px; height: 500px; scrollbar-hightlight-color: white;
                scrollbar-arrow-color: black; scrollbar-base-color: #B1D3FF;">
                 <ComponentArt:TreeView ID="TVNew" runat="server" Height="98%" Width="245px" AutoPostBackOnSelect="true"
                    KeyboardEnabled="true" MultipleSelectEnabled="true" DisplayMargin="false" ShowLines="true"
                    CssClass="" NodeCssClass="TreeNode" SelectedNodeCssClass="SelectedTreeNode" MultipleSelectedNodeCssClass="MultipleSelectedTreeNode"
                    HoverNodeCssClass="HoverTreeNode" NodeEditCssClass="NodeEdit" CutNodeCssClass="CutTreeNode"
                    MarginWidth="24" DefaultMarginImageWidth="24" DefaultMarginImageHeight="20" LineImageWidth="19"
                    LineImageHeight="20" DefaultImageWidth="16" DefaultImageHeight="16" NodeLabelPadding="3"
                    ParentNodeImageUrl="folders.gif" LeafNodeImageUrl="folder.gif" CollapseImageUrl="exp.gif"
                    ExpandImageUrl="col.gif" ExpandCollapseImageWidth="19" ExpandCollapseImageHeight="20"
                    ImagesBaseUrl="/FrmPresentation/App_Utility/Images/TreeViewImage/" LineImagesFolderUrl="/FrmPresentation/App_Utility/Images/TreeViewLine/"
                    ExpandSinglePath="true"
                     
                      ExpandNodeOnSelect="False"
                    CollapseNodeOnSelect="False">
                    <ClientEvents>
                        <%--<ContextMenu EventHandler="TVNew_onContextMenu" />--%>
                        
                    </ClientEvents>
                </ComponentArt:TreeView>
            </div>
            <div style="display: none">
                <input type="text" id="txtPersonCode" name="txtPersonCode" runat="server" />
                <asp:HiddenField ID="txtTreePersonCode" runat="server" />
                <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
                    runat="server" />
                <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                
            </div>
        </td>
        
       <%-- <td><ComponentArt:Menu id="DepartmentMenu"
          ExpandSlide="None"
          ExpandTransition="Fade"
          ExpandDelay="250"
          CollapseSlide="None"
          CollapseTransition="Fade"
          Orientation="Vertical"
          CssClass="MenuGroup"
          DefaultGroupCssClass="MenuGroup"
          DefaultItemLookID="DefaultItemLook"
          DefaultGroupItemSpacing="1px"
          ImagesBaseUrl="images/"
          EnableViewState="False"
          ContextMenu="Custom"
          
          runat="server" ScrollDownLookId="DefaultItemLook" 
            ScrollUpLookId="DefaultItemLook" TopGroupItemSpacing="1px">
            <ClientEvents>
                <ItemSelect EventHandler="DepartmentMenu_OnSelect" />
            </ClientEvents>
        <Items>
            <ComponentArt:MenuItem Text="ايجاد واحد جديد" Value="New"></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="ويرايش واحد انتخاب شده" Value="Edit"></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="  "></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="  "></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="  "></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="  "></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="حذف واحد انتخاب شده فاقد واحد زير مجموعه و سمت و پرسنل فعال" Value="DelDeptNoSubNoRoleNoPerson"></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="حذف واحد انتخاب شده و حذف واحدهاي زير مجموعه و سمتها و پرسنل فعال" Value="DelDeptYesSubYesRoleYesPerson"></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="حذف واحدهاي زير مجموعه واحد انتخاب شده فاقد سمت و پرسنل فعال" Value="DelSubDeptNoRoleNoPerson"></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="حذف واحدهاي زير مجموعه واحد انتخاب شده و سمتها و پرسنل فعال" Value="DelSubDeptYesRoleYesPerson"></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="حذف پرسنل فعال واحد انتخاب شده" Value="DelPersonDept"></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="حذف سمتها و پرسنل فعال واحد انتخاب شده" Value="DelRolePersonDept"></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="  "></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="  "></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="  "></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="  "></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="اخذ كپي از واحد جاري" Value="DeptCopy"></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="اخذ كپي از واحد جاري و حذف از محل جاري" 
                Value="DeptCut"></ComponentArt:MenuItem>
            <ComponentArt:MenuItem ID="MenuItem1" runat="server" DefaultSubGroupCssClass="MenuGroup" 
                DefaultSubGroupItemSpacing="1px" SubGroupCssClass="MenuGroup" 
                SubGroupItemSpacing="1px" 
                Text="قراردادن واحد كپي شده در محل جاري " Value="DeptPaste">
            </ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="  "></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="  "></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="  "></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="  "></ComponentArt:MenuItem>
            <ComponentArt:MenuItem ID="MenuItem2" runat="server" DefaultSubGroupCssClass="MenuGroup" 
                DefaultSubGroupItemSpacing="1px" SubGroupCssClass="MenuGroup" 
                SubGroupItemSpacing="1px" Text="اخذ كپي از پرسنل واحد انتخاب شده" 
                Value="PersonCopy">
            </ComponentArt:MenuItem>
            <ComponentArt:MenuItem ID="MenuItem3" runat="server" DefaultSubGroupCssClass="MenuGroup" 
                DefaultSubGroupItemSpacing="1px" SubGroupCssClass="MenuGroup" 
                SubGroupItemSpacing="1px" 
                Text="اخذ كپي از پرسنل واحد جاري و حذف واحد از محل جاري" 
                Value="PersonCut">
            </ComponentArt:MenuItem>
            <ComponentArt:MenuItem ID="MenuItem4" runat="server" DefaultSubGroupCssClass="MenuGroup" 
                DefaultSubGroupItemSpacing="1px" SubGroupCssClass="MenuGroup" 
                SubGroupItemSpacing="1px" Text="قراردادن پرسنل كپي شده در محل جاري" 
                Value="PersonPaste">
            </ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="  "></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="  "></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="  "></ComponentArt:MenuItem>
            <ComponentArt:MenuItem Text="  "></ComponentArt:MenuItem>
            <ComponentArt:MenuItem ID="MenuItem5" runat="server" DefaultSubGroupCssClass="MenuGroup" 
                DefaultSubGroupItemSpacing="1px" SubGroupCssClass="MenuGroup" 
                SubGroupItemSpacing="1px" Text="اخذ كپي از يك يا چند واحد و حذف از محل جاري جهت ادغام" 
                Value="DeptMergeCut">
            </ComponentArt:MenuItem>
            <ComponentArt:MenuItem ID="MenuItem6" runat="server" DefaultSubGroupCssClass="MenuGroup" 
                DefaultSubGroupItemSpacing="1px" SubGroupCssClass="MenuGroup" 
                SubGroupItemSpacing="1px" Text="ادغام واحدهاي كپي شده و قراردادن در محل جاري" 
                Value="DeptMergePaste">
            </ComponentArt:MenuItem>
        </Items>
        <ItemLooks>
          <ComponentArt:ItemLook LookID="DefaultItemLook" CssClass="MenuItem" HoverCssClass="MenuItemHover" LabelPaddingLeft="15" LabelPaddingRight="10" LabelPaddingTop="3" LabelPaddingBottom="3" />
          <ComponentArt:ItemLook LookID="BreakItem" ImageUrl="break.gif" CssClass="MenuBreak" ImageHeight="1" ImageWidth="100%" />
        </ItemLooks>
        </ComponentArt:Menu></td>--%>
        
    </tr>
</table>
<script language=javascript type="text/javascript">
    function SelectNodeById(obj) {   
        
        TVNew.SelectNodeById(obj);
    }
    
    function aa() {
        
        TVNew.SelectNodeById(8)
    }
    
    function F_GetUserControlID(obj) {
        try {
        
            var strUserControlID = "";
            var iCounter = 0;
            
            while (++iCounter < 20 && obj != null && obj.IsMainTable == null)
                obj = obj.parentElement;
            
            if (obj != null && obj.IsMainTable != null && obj.IsMainTable == "true")
                strUserControlID = obj.UserControlID;
            
            return strUserControlID;
        }
        catch (e) {
        }

    }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        </script>