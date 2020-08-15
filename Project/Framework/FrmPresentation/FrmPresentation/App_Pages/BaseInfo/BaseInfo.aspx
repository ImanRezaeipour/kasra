<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="BaseInfo.aspx.cs" Inherits="TestPresentation.App_Pages.BaseInfo"
    Title="Untitled Page" ValidateRequest="false" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
.BackGround{
background-color:#d5e1fd
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table align="center" width="100%" >
        <tr>
            <td  align="right" >
                <fieldset dir="rtl" class="fieldsetStyle" align="right">
                    <legend class="legendStyle">پارامتر هاي جستجو</legend>
                    <div align="right">
                        <table align="right" width="40%">
                            <tr>
                                <td>
                                    نام گروه :
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="CmbCategory" onkeypress="return KeySort(this,false)" runat="server"
                                                Width="210px" CssClass="TxtControls">
                                            </asp:DropDownList>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
                <uc2:ToolBar ID="OToolBar" runat="server" align="center" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div style="scrollbar-highlight-color: white; overflow: auto; width: 500px; scrollbar-arrow-color: black;
                            scrollbar-base-color: #b0c4de; height: 370px;">
                            <center>
                                <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                            </center>
                        </div>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCategoryID" runat="server" />
                        <asp:HiddenField ID="txtID" runat="server" />
                        <asp:HiddenField ID="txtSystem" runat="server" />

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>

        <tr>
            <td>
                <table width="40%" >
                    <tr>
                        <td>
                            عنوان :
                        </td>
                        <td>
                            <input type="text" id="txtTitle" runat="server" class="TxtControls" />
                        </td>
                        <td>
                            اولويت :
                        </td>
                        <td>
                            <input type="text" id="txtIntVal2" runat="server" class="TxtControls" onkeydown="OnKeyDownInt(this);" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
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
</asp:Content>
