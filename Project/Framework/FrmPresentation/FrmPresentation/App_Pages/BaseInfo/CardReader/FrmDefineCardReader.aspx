<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="FrmDefineCardReader.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.FrmDefineCardReader" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>    
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <table  align="center">
        <tr>
            <td>
               <fieldset  dir="rtl"  style="width: 100%; height:50px; border-right: lightblue thin inset;
                    border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                    align="center">
                    <legend style="color: lightblue">آيتم هاي جستجو</legend>
                <table  align="right">
                    <tr>
                        <td>
                             کارتخوان :
                        </td>
                        <td>
                            <componentart:combobox id="CmbCardReader" runat="server" onchange="OnChangePersponCode()"
                                runningmode="CallBack" autohighlight="false" autocomplete="true" autofilter="true"
                                datatextfield="CardReaderNo" datafields="CardReaderNo,Name" cssclass="comboBox"
                                hovercssclass="comboBoxHover" bordercolor="#528bc5" focusedcssclass="comboBoxHover"
                                textboxcssclass="TxtControls" textboxhovercssclass="comboBoxHover" dropdowncssclass="comboDropDown"
                                itemclienttemplateid="itemTemplate" itemcssclass="comboItem" itemhovercssclass="comboItemHover"
                                selecteditemcssclass="comboItemHover" drophoverimageurl="../../../App_Utility/Images/Icons/Down1.gif"
                                dropimageurl="../../../App_Utility/Images/Icons/Down1.gif" dropdownpagesize="10"
                                dropdownwidth="300" width="200" ondatarequested="ComboBox1_DataRequested" filterfield="CardReaderNo">
                            <ClientTemplates>
                            <ComponentArt:ClientTemplate ID="itemTemplate">
                          <table border="2" cellpadding="0" cellspacing="0" width="100%" style="background-color:White";><tr class="dataRow"><!--<td class="dataCell" style="width:100px;">## DataItem.getProperty('PersonID') ##</td>--><td class="dataCell" align="center" style="width:100px;">## DataItem.getProperty('CardReaderNo') ##</td><td class="dataCell">## DataItem.getProperty('Name') ##&nbsp;</td></tr></table>
                        </ComponentArt:ClientTemplate>
                       </ClientTemplates>
                            <DropDownHeader>
                             <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr class="headingRow" style="background-color:White";><!--<td class="headingCell" style="width:100px;">PersonID</td>--><td class="headingCell" align="center" style="width:100px;">CardReaderNo</td><td class="headingCell">Name</td></tr></table>
                                                      </DropDownHeader>
                            </componentart:combobox>
                        </td>
                    
                        <td>
                            وضعيت :
                        </td>
                        <td >
                            <input type="checkbox" runat="server" id="ChkActive" />فعال
                        </td>
                        <td >
                            <input type="checkbox" runat="server" id="ChkDeActive" />غير فعال
                        </td>
                      
                    </tr>
                </table>
                </fieldset>
            </td>
        </tr>
        <tr>
       
            <td >
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr style="height:400px;">
            <td style="border: medium groove #C0C0C0; background-color: #C5D5E9; height: 400px"
                valign="top">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtSDate" runat="server" />
                        <asp:HiddenField ID="txtEDate" runat="server" />
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="lblFrom" runat="server" />
                        <asp:HiddenField ID="lblTo" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="lblTotal" runat="server" />
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtOrderString" runat="server" />
                        <asp:HiddenField ID="txtCodePermision" runat="server" />
                        <asp:HiddenField ID="CurPage" runat="server" />
                        <asp:HiddenField ID="txtStatus" runat="server" />
                          <asp:HiddenField ID="txtCardReaderID" runat="server" />
                     
                        <div style="height: 339px; position: fixed; top: 10px; right: 484px;"  align="center">
                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
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
        <cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity>
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
        <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
        <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtCardReaderNo" name="txtCardReaderNo" runat="server" />
        <input type="text" id="txtActiveStatus" name="txtActiveStatus" runat="server" />
 
    </div>

  <script src="../../../App_Utility/Scripts/BaseInfo/CardReader/DefineCardReader.js"
        type="text/javascript"></script>
</asp:Content>

