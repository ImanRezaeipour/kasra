<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="TestPage.aspx.cs" Inherits="FrmPresentation.App_Pages.TestPage" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../App_Utility/MultiGroup/MultiGroup.ascx" tagname="MultiGroup" tagprefix="uc1" %>

<%@ Register src="../App_Utility/MultiPerson/MuliPerson.ascx" tagname="MuliPerson" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<table>
 <tr>
 <td>
 combo:
 </td>
 <td>
 
     <uc1:MultiGroup ID="MultiGroup1" runat="server" />
 
 </td>

 <td>
 comboPerson :
 </td>
 <td>
 
     
 
     <uc2:MuliPerson ID="MuliPerson1" runat="server" />
 
     
 
 </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCategoryID" runat="server" />
                        <asp:HiddenField ID="txtID" runat="server" />
                        <asp:HiddenField ID="txtSystem" runat="server" />

                    </ContentTemplate>
                    <Triggers>
                    
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
</table>
<div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
      
        <input type="text" id="txtSubmit" runat="server" />
        <input type="text" id="txtOnLineUser" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtXML" name="txtXML" runat="server" />
        <input type="text" id="txtGrpID" name="txtGrpID" runat="server" />
        <input type="text" id="txtIntVal" name="txtIntVal" runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtDLookupID" name="txtDLookupID" runat="server" />
         <input type="text" id="txtSystemID" name="txtSystemID" runat="server" />
        <input type="text" id="txtXmlDesc" runat="server" />
        <a href="../../App_Utility/Images/Icons/btnSubNodes.gif" id="Url"></a>
        
    </div>
    <script src="../../App_Utility/Scripts/BaseInfo/BaseInfo.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/KeySorting.js"></script>



    </script>
</asp:Content>

