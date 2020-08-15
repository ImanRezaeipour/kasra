<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyPerson.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Person.ModifyPerson" MasterPageFile="../../../App_Utility/MasterPage/MasterBule.master" ValidateRequest="false"%>
<%@ Register src="../../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc2" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false"></asp:ScriptManager>
    <style>
        .DivStyle
        {
           border: thin groove #000000; 
           background-color: #C5D5E9;
        }
    </style>
    <table style="width: 100%"  >
        <tr>
            <td>
                <fieldset dir="rtl" style="width: 100%; height: 60px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="center">
                    <legend style="color: #78BED6">پارامتر هاي جستجو</legend>
                    <table style="width:900px" align="right">
                        <tr>
                            <td>
                                پرسنلي :
                            </td>
                            <td>
                                <uc2:ComboBox ID="CmbPerson" runat="server" />
                            </td>
                             <td>
                                شماره کارت :
                            </td>
                            <td>
                                <input type="text"   style="width:120px"  id="txtCardNO" runat="server"  class="TxtControls"  />
                            </td>
                            <td>
                                وضعيت :
                            </td>
                            <td>
                                <input type="checkbox" runat="server" id="chkActive" checked="true" onclick="OnClickChkActive()" />
                                فعال
                            </td>
                            <td>
                                <input type="checkbox" runat="server" id="chkInActive" onclick="OnClickChkActive()"/>
                                غير فعال
                            </td>
                            <td style="width:50px" >
                               
                            </td>
                            <td>
                                <input id="rdbSemat" runat="server" name="semat" type="radio" checked="true" />دارای
                                سمت
                              
                            </td>
                            <td>
                              <input id="rdbNoSemat" runat="server" name="semat" type="radio" />
                                بدون سمت
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="ModifyPerson.aspx" PageID="1105" />
            </td>
        </tr>
        <tr style="height: 420px">
            <td id="tdGrid" align="center" valign="top" class="DivStyle">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtValidate" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                        <div id="GridViewPerson" >
                            <cc2:KasraGrid ID="GrdPerson" runat="server" OnRowDataBound="Grid_RowDataBound" AllowSorting="true"
                                OnSorting="GrdPerson_Sorting">
                            </cc2:KasraGrid>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none"> 
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:HiddenField ID="txtPersonCodeSearch" runat="server" />
        <asp:HiddenField ID="txtPersonNameSearch" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />

        <input type="text" id="txtTmpPersonID" name="txtTmpPersonID" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtBtnNew" name="txtBtnNew" runat="server" />
        <input type="text" id="txtBtnEdit" name="txtBtnEdit" runat="server" />
        <input type="text" id="txtBtnSearch" name="txtBtnSearch" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtActive" name="txtActive" runat="server" />
        <input type="text" id="txtCardNoSearch" name="txtCardNoSearch" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSearchFlag" name="txtSearchFlag" runat="server" />
    </div>
     <script language="javascript" src="../../../App_Utility/Scripts/farsi.js"></script>
    <script src="../../../App_Utility/Scripts/BaseInfo/Person/ModifyPerson.js" type="text/javascript"></script>
</asp:Content>
