<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainMonthlyReport.aspx.cs"
    MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" Inherits="TAPresentation.App_Pages.Reports.MainMonthlyReport"
    ValidateRequest="false" AsyncTimeout="7200" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc3" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
 <%@ Register Assembly="CssJscriptOptimizer" Namespace="CssJscriptOptimizer.Controls" TagPrefix="cc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <cc3:StyleSheetCombiner ID="sheetCombiner" runat="server">
      <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
    
    <link rel="stylesheet" href="../../App_Utility/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
     </cc3:StyleSheetCombiner>    
    <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False" AsyncPostBackTimeout="7200"
        ScriptMode="Release">
    </asp:ScriptManager>
    <table style="vertical-align:top"">
        <tr valign="top">
            <td style="width: 100%" valign="top">
                <table>
                    <tr> 
                        <td>
                            دوره
                        </td>
                        <td>
                            <asp:DropDownList Width="120px" ID="CmbPeriod" runat="server" class="TxtControls" onkeydown="onkeydownEnter()" onchange="ChangeCmbPeriod()">
                            </asp:DropDownList>
                        </td>
                        <td id="TDSearchText">
                            جستجو
                        </td>
                        <td id="TDSearchCombo" >
                            <uc1:ComboBox ID="cmbPerson" runat="server" />
                        </td>
                        <td id="TDSearchTxt" style="display:none" >
                            
                                    <input id="txtPersonCode" type="text" runat="server" dir="rtl" style="width: 80px"
                                        onkeydown="OnKeyDownInt(this),onkeydownEnterPersonCode()" onblur="OnBlurtxtPersonCode()"
                                        class="TxtControls" />
                                    <input id="txtPersonName" runat="server" name="txtPersonName" style="width: 99px"
                                        type="text" class="TxtControls" />
                                    <input id="btnRefreshPerson" class="CssHeaderStyle" onclick="onClickbtnRefreshPerson(this)"
                                        style="width: 25px; cursor: pointer; height: 22px" type="button" value="..." />
                                
                        </td>
                        <td id="TDSearchName">
                            
                        </td>
                        <td id="TDShiftText">
                            شيفت
                        </td>
                        <td id="TDShift">
                            
                                    <asp:DropDownList class="TxtControls" ID="cmbShift" runat="server" Width="120px"
                                        onchange="onchangeCmbShift()" onkeydown="onkeydownEnter()">
                                    </asp:DropDownList>
                                
                        </td>
                        <td id="TDGroupText">
                            گروه
                        </td>
                        <td id="TDGroup">
                            
                                    <asp:DropDownList class="TxtControls" ID="cmbGroup" runat="server" Width="120px"
                                        onchange="onchangecmbGroup()" onkeydown="onkeydownEnter()">
                                    </asp:DropDownList>
                                
                        </td>
                        <td id="TDCreditNeed">
                            <input type="checkbox" id="chkCreditNeed" runat="server" />افراد نيازمند مجوز
                        </td>
                        <td id="TDChildren">
                            <input type="checkbox" id="chkChildren" onclick="OnClickChkChildren(this)" checked="checked"
                                runat="server" />پرسنل زير مجموعه
                        </td>
                        <td id="TDManager">
                            <input type="checkbox" id="chkManager"   checked="checked"
                                runat="server" />مديران زير مجموعه
                        </td>
                        <%--<td id="TDDaftarTabl">
                            <input type="checkbox" id="ChkDaftarTabl" runat="server" />
                            پرسنل دفاتر تابل
                        </td>--%>
                        <td id="TDToPeriodText" style="display:none">
                            تا دوره
                        </td>
                        <td id="TDToPeriod" style="display:none">
                            <asp:DropDownList Width="120px" ID="CmbToPeriod" runat="server" class="TxtControls">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr valign="top">
            <td style="width: 100%" valign="top">
                <uc2:ToolBar ID="OToolBar" runat="server" PageName="MainMonthlyReport.aspx" PageID="1306" />
            </td>
        </tr>
        <tr valign="top" style="vertical-align:top">
            <td style="width: 2000px;vertical-align:top" valign="top">
                <table >
                    <tr style="vertical-align:top">
                        <td valign="top">
                            <div id="shadowMessage" style="border: 2px double #6593CF; display: inline; width: 209px;
                                height: 300px;">
                                <table>
                                    <tr>
                                        <td align="left" style="border: 2px double #6593CF; height: 8px; background-color: #74A0D8;">
                                            <img alt="بستن" align="left" style="display: inline" onclick="onclickImgClose()"
                                                id="imgClose" src="../../App_Utility/Images/close1.png" />
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td id="TDTree" valign="top">
                                            <div class="cssDiv" style="height: 330px; width: 260px;" id="Divtree">
                                                
                                                <ul id="treeDemo" class="ztree"></ul>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <td id="ttt" valign="top" align="center">                         
                            
                                 
                                     <div id="dPager" style="height:30px;text-align:right;background-color:#D3E2ED;border-width:1px;filter:progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ADC2E9, EndColorStr=#CDDAF1)">
                                        <table>
                                            <tr>
                                                <td id="TdGridSend" align="right">
                                                
                                                </td>
                                                <td id="TdGridPager" align="right">
                                                    <table>
                                                        <tr>
                                                            <td style="width:30px;">
                                                                <img id="BtnGridLast" title="آخرين" alt="آخرين" src="/TAPresentation/App_Utility/Images/Icons/active_last.gif" style="cursor:pointer;" />
                                                            </td>
                                                            <td style="width:30px;">
                                                                <img id="BtnGridNext" title="بعدي" alt="بعدي" src="/TAPresentation/App_Utility/Images/Icons/active_forward.gif" style="cursor:pointer;" />
                                                            </td>
                                                            <td>
                                                                <input id="TxtGridCurPage" type="text" title="صفحه جاري" style="text-align:center;border-style:solid;border-width:1px;border-color:#003366 #7EAACB #7EAACB #003366;background-color:#D3E2ED;width:40px;height:18px;font-weight:normal;font-size:12px;font-family:Tahoma;" onkeydown="OnKeyDownInt(this)" />
                                                            </td>
                                                            <td style="width:10px;color:#003366;">
                                                                از
                                                            </td>
                                                            <td style="width:40px;">
                                                                <input id="TxtGridTotalPage" type="text" title="تعداد كل صفحات" readonly="readonly" style="text-align:center;width:100%;background-color:transparent;border-width:0px;color:#003366;font-weight:normal;font-size:12px;font-family:Tahoma;" />
                                                            </td>
                                                            <td style="width:30px;">
                                                                <img id="BtnGridPrev" title="قبلي" alt="قبلي" src="/TAPresentation/App_Utility/Images/Icons/active_back.gif" style="cursor:pointer;" />
                                                            </td>
                                                            <td style="width:30px;">
                                                                <img id="BtnGridFirst" title="اولين" alt="اولين" src="/TAPresentation/App_Utility/Images/Icons/active_first.gif" style="cursor:pointer;" />
                                                            </td>
                                                            <td style="width:50px;">
                                                                <input id="TxtGridFromData" type="text" readonly="readonly" style="text-align:center;width:100%;border-width:0px;background-color:transparent;color:#003366;font-weight:normal;font-size:12px;font-family:Tahoma;" />
                                                            </td>
                                                            <td style="width:20px;color:#003366;">
                                                                تا
                                                            </td>
                                                            <td style="width:50px;">
                                                                <input id="TxtGridToData" type="text" readonly="readonly" style="text-align:center;width:100%;border-width:0px;background-color:transparent;color:#003366;font-weight:normal;font-size:12px;font-family:Tahoma;" />
                                                            </td>
                                                            <td style="width:20px;color:#003366;">
                                                                از
                                                            </td>
                                                            <td style="width:50px;">
                                                                <input id="TxtGridTotalData" type="text" readonly="readonly" style="text-align:center;width:100%;border-width:0px;background-color:transparent;color:#003366;font-weight:normal;font-size:12px;font-family:Tahoma;" />
                                                            </td>
                                                            
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td id="TdGridMessage" style="width:400px; color: Red;">
                                                            
                                                </td>
                                            </tr>
                                        </table>
                                        
                                     </div>
                                     <table id="GrdMontly" border="0" cellpadding="0" cellspacing="1">
                                        
                                        <thead id="ColumnHeader">
            
                                        </thead>
                                        <tbody id="ColumnData">
                                            
                                        </tbody>
                                        <tfoot id="ColumnFooter">
            
                                        </tfoot>
                                    </table>
                                    
                                    <div style="display: none">
                                        
                                    </div>
                                
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        
                <asp:HiddenField ID="txtXmlRowInfo" runat="server" />
                <asp:HiddenField ID="txtRDate" runat="server" />
                <asp:HiddenField ID="txtRPID" runat="server" />
            
          
                <asp:HiddenField ID="txtValidateBackup" runat="server" />
                <asp:HiddenField ID="txtAlertBackup" runat="server" />
        <asp:HiddenField ID="txtAlert" runat="server" />
        <asp:HiddenField ID="txtCurPage" runat="server" />
        <asp:HiddenField ID="Totalpage" runat="server" />
        <asp:HiddenField ID="txtMaxNumber" runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtDepartmentID" name="txtDepartmentID" runat="server" />    
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="BtnSubmit2" runat="server" Text="Button" OnClick="BtnSubmit2_Click" />
        <asp:Button ID="BtnSubmit3" runat="server" Text="Button" OnClick="BtnSubmit3_Click" />
        <asp:Button ID="BtnBackup" runat="server" Text="BtnBackup" OnClick="BtnBackup_Click" />
        <asp:Button ID="BtnSubmitSend" runat="server" Text="Button" OnClick="BtnSubmitSend_Click" />
        <asp:Button ID="ImgRefreshPersonSubmit" runat="server" OnClick="BtnSubmit_Click"/>
        <asp:Button ID="RefreshPersonGridSubmit" runat="server" OnClick="BtnSubmit_Click"/>
        <input type="text" id="txtRowPersonID" runat="server" />
        <input type="text" id="txtCmbGroup" name="txtCmbGroup" runat="server" />
        <input type="text" id="txtCmbShift" name="txtCmbShift" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyID" name="txtCompanyID" runat="server" />
        <input type="text" id="txtShowTre" runat="server" />
        <input type="text" id="txtAccessBtn" runat="server" />
        <input type="text" id="txtOnlineDepID" runat="server" />
        <input type="text" id="txtShowModal" runat="server" />
        <input type="text" id="txtSearchFlag" name="txtSearchFlag" runat="server" />
        <input type="text" id="txtXmlGridProperty" name="txtXmlGridProperty" runat="server" />
        <input type="text" id="txtXmlGridSetting" name="txtXmlGridSetting" runat="server" />
        <input type="text" id="txtXmlRptGetPersonelMonthlyReport" name="txtXmlRptGetPersonelMonthlyReport" runat="server" />
        <input type="text" id="txtValidate" runat="server" />
        <input type="text" id="txtAllowSend" runat="server" />
        <input type="text" id="txtNewWFO" runat="server" />
        <input type="text" id="txtOptionCmbPerson" runat="server" />
        <input type="text" id="txtShowWorkCartable" runat="server" />
        <input type="text" id="txtShowMonthlyChart" runat="server" />
        <input type="text" id="txtShowDocInfoNew" runat="server" />
        <input type="text" id="txtChkAccessDaftarTabl" runat="server" />
        <input type="text" id="txtIsPageLoad" runat="server" />
        <input type="text" id="txtPName" runat="server" />
        <input type="text" id="TxtXmlTree" runat="server" />
        <input type="text" id="TxtLKasr" runat="server" />
        <input type="text" id="TxtLMazad" runat="server" />
    </div>
   
   
    <cc3:ScriptCombiner ID="scriptCombiner" runat="server">
        <script language="javascript" type="text/javascript" src="../../App_Utility/PersianCalendar/scripts/PDate.js"></script>
        <script src="../../App_Utility/Scripts/XmlToJson/jquery.xml2json.js" type="text/javascript" language="javascript"></script>
        <script type="text/javascript" src="../../App_Utility/zTree/js/jquery.ztree.core-3.5.js"></script>
        <script type="text/javascript" src="../../App_Utility/Scripts/KasraJsGrid.js"></script>
        <script language="javascript" src='<%# scriptCombiner.ResolveUrl("../../App_Utility/Scripts/Reports/MainMonthlyReport.js")%>' type="text/javascript"></script>
    </cc3:ScriptCombiner> 
</asp:Content>
