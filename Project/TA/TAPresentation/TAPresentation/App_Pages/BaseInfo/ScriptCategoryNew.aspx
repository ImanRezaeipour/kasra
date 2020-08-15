<%@ Page Title="----------------------------------------------دسته بندی اسکریپت---------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="ScriptCategoryNew.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.ScriptCategoryNew" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
 </asp:ScriptManager>                         
    <table width="90%">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td>
                            <fieldset style="width:500px; height: 70px; text-align: center;">
                                <legend><font style="font-size: 14px; color: #FF0066; font-weight: bold; font-family: 'KasraB Traffic';">
                                </font></legend>
                                <table align="right">
                                    <tr>
                                        <td>
                                            <div align="right">
                                                &nbsp; دسته بندي :
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                <input type="text" runat="server" id="txtCategoryName" style="width: 180px" class="TxtControls" />
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                مخفف :
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                <input type="text" runat="server" id="txtAcronym" style="width: 180px" class="TxtControls" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            شرح :
                                        </td>
                                        <td colspan="3">
                                         
                                             <textarea id="txtDescr" runat="server" class="TxtControls" style="width: 360px; height:60"  wrap="ON">  </textarea>
                                            
                                        </td>
                                    </tr>
                                </table>   
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div style="display: none">
                    <asp:HiddenField ID="txtValidate" runat="server" />
                    <asp:HiddenField ID="txtAlert" runat="server" />
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtMode" name="txtMode" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtCategoryID" name="txtCategoryID" runat="server" />
         <input type="text" id="txtXmlDiscription" name="txtXmlDiscription" runat="server" />
    </div>
    <script src="../../App_Utility/Scripts/BaseInfo/ScriptCategoryNew.js" type="text/javascript"></script>
</asp:Content>

