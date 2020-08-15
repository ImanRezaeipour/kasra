<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Columns_Grid.aspx.cs" Inherits="FrmPresentation.App_Pages.PrintScreen.Columns_Grid" MasterPageFile="../../App_Utility/MasterPage/MasterBule.master" ValidateRequest ="false" %> 

<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register Src="../../App_Utility/Calendar/KCalendar.ascx" TagName="KCalendar" TagPrefix="uc2" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
 <link href="tabStyle.css" type="text/css" rel="stylesheet" />
<table style=" height: 503px;">
<tr>
<td  >
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                            </td></tr>
    <tr>
        <td align="right" valign="top" style="height:60%" class="style11">
            <table>
                <tr>
                    
                            
                            <td  valign="top" class="style9">
                                <table>
                                  <tr>
                                      <td  style="height:70%">
                                    <div style="height:409px">
                                    <ComponentArt:TabStrip id="TabStrip1"
                                      CssClass="TopGroup"
                                      SiteMapXmlFile="tabData.xml"
                                      DefaultItemLookId="DefaultTabLook"
                                      DefaultSelectedItemLookId="SelectedTabLook"
                                      DefaultDisabledItemLookId="DisabledTabLook"
                                      DefaultGroupTabSpacing="1"
                                      ImagesBaseUrl="images/"
                                      MultiPageId="MultiPage1"
                                      runat="server" ExpandDuration="100">
                                    <ItemLooks>
                                      <ComponentArt:ItemLook LookId="DefaultTabLook" CssClass="DefaultTab" HoverCssClass="DefaultTabHover" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="5" LabelPaddingBottom="0" LeftIconUrl="tab_right_icon.gif" RightIconUrl="tab_left_icon.gif" HoverLeftIconUrl="hover_tab_right_icon.gif" HoverRightIconUrl="hover_tab_left_icon.gif" LeftIconWidth="3" LeftIconHeight="21" RightIconWidth="3" RightIconHeight="21" />
                                      <ComponentArt:ItemLook LookId="SelectedTabLook" CssClass="SelectedTab" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="5" LabelPaddingBottom="0" LeftIconUrl="selected_tab_right_icon.gif" RightIconUrl="selected_tab_left_icon.gif" LeftIconWidth="3" LeftIconHeight="21" RightIconWidth="3" RightIconHeight="21" />
                                      <%-- <ComponentArt:ItemLook LookId="DefaultTabLook" CssClass="DefaultTab" HoverCssClass="DefaultTabHover" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="0" LabelPaddingBottom="4" LeftIconUrl="tab_left_icon.gif" RightIconUrl="tab_right_icon.gif" HoverLeftIconUrl="hover_tab_left_icon.gif" HoverRightIconUrl="hover_tab_right_icon.gif" LeftIconWidth="3" LeftIconHeight="21" RightIconWidth="3" RightIconHeight="21" />
                                      <ComponentArt:ItemLook LookId="SelectedTabLook" CssClass="SelectedTab" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="5" LabelPaddingBottom="0" LeftIconUrl="selected_tab_left_icon.gif" RightIconUrl="selected_tab_right_icon.gif" LeftIconWidth="3" LeftIconHeight="21" RightIconWidth="3" RightIconHeight="21" />--%>
                                      
                                    </ItemLooks>
                                    </ComponentArt:TabStrip>

                                    <ComponentArt:MultiPage id="MultiPage1" CssClass="MultiPage" runat="server">
                                    
                                      <ComponentArt:PageView ID="GridColTab" CssClass="PageContent" runat="server">
                                       <table cellspacing="0"  border="0" >
                                        <tr>
                                            <td>
                                                <table id="XTabTable_Header" style="DISPLAY:inline;width:500px">
                                                    <thead style="display: inline">
                                                        <tr>
                                                            <td id="RowTD" runat="server" class="CssHeaderStyle" style="width: 20px" align="center">
                                                                <input type="checkbox" id="HeaderChk" onclick="OnClickHeaderChk(this)" /></td>
                                                            <td class="CssHeaderStyle"  style="width: 50px" align="center">
                                                                — Ì»
                                                            </td>
                                                            <td class="CssHeaderStyle"  style="width: 120px" align="center">
                                                               ‰«„ ” Ê‰
                                                            </td>
                                                            <td class="CssHeaderStyle"  style="width: 220px" align="center">
                                                               ‰Ê⁄ ” Ê‰
                                                            </td>
                                                            <td class="CssHeaderStyle"  style="width: 50px" align="center">
                                                               ⁄—÷ 
                                                            </td>
                                                            <td class="CssHeaderStyle" align="center" style="width: 40px">
                                                                ”—Ã„⁄</td>
                                                            <td class="CssHeaderStyle" align="center" style="width: 40px">
                                                                ”Ê— </td>
                                                        </tr>
                                                    </thead>
                                                </table>
                                                 <div align="right" style="overflow: auto; width: 500px">
                                                <table  align="right"  width="500px" id="XTabTable">
                                                    <thead style="display: none">
                                                    </thead>
                                                </table>
                                            </div>
                                            </td>
                                        </tr>
                                       
                                        </table>
                                      </ComponentArt:PageView>
                                      
                                      <ComponentArt:PageView ID="FilterTab" CssClass="PageContent" runat="server">
                                        <table cellspacing="0" cellpadding="3" border="0">
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                         <td align="right" valign="top">
                                                              <select id="LCol" class='TxtControls' runat="server">
                                                                  <option></option>
                                                              </select> 
                                                          </td> 
                                                          <td align="right" valign="top">
                                                              <%--<asp:DropDownList ID="LOprator" runat="server">
                                                                 <asp:ListItem Value='='>„”«ÊÌ</asp:ListItem>
                                                                 <asp:ListItem Value='>'>»“—ê —</asp:ListItem>
                                                                 <asp:ListItem Value='>='>»“—ê — Ê „”«ÊÌ</asp:ListItem>
                                                                 <asp:ListItem Value='<'>òÊçò —</asp:ListItem>
                                                                 <asp:ListItem Value="<=">òÊçò — Ê „”«ÊÌ</asp:ListItem>
                                                                 <asp:ListItem Value="<>">„Œ«·›</asp:ListItem>
                                                              </asp:DropDownList>--%>
                                                             <select id="LOprator" class='TxtControls'>
                                                                  <option value="=<!--SearchVal-->">„”«ÊÌ</option>
                                                                  <option value=">=<!--SearchVal-->">»“—ê — Ê „”«ÊÌ</option>
                                                                  <option value="><!--SearchVal-->">»“—ê —</option>
                                                                  <option value="*<!--SearchVal-->">òÊçò —</option>
                                                                  <option value="**<!--SearchVal-->">òÊçò — Ê „”«ÊÌ</option>
                                                                  <option value="!=<!--SearchVal-->">„Œ«·›</option>
                                                              </select> 
                                                          </td>
                                                          <td align="right" valign="top"><input id="txtVal" class='TxtControls' type="text" /></td>
                                                          <td align="right" valign="top"><img id="ImgAddFilter" alt="«÷«›Â ò—œ‰ ›Ì· —" style="width:19px;height:21px" src="../../App_Utility/Images/Icons/Down.gif" class="CssIconUrl" onclick="OnClickImgAddFilter()" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                         
                                        </tr>
                                           <tr>
                                            <td align="right" valign="top">
                                              <div align="center"   style="overflow: auto;width:300px;height:300px">
                                               <table id="FilterTable_Hedear" style="DISPLAY:inline;width:298px">
                                                    <thead style="display: inline">
                                                        <tr>
                                                            <td class="CssHeaderStyle"  style="width: 109px" align="right">
                                                               ‰«„ ” Ê‰
                                                            </td>
                                                            <td class="CssHeaderStyle" align="center" style="width: 89px">
                                                                ⁄„·ê—</td>
                                                            <td class="CssHeaderStyle" align="center" style="width: 74px">
                                                                „ﬁœ«—</td>
                                                            <td class="CssHeaderStyle" align="center" style="width: 20px">
                                                                &nbsp;</td>
                                                        </tr>
                                                    </thead>
                                              </table>
                                              
                                                <table  align="right"  width="298px" id="FilterTable">
                                                    <thead style="display: none">
                                                    </thead>
                                                </table>
                                             </div>
                                                   
                                            </td>
                                        </tr>
                                        </table>
                                      </ComponentArt:PageView>

                                      <ComponentArt:PageView ID="ParamTab" CssClass="PageContent" runat="server">
                                        <table>
                                        <tr>
                                            <td>
                                                <div id="FilterDiv" style="DISPLAY:inline;" align="right">
                                                     <div id="DFilter" runat="server" align="right" style="overflow: auto; width: 452px; height: 377px">
                                                        <asp:Literal ID="litContent" runat="server">FilterCtrl</asp:Literal>
                                                     </div>
                                                </div>
                                           </td>
                                        </tr>
                                        </table>
                                        
                                      </ComponentArt:PageView>
                                    
                                      <ComponentArt:PageView ID="SettingTab" CssClass="PageContent" runat="server"> 
                                         <table cellspacing="0" cellpadding="3" border="0">
                                            <tr>
                                              <td align="right" class="PageContent" >
                                                    <table style="width: 100%; height: 100%">
                                                        <tr>
                                                            <td>
                                                                <table >
                                                                    <tr>
                                                                        <td width="30">
                                                                            <input id="chkPageNumber" runat="server" type="checkbox" /></td>
                                                                        <td align="right" width="120">
                                                                            ‘„«—Â ’›ÕÂ</td>
                                                                        <td width="200">
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="30">
                                                                            <input id="chkDate" runat="server" type="checkbox" /></td>
                                                                        <td align="right" width="120">
                                                                             «—ÌŒ</td>
                                                                        <td width="200">
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="30">
                                                                            <input id="chkRptSubject" runat="server" type="checkbox" /></td>
                                                                        <td align="right" width="120">
                                                                            ⁄‰Ê«‰ ê“«—‘</td>
                                                                        <td align="right" width="200">
                                                                            <input id="txtRptSubject" runat="server" style="width:200px" class="TxtControls" type="text" /></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td>
                                                                <img id="imgLogo" style="width:70px;height:70px;" alt="" src="../../App_Utility/Images/Icons/DefaultPic.png" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <table style="width: 100%; height: 100%">
                                                                    <tr>
                                                                        <td width="30">
                                                                            <input id="chkLogo" runat="server" type="checkbox" /></td>
                                                                        <td align="right" width="120">
                                                                            ¬—„</td>
                                                                        <td align="right" width="200">
                                                                            <input id="FileLogoBrowser" onchange="FileLogoOnChange(this)" class="TxtControls" style="width: 275px" 
                                                                                type="file" runat="server" /></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                     
                                              </td>
                                            </tr>
                                         </table>
                                        
                                      </ComponentArt:PageView>
                                      
                                    </ComponentArt:MultiPage>


                                    </div>
                                      </td>
                                  </tr> 
                                </table>
                            </td>
                           
                   
                </tr>
            </table>
            
        </td>
    </tr>
    <tr>
        <td align="right" valign="top"  style="height:40%">
                                 <input id="" onclick="onClickBtnSave()" type="button" class="CssBtnSave"
                                     />
                            
        </td>
    </tr>
   
</table>

  

   <div id="HidDiv" runat="server" style="DISPLAY: none">
   
            <input type="text" id="txtGridID" name="txtGridID" runat="server" />
            <input type="text" id="txtOnLineUserID" name="txtOnLineUserID" runat="server" />
            <input type="text" id="txtXmlColumns" name="txtXmlColumns" runat="server" />
            <input type="text" id="txtXmlParamVal" name="txtXmlParamVal" runat="server" />
            <input type="text" id="txtXmlColFilter" name="txtXmlColFilter" runat="server" />
            <input type="text" id="txtDepartmentID" name="txtDepartmentID" runat="server" />
            <input type="text" id="txtAllParamXml" name="txtAllParamXml" runat="server" />
            <input id="txtSubmit" type="text" runat="server" />
            <input type="text" id="txtRptParamXml" name="txtRptParamXml" runat="server" />
            <input type="text" id="txtCoulmnsGridXML" name="txtCoulmnsGridXML" runat="server" />
            <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
            <input type="text" id="SDate" name="SDate" runat="server" />
            <input type="text" id="EDate" name="EDate" runat="server" />
            <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
            <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server"  />
            <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
            <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server"/>
            <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server"/>
            <input type="text" id="txtSortDirection" enableviewstate="true"  name="txtSortDirection" runat="server"/>
            <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression" runat="server"/>
            <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server"  />
            <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server"  />
            <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
            <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" onclick="BtnSubmit_Click" />
            <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
            <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID" runat="server" />     
           <select id="HidLcombo" runat="server" class='TxtControls'>
               <option></option>
           </select>
<input type="text" id="txtReportID" runat="server" />
           <input type="text" id="txtReportName" runat="server" />
           <input type="text" id="txtStoredProc" runat="server" />
           <input type="text" id="txtDesc" runat="server" />
           <input type="text" id="txtTree" runat="server" />
        </div>

 <script language="javascript" type="text/javascript">
     var MasterObj = "ctl00_ContentPlaceHolder1_";
     var LastSelectedRow = "";
     var LastSelectedRowClass = "";

     Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
     Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

     function BeginRequestHandler(sender, args) {
         
     }

     function EndRequestHandler(sender, args) {
         
         var StrVal = $get(MasterObj + "txtSubmit").value
         if (StrVal != "") {
            
         }
         $get(MasterObj + "txtSubmit").value = "";
     }  


    </script>

 <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>
 <script type="text/javascript" language="javascript">
     var MasterObj = "ctl00_ContentPlaceHolder1_";
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     var LastSelectedRow = null;
     var LastSelectedRowClass = "";
     //var MasterObj = "ctl00_ContentPlaceHolder1_";
     var lastPersonCode = "";
     var lastPersonCodeModify = "";
     var newrowindex = 0
     var newrowindexFilterTable = 0
     var xmlStr = "";

     window.name = "Columns_Grid"
     aspnetForm.target = "Columns_Grid"
     ////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!OnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     FillTabTable()
     CreateLcomboItems()
     //**********************************EndToolbar*************************************
     //Fill Client Grid---CoulmnsGrid
     function FillTabTable() {
        
             root = '/BaseInfoEntity/Column'
             var strColXML = document.getElementById(MasterObj + "txtCoulmnsGridXML").value
             alert(strColXML)
             var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
             if (strColXML == "")
                 strColXML = "<BaseInfoEntity></BaseInfoEntity>"
             xmlDoc.loadXML(strColXML);
             xmlDoc.setProperty("SelectionLanguage", "XPath")
             //var xmlNodes = xmlDoc.documentElement.selectNodes(root + '[Viewable=1]')
             var xmlNodes = xmlDoc.documentElement.selectNodes(root)
             var x = 0
             if (xmlNodes.length != 0) {
                 for (; x < xmlNodes.length; ++x) {
                     //Param = '"' + xmlNodes.item(x).selectSingleNode('ColTitle').text + '"#'
                     AddRow(XTabTable, xmlNodes.item(x).selectSingleNode('Chk').text, xmlNodes.item(x).selectSingleNode('Intval').text, xmlNodes.item(x).selectSingleNode('CodeName').text, xmlNodes.item(x).selectSingleNode('CodeFormat').text, xmlNodes.item(x).selectSingleNode('Width').text, xmlNodes.item(x).selectSingleNode('issum').text, xmlNodes.item(x).selectSingleNode('Sort').text, xmlNodes.item(x).selectSingleNode('CodeID').text, x + 1)
                 } 
             }
     }
     //___________________________________________AddRow Client Grid______________________________________________________
     function AddRow(oGrid, Chk, Intval, CodeName, CodeFormat, Width, issum, Sort, CodeID, cntRow) {

             var cell=0
             oGrid.insertRow()
             oGrid.rows(newrowindex).className = "XItemStyle"
             oGrid.rows(newrowindex).setAttribute("CodeID", CodeID)

             oGrid.rows(newrowindex).insertCell()
             oGrid.rows(newrowindex).insertCell()
             oGrid.rows(newrowindex).insertCell()
             oGrid.rows(newrowindex).insertCell()
             oGrid.rows(newrowindex).insertCell()
             oGrid.rows(newrowindex).insertCell()
             oGrid.rows(newrowindex).insertCell()
             
             if (Chk==1)
                 oGrid.rows(newrowindex).cells(0).innerHTML = "<input type='checkbox' checked onclick='OnClickchk(this)'/>"
             else
                 oGrid.rows(newrowindex).cells(0).innerHTML = "<input type='checkbox' onclick='OnClickchk(this)'/>"

             oGrid.rows(newrowindex).cells(1).innerHTML = "<input style='width: 35px' type='text' value='" + Intval + "' />"

             if (CodeName.length > 20)
                 oGrid.rows(newrowindex).cells(2).innerText = CodeName.substr(0, 20) + '...'
             else
                 oGrid.rows(newrowindex).cells(2).innerText = CodeName.substr(0, 20)

             oGrid.rows(newrowindex).cells(3).innerHTML = "<input type='radio' name='CodeFormat" + newrowindex + "' /> ”«⁄ Ì<input type='radio' name='CodeFormat" + newrowindex + "' /> —Ê“«‰Â<input type='radio' name='CodeFormat" + newrowindex + "' /> ŒÊœò«—"

             oGrid.rows(newrowindex).cells(4).innerHTML = "<input type='text' style='width: 35px' value='" + Width + "' />"
             
//             if (IsSum == 1)
//                 oGrid.rows(newrowindex).cells(cell).innerHTML = "<input type='checkbox' onclick='OnClickIsSumChk(this)'/>"
//             else
                 oGrid.rows(newrowindex).cells(5).innerHTML = " " 
            
            if (Sort==1)
                oGrid.rows(newrowindex).cells(6).innerHTML = "<input type='radio' name='Sort' checked />"
            else
                oGrid.rows(newrowindex).cells(6).innerHTML = "<input type='radio' name='Sort' />"                
                         		
             oGrid.rows(newrowindex).align="center"
             oGrid.rows(newrowindex).cells(0).style.width="20px"
             oGrid.rows(newrowindex).cells(1).style.width = "50px"
             oGrid.rows(newrowindex).cells(2).style.width = "110px"
             oGrid.rows(newrowindex).cells(3).style.width = "200px"
             oGrid.rows(newrowindex).cells(4).style.width = "45px"
             oGrid.rows(newrowindex).cells(5).style.width = "45px"
             oGrid.rows(newrowindex).cells(6).style.width = "40px"
             newrowindex=newrowindex+1
           	
       }
     //___________________chk Client Grid______________________________________________________
     function OnClickchk(obj) {
         try {
             var LoadXmlStr = "";
             var oRow = obj.parentElement.parentElement
             var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
             oXmlDoc.async = "false";
             if (xmlStr == "")
                 LoadXmlStr = "<Root></Root>"
             else
                 LoadXmlStr = "<Root>" + xmlStr + "</Root>"
             oXmlDoc.loadXML(LoadXmlStr)
             var xmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Col[ID=" + oRow.GSetID + "]");
             if (xmlNodes.length != 0) {
                 if (obj.checked)
                     xmlNodes.item(0).selectSingleNode('Selected').text = 1
                 else
                     xmlNodes.item(0).selectSingleNode('Selected').text = 0

                 xmlStr = oXmlDoc.xml
                 xmlStr = xmlStr.replace('</Root>', '')
                 xmlStr = xmlStr.replace('<Root>', '')
             }
             else {

                 xmlStr += "<Col>"
                 xmlStr += "<ID>" + oRow.GSetID + "</ID>"
                 xmlStr += "<ColName>" + oRow.ColName + "</ColName>"
                 if (obj.checked)
                     xmlStr += "<Selected>1</Selected>"
                 else
                     xmlStr += "<Selected>0</Selected>"
                 if (document.getElementById("Xtabtable").rows(oRow.rowIndex).cells(2).firstChild.checked == true)
                     xmlStr += "<IsSum>1</IsSum>"
                 else
                     xmlStr += "<IsSum>0</IsSum>"
                 xmlStr += "</Col>"


             }
             document.getElementById(MasterObj + "txtXmlColumns").value = xmlStr
         }
         catch (e) {
             alert('«ÿ·«⁄«  ‰«œ—”  «” ')
         }	
        }
        //_________________________________________________________________________________________________________
        function OnClickIsSumChk(obj) {
            try{
                var LoadXmlStr = "";
                var oRow = obj.parentElement.parentElement
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                if (xmlStr == "")
                    LoadXmlStr = "<Root></Root>"
                else
                    LoadXmlStr = "<Root>" + xmlStr + "</Root>"
                oXmlDoc.loadXML(LoadXmlStr)
                var xmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Col[ID=" + oRow.GSetID + "]");
                if (xmlNodes.length != 0) {
                    if (obj.checked)
                        xmlNodes.item(0).selectSingleNode('IsSum').text = 1
                    else
                        xmlNodes.item(0).selectSingleNode('IsSum').text = 0

                    xmlStr = oXmlDoc.xml
                    xmlStr = xmlStr.replace('</Root>', '')
                    xmlStr = xmlStr.replace('<Root>', '')
                }
                else {
                    xmlStr += "<Col>"
                    xmlStr += "<ID>" + oRow.GSetID + "</ID>"
                    xmlStr += "<ColName>" + oRow.ColName + "</ColName>"
                    if (document.getElementById("Xtabtable").rows(oRow.rowIndex).cells(0).firstChild.checked == true)
                        xmlStr += "<Selected>1</Selected>"
                    else
                        xmlStr += "<Selected>0</Selected>"
                    
                    if (obj.checked)
                        xmlStr += "<IsSum>1</IsSum>"
                    else
                        xmlStr += "<IsSum>0</IsSum>"
                    xmlStr += "</Col>"
                }
             }
             catch (e) {
                 alert('«ÿ·«⁄«  ‰«œ—”  «” ')
             }
         }
         //_________________________________________________________________________________________________________
         function onClickColTabTD() {
             FilterDiv.style.display = "none"
             ColDiv.style.display = "inline"
             SettingDiv.style.display = "none"
         }
         //_________________________________________________________________________________________________________
         function onClickFilterTabTD() {
             FilterDiv.style.display = "inline"
             ColDiv.style.display = "none"
             SettingDiv.style.display = "none"
         }
         //_________________________________________________________________________________________________________
         function onClickSettingTabTD() {
             FilterDiv.style.display = "none"
             ColDiv.style.display = "none"
             SettingDiv.style.display = "inline"
         }
         //_________________________________________________________________________________________________________
         function CreateLcomboItems() {
            //try{
                 var root = '/BaseInfoEntity/RptParam'
                 var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
                 var xmlNodes;
                 var optionEl;
                 var j;
                 var TmpLcomboID = ""
                 //alert(document.getElementById(MasterObj + "txtAllParamXml").value)
                 var strLcomboItemsXML = document.getElementById(MasterObj + "txtAllParamXml").value
                 if (strLcomboItemsXML == "")
                     strLcomboItemsXML = "<BaseInfoEntity></BaseInfoEntity>"
                 xmlDoc.loadXML(strLcomboItemsXML);
                 xmlNodes = xmlDoc.documentElement.selectNodes(root + "[CtrlTypeID=5]");
                 //alert(xmlNodes.length)
                 if (xmlNodes.length != 0) {
                     for (i = 0; i < xmlNodes.length; i++) {
                         
                         LcomboID = 'L' + xmlNodes.item(i).selectSingleNode('Name').text
                         TmpLcomboID = 'TmpL' + xmlNodes.item(i).selectSingleNode('Name').text
                         TDLCombo = 'TD' + xmlNodes.item(i).selectSingleNode('Name').text
                         //alert(document.getElementById(MasterObj + TmpLcomboID))
                         //alert(document.getElementById(MasterObj + TmpLcomboID).innerHTML)
                         //alert(LcomboID)
                         var s = "<select style='width: 100%;' class='TxtControls' id='" + LcomboID + "'>" + document.getElementById(MasterObj + TmpLcomboID).innerHTML + "</select>"
                         document.getElementById(TDLCombo).innerHTML = s                   
                     }
                 }
//             }
//             catch (e) {
//                 alert('«ÿ·«⁄«  ‰«œ—”  «” ')
//             }	
         }
         //________________________________________________________________________________________________________________
         function EnterKey() {
             if (event.keyCode == 13) {
                 onClickBtnSave()
             }
         }
         //________________________________________________________________________________________________________________
         function onClickBtnSave() {
                var XmlParamVal = ""
                XmlParamVal += "<Root>"
                XmlParamVal += "<MenuItem>"
                XmlParamVal += "<MenuItemID>" + $get(MasterObj + "txtReportName").value + "<MenuItemID>"
                XmlParamVal += "<Name>"+$get(MasterObj + "txtReportName").value+"<Name>"
                XmlParamVal += "</MenuItem>"
                XmlParamVal += "</Root>"
         }
         //________________________________________________________________________________________________________________
         function onClickBtnPrint() {
            try{
                 document.getElementById(MasterObj + "txtXmlColumns").value = xmlStr
                //Create Param-------------------------------------------------------------------------------------
                 var root = '/BaseInfoEntity/RptParam'
                 var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
                 var LoadXmlParam = document.getElementById(MasterObj + "txtAllParamXml").value
                 if (LoadXmlParam == "")
                     LoadXmlParam = "<BaseInfoEntity></BaseInfoEntity>"
                 xmlDoc.loadXML(LoadXmlParam);
                 xmlDoc.setProperty("SelectionLanguage", "XPath")
                 var xmlNodes = xmlDoc.documentElement.selectNodes(root)
                 var x = 0
                 var XmlParamVal = "";
                 XmlParamVal += "<Root>"
                 var oCtrlID = "";
                 var chkFlag = 0;
                 if (xmlNodes.length != 0) {
                     for (var i = 0; i < xmlNodes.length; i++) {
                         XmlParamVal += "<Tb>"
                         XmlParamVal += "<ParamName>" + xmlNodes.item(i).selectSingleNode('Name').text + "</ParamName>"
                         switch (xmlNodes.item(i).selectSingleNode('CtrlTypeID').text) {
                             case "0":  //DefaultVal
                                 XmlParamVal += "<ParamVal>" + xmlNodes.item(i).selectSingleNode('Default').text + "</ParamVal>"
                                 XmlParamVal += "<Flag>0</Flag>"
                                 break;
                             case "1": //‘„«—Â Å—”‰·Ì
                                 oCtrlID = 'txt' + xmlNodes.item(i).selectSingleNode('Name').text
                                 XmlParamVal += "<ParamVal>" + ((document.getElementById(oCtrlID).value == "") ? "0" : document.getElementById(oCtrlID).value) + "</ParamVal>"
                                 XmlParamVal += "<Flag>0</Flag>"
                                 break;
                             case "2": //Date
                                 oCtrlID = 'txt' + xmlNodes.item(i).selectSingleNode('Name').text
                                 var DateVal = document.getElementById(oCtrlID).value
                                 var Day = DateVal.substr(0, 2)
                                 var Month = DateVal.substr(3, 2)
                                 var Year = DateVal.substr(6, 4)
                                 var Date = Year + "/" + Month + "/" + Day
                                 if (Date == "//")
                                     Date = ""
                                 XmlParamVal += "<ParamVal>'" + Date + "'</ParamVal>"
                                 XmlParamVal += "<Flag>0</Flag>"
                                 break;
                             case "3": //Hidden Control in Page exept OnLinUserID
                                 oCtrlID = 'txt' + xmlNodes.item(i).selectSingleNode('Name').text
                                 XmlParamVal += "<ParamVal>" + document.getElementById(MasterObj + oCtrlID).value + "</ParamVal>"
                                 XmlParamVal += "<Flag>0</Flag>"
                                 break;
                             case "4":  //XmlColumns
                                 XmlParamVal += "<ParamVal>" + xmlNodes.item(i).selectSingleNode('Default').text + "</ParamVal>"
                                 XmlParamVal += "<Flag>1</Flag>"
                                 break;
                             case "5": //LCombo
                                 oCtrlID = 'L' + xmlNodes.item(i).selectSingleNode('Name').text
                                 XmlParamVal += "<ParamVal>" + document.getElementById(oCtrlID).value + "</ParamVal>"
                                 XmlParamVal += "<Flag>0</Flag>"
                                 break;
                             case "6": //Checkbox
                                 oCtrlID = 'Chk' + xmlNodes.item(i).selectSingleNode('Name').text
                                 if (document.getElementById(oCtrlID).checked == false)
                                     chkFlag = 0
                                 else if (document.getElementById(oCtrlID).checked == true)
                                     chkFlag=1
                                 XmlParamVal += "<ParamVal>" + chkFlag + "</ParamVal>"
                                 XmlParamVal += "<Flag>0</Flag>"
                                 break;
                             case "7": //Hidden Control OnLineUser
                                 oCtrlID = 'txtOnLineUserID'
                                 XmlParamVal += "<ParamVal>" + document.getElementById(MasterObj + oCtrlID).value + "</ParamVal>"
                                 XmlParamVal += "<Flag>0</Flag>"
                                 break;
                                 break;

                         }
                         XmlParamVal += "</Tb>"
                     }
                 }
                 XmlParamVal += "</Root>"
                 document.getElementById(MasterObj + "txtXmlParamVal").value = XmlParamVal
                 //End Create Param-------------------------------------------------------------------------------------
                 //Create Filter Xml
                 /*
                 <Root>
		            <ColFilterTb>
			            <GSetID></GSetID>
			            <Oprator></Oprator>
			            <ValFilter></ValFilter>
		            </ColFilterTb>
	            </Root>
	            */
	             var x = 0
	             var XmlFilterVal = "<Root>"
	             //var XmlFilterVal = ""
                 for (; x < FilterTable.rows.length; ++x) {
                     XmlFilterVal+="<ColFilterTb>"
                     XmlFilterVal += "<GSetID>" + FilterTable.rows(x).GSetID + "</GSetID>"
                     //replace('<!--SearchVal-->', '')
                     XmlFilterVal += "<Oprator>" + FilterTable.rows(x).Oprator.replace('<!--SearchVal-->', '') + "</Oprator>"
                     XmlFilterVal += "<ValFilter>" + FilterTable.rows(x).cells(2).innerText + "</ValFilter>"
                     XmlFilterVal+="</ColFilterTb>"
                 }
                 XmlFilterVal+="</Root>"

                 document.getElementById(MasterObj + "txtXmlColFilter").value = XmlFilterVal
                 //alert(document.getElementById(MasterObj + "txtXmlColFilter").value)
                 
    		     //alert(document.getElementById(MasterObj + "txtXmlColumns").value)
                 //End Create Filter Xml
                 document.getElementById(MasterObj + "txtSubmit").value = "Print";
                document.getElementById(MasterObj + "BtnSubmit").click();
             }
             catch(e)
		     {
			    alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		     }
		 }
		 //______________________________________________________________________________________________________________________
		 function OnClickImgAddFilter() {

		     //LCol LOprator txtVal
		     //$get(MasterObj + "cmbBaudRate").options[$get(MasterObj + "LCol").selectedIndex].text
		     //try {

		         var x = 0
		         for (; x < FilterTable.rows.length; ++x) {
		             if ($get(MasterObj + "LCol").value == FilterTable.rows(x).GSetID) {
		                 alert("” Ê‰ «‰ Œ«»Ì œ«—«Ì ›Ì· — «” .«„ò«‰ «‰ Œ«» »Ì‘ «“ Ìò ›Ì· — —ÊÌ Ìò ” Ê‰ ÊÃÊœ ‰œ«—œ")
		                 return;
		             }
		         }
    		         
		         var cell = 0
		         FilterTable.insertRow()
		         FilterTable.rows(newrowindexFilterTable).className = "XItemStyle"
		         FilterTable.rows(newrowindexFilterTable).setAttribute("GSetID", $get(MasterObj + "LCol").value)
		         //replace('<!--SearchVal-->', '')
		         //alert($get("LOprator").value.replace("<!--SearchVal-->",""))
		         FilterTable.rows(newrowindexFilterTable).setAttribute("Oprator", $get("LOprator").value)
		         
		         FilterTable.rows(newrowindexFilterTable).insertCell()
		         FilterTable.rows(newrowindexFilterTable).cells(cell).innerText = $get(MasterObj+"LCol").options[$get(MasterObj+"LCol").selectedIndex].text //"ò”—Õ÷Ê—"
		         cell = cell + 1
		         FilterTable.rows(newrowindexFilterTable).insertCell()
		         FilterTable.rows(newrowindexFilterTable).cells(cell).innerText = $get("LOprator").options[$get("LOprator").selectedIndex].text //"»“—ê —"
		         cell = cell + 1
		         FilterTable.rows(newrowindexFilterTable).insertCell()
		         FilterTable.rows(newrowindexFilterTable).cells(cell).innerText = document.getElementById("txtVal").value //"100"

		         cell = cell + 1
		         FilterTable.rows(newrowindexFilterTable).insertCell()
		         FilterTable.rows(newrowindexFilterTable).cells(cell).innerHTML = "<img alt='Õ–› ›Ì· —' style='width:19px;height:21px' src='../../App_Utility/Images/Icons/Cross.gif' class='CssIconUrl' onclick='OnClickImgDelFilter(this)' />"    				

		         FilterTable.rows(newrowindexFilterTable).align = "center"
		         FilterTable.rows(newrowindexFilterTable).cells(0).style.width = "112px"
		         FilterTable.rows(newrowindexFilterTable).cells(1).style.width = "90px"
		         FilterTable.rows(newrowindexFilterTable).cells(2).style.width = "76px"
		         FilterTable.rows(newrowindexFilterTable).cells(3).style.width = "20px"
		         newrowindexFilterTable = newrowindexFilterTable + 1
//		     }
//		     catch (e) {
//		         alert('Œÿ«')
//		     }	

		 }
		 ////__________________________________________________________________________________________----
		 function OnClickImgDelFilter(obj) {
		     var oRow = obj.parentElement.parentElement
		     FilterTable.deleteRow(oRow.rowIndex)
		     newrowindexFilterTable = newrowindexFilterTable - 1
		 }

		 //------------------------------------------------------------------------------------------------

		 function FileLogoOnChange(obj) {

		     if (obj.value != "") {
		         document.getElementById("imgLogo").src = obj.value
		     }
		     else {
		         document.getElementById("imgLogo").src = "../../App_Utility/Images/Icons/DefaultPic.png"
		     }
		     
		 }

 </script>
 <script language="vbscript">
		dim century
		century="13"
		function test(val)
			MsgBox(val)
		end function
		'********************
		function datechk()
			dim val
			val=replace(window.event.srcElement.value," ","",1,-1,1)
			
		
'			 Dim Day
'			 Day = val.substr(8, 2)
'			 Dim Month
'			 Month = val.substr(5, 2)
'             Dim Year
'             Year = val.substr(0, 4)
'             alert(Day+"/"+Month+"/"+Year)
'             val=Day+"/"+Month+"/"+Year
'        
'			alert(val)
			if (not (val=""))and(not Isvaliddate(val)) then
 			Dim strQuestion, intReturn
			strQuestion="  ! ·ÿ›« œ—«Ì‰ ﬁ”„   «—ÌŒ ‘„”Ì ’ÕÌÕ Ê«—œ ﬂ‰Ìœ"
			strQuestion=MsgBox(strQuestion, 0, " «—ÌŒ ‘„”Ì «‘ »«Â ")
			window.event.srcElement.focus()
			window.event.returnvalue=false
			else
			if val<>"" then
				dim arr
				arr=split(val,"/",-1,0)
				if arr(2)<100  then  
					century="13"
				else	  
					century=""
				end if
				val=right("0" & arr(1),2) & "/" & century & arr(2)
				val=right("0" & arr(0),2) & "/" & val  
				window.event.srcElement.value=val
			end if
			end if
		end function
		'********************
		function isshleap (sal)
		dim ybase_sh,L1

			if sal<100   then  
				sal=sal+1300
			end if
		      
			ybase_sh=int((sal-125)/ 99)*99+125
		      
			L1=((sal-ybase_sh) mod 99)
			if (L1>=98) then
				isshleap=(((L1-89) mod 4 )=0)
			else
				if (L1 >=61) then
						isshleap=(((L1-62) mod 4)=0)
				else 
					if L1 >=28 then
						isshleap=(((L1-29) mod 4)=0)
					else 
						isshleap=((L1 MOD 4)=0)
					end if
				end if
			end if

		END function

		'********************************************
		function Isvaliddate(txt)
		dim   le,t1,t2,sal,mah,roz,arr
		  
		arr=split(txt,"/",-1,0)
		if ubound(arr)=2 then
			roz=cint("0" & arr(0))
   				mah=cint("0" & arr(1))
 				sal=cint("0" & arr(2))
		        
			le=0
			if sal<100   then 
				sal=sal+1300
			end if
		        
			if isshleap(sal)then 
				le=1 
			end if 
		        
			t1= (mah>=1) and (mah<=12)
			t2= (roz>=1) and (roz<=29+le)
			t2= t2 or ((roz=30) and ((mah>=1) and ( mah<=11)))
			t2= t2 or ((roz=31)and((mah>=1) and ( mah<=6 )))

			Isvaliddate= (t1 and t2)
		else
			Isvaliddate=false
		end if
		end function
		'****************************

		function mi2sh(Mdate)
		dim   roz 
		if  isdate(mdate) then
				roz=(mdate - #22 March 1935#)
				Mi2sh=IntEndSHD(roz)
		else
				mi2sh=""
		end if
		end function
		'*********************
		function IntEndSHD(roz)
		dim   leap,Esal,sal,mahbase,tag 

				sal=0  :   mah =0  :   leap=0 :  tag=0  : Esal=0

				do while roz<00000  :roz=roz+36159 :sal=sal-99 :loop
				do while roz>36158  :roz=roz-36159 :sal=sal+99 :loop

				select case roz
					case 10591 '{1342/12/30} :roz=365  :sal=sal+1342
					case 22644 '{1375/12/30} :roz=365  :sal=sal+1375
					case 36158 '{1412/12/30} :roz=365  :sal=sal+1412
					case else
        			if (roz>=00000) and (roz<=10225) then
						tag=1  :Esal=0  :base=00000 
						end if
			
					if (roz>=10226) and (roz<=10590) then
						tag=2 :Esal=1  :base=10226 
						end if

					if (roz>=10592) and (roz<=22278) then
        				tag=3 :Esal=1  :base=10592 
						end if
		          
					if (roz>=22279) and (roz<=22643) then
        				tag=4 :Esal=2  :base=22279 
						end if

					if (roz>=22645) and (roz<=35792) then
        				tag=5 :Esal=2 :base=22645  
						end if

					if (roz>=35793) and (roz<=36157) then
        				tag=6 :Esal=3 :base=35793  
						end if
			end select

			if ((tag mod 2)=1 ) and ( ((roz-base+1) mod 1461 )=0 ) then
				roz=roz-1 :leap=1
			end if

			if tag>0 then
				roz=roz-Esal*365 
				roz=roz-int(roz / 1461)
				sal=Esal+sal+ int(roz / 365)+1314
       			roz=roz mod 365+leap
			end if

			if roz>=186 then
				roz=roz-186  :mah=6+int(roz / 30) :roz=roz mod 30
			else
				mah=int(roz / 31) :roz=roz mod 31
			end if
		       
			IntEndSHD=cstr(sal)+"/"+right("0"&(mah+1),2)+"/"+right("0"&(roz+1),2)
		end function
		'*************************************************
		function SHDEndInt(shd)
		dim  sal,mah,roz,Tr,arr
		      
		arr=split(shd,"/",-1,1)
		if ubound(arr)=2 then
			sal=cint(arr(0)) 
			mah=cint(arr(1))-1
			roz=cint(arr(2))-1
			Tr=0
		      
			if sal <100 then sal=1300+sal end if
			sal=sal-1314

			do while sal<0  :  tr=tr-36159-366 : sal=sal+100 : loop
			do while sal>98 :  Tr=Tr+36159     : sal=sal-99  : loop
		      

			if (sal>=0 and sal<=27)  then   Tr=Tr+sal*365+(sal\4)      end if
			if (sal>=28 and sal<=60) then   Tr=Tr+sal*365+((sal-1)\ 4) end if
			if (sal>=61 and sal<=97) then   Tr=Tr+sal*365+((sal-2)\ 4) end if
			if  (sal=98)             then   Tr=Tr+sal*365+((sal-3)\ 4) end if
		      
			if mah>6 then
				Tr=Tr+(mah-6)*30+186
			else 
				Tr=Tr+mah*31
			end if

			SHDEndInt=Tr+roz
		else
			alert("«‘ﬂ«· œ—  «—ÌŒ ‘„”Ì")
			SHDEndInt=0
		end if
		end function
		'*******************************
		function Between(date1,date2)
		between=SHDEndInt(date2)-SHDEndInt(date1)+1
		end function
		'*******************************
		function shdAdd(Sdate,days)
		days=cint(days)
		if days<>0 then 
				shdAdd=IntEndSHD(SHDEndInt(cstr(Sdate))+days)
		else
				shdAdd=Sdate
		end if
		end function
		'*******************************
		</script>
 
 
</asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

    <style type="text/css">
        #Table1
        {
            width: 458px;
            height: 411px;
        }
        #XTabTable_Header
        {
            width: 176px;
        }
        #btnPrin
        {
            width: 75px;
        }
        .style8
        {
            width: 399px;
        }
        .style9
        {
            width: 665px;
            height: 413px;
        }
        .style10
        {
            width: 93px;
        }
        .style11
        {
            height: 320px;
        }
        .style12
        {
            height: 413px;
        }
        .style13
        {
            width: 70%;
            height: 413px;
        }
        .style14
        {
            width: 10%;
            height: 413px;
        }
        .style15
        {
            height: 427px;
        }
        .style16
        {
            height: 427px;
            width: 448px;
        }
        .style17
        {
        }
        #File1
        {
            width: 326px;
        }
        </style>

</asp:Content>



