<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefinePublicAccess.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.DefinePublicAccess" MasterPageFile="../../App_Utility/MasterPage/MasterBule.master" ValidateRequest="false"%>

<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <script language="javascript" src="../../App_Utility/Scripts/General.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        /////-------------------------------------------
    </script>
     <table>
        <tr>
            <td valign="top" align="right" >
            
                <table style="height: 499px; width: 709px;">
                    <tr>
                        <td valign="top" style="height: 16px" >
                         
                            <uc1:ToolBar ID="OToolBar" runat="server" PageName="DefinePublicAccess.aspx" 
                                PageID="1122" />
                         
                         <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="false" ScriptMode="Release"></asp:ScriptManager>
                         <script type="text/javascript" language="javascript">
                             Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                             Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                             function BeginRequestHandler(sender, args) {
                                 //if (args.get_postBackElement().id == "ctl00_ContentPlaceHolder1_BtnSubmit")
                                 document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                             }

                             function EndRequestHandler(sender, args) {
                                document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                                 
                                 var StrVal = $get(MasterObj + "txtSubmit").value
                                 $get(MasterObj + "txtAlert").value = StrVal
                                 var oGrid1 = document.getElementById("GrdPublicAccess")

                                 if (oGrid1 != null)
                                     for (var j = 0; j < oGrid1.rows.length; ++j) {
                                     if (oGrid1.rows(j).getAttribute('MainRowID') == 0) {
                                         oGrid1.rows(j).style.display = "none"

                                     }
                                 }
                                 //if (StrVal == "BtnNext" | StrVal == "BtnPrev" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const") {
                                 
                                 if (StrVal == "SaveGroupView") {
                                     $get(MasterObj + "txtAlert").value = "Modify"
                                     SetMsg($get(MasterObj + "txtAlert").value);
                                     PopupGridView.style.display = "none"
                                 }
                                 else if (StrVal == "Delete") {
                                 if ($get(MasterObj + "txtAlert").value != "")
                                     SetMsg($get(MasterObj + "txtAlert").value);
                                 }
                                 else if (StrVal == "Save") {
                                    if ($get(MasterObj + "txtAlert").value != "")
                                        SetMsg($get(MasterObj + "txtAlert").value);
                                 }
                                 else if (StrVal == "Search") {
                                    PopupSearch.style.display = "none";
                                    LastSelectedRow = '';
                                 }
                                 $get(MasterObj + "txtSubmit").value = "";
                             }
                            </script>
                         </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">    
                            
                                <ContentTemplate>                  
                                    <asp:placeholder id="GridViewPlaceHolder" runat="Server"/>
                                    
                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                    <asp:HiddenField ID="txtPersonCode" runat="server" />
                                   
                                    <asp:HiddenField ID="txtPageSize" runat="server" />
                                    <asp:HiddenField ID="lblTo" runat="server" />
                                    <asp:HiddenField ID="lblFrom" runat="server" />
                                    <asp:HiddenField ID="lblTotal" runat="server" />
                                    <asp:HiddenField ID="txtAccessId" runat="server" />
                                   <asp:HiddenField ID="CurPage" runat="server" />
                                    <asp:HiddenField ID="Totalpage" runat="server" />
                                </ContentTemplate>
                                
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                    
                            </asp:UpdatePanel> 
                             
                        </td>
                    </tr>
                  
                </table>
               
              
                
                
                <div style="DISPLAY: none">
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
                    <input type="text" id="txtXMLGroupView" name="txtGroupView" runat="server" />
                    <input type="text" id="txtXMLModify" name="txtGroupView" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" onclick="BtnSubmit_Click" />
                </div>
                
            </td>
        </tr>
      </table>
      <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>
      <script language="javascript">
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Declaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          var GroupID = '0';
          var LastSelectedRow = null;
          var LastSelectedRowClass = "";
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndDeclaration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!doOnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          var oGrid1 = document.getElementById("GrdPublicAccess")
          
          if (oGrid1!=null )
              for (var j = 0; j < oGrid1.rows.length; ++j) {
                  if (oGrid1.rows(j).getAttribute('MainRowID') == 0) {
                      oGrid1.rows(j).style.display = "none"
                      
                  }
              }
          
//          document.getElementById('OToolBar_BtnPrv').disabled = true;
//          document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
//          document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
//          document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
//          document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "CurPage").value;
//          document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;

          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!ToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnBlurtxtCurPage() {
              var TotalPage = parseInt($get(MasterObj + "lblTotal").value) / parseInt($get(MasterObj + "txtPageSize").value)
              if (parseInt($get(MasterObj + "lblTotal").value) % parseInt($get(MasterObj + "txtPageSize").value) != 0)
                  TotalPage++;
              if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                    document.getElementById("OToolBar_txtCurPage").value != "0")
                  if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                  document.getElementById(MasterObj + "CurPage").value = document.getElementById("OToolBar_txtCurPage").value
                  document.getElementById(MasterObj + "txtSubmit").value = "ShowCurPage";
                  document.getElementById(MasterObj + "BtnSubmit").click();
              }
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnNext() {
              document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnLast() {
              document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnPrv() {
              document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnFirst() {
              document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnEdit() {
              if (LastSelectedRow != null) {
                  
                  url = "AddPublicAccess.aspx?AccessId=" + LastSelectedRow.AccessId + "&intType=" + LastSelectedRow.intType;
                  rr = window.showModalDialog(url, window, "dialogHeight: 450px;dialogWidth: 800px;center: Yes;help: no;status: no")
                  if (rr == 1) {
                      $get(MasterObj + "txtSubmit").value = "ShowCurPage";
                      document.getElementById(MasterObj + "BtnSubmit").click();
                  }
              }
              else {
                alert("به منظور ویرایش باید یک سطر را انتخاب نمایید.")
              }
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OndbClickGrd() {
              OnClickBtnEdit()
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickGrdPublicAccess(SelectedRow) {
              if (LastSelectedRow != null) {
                  LastSelectedRow.className = LastSelectedRowClass;
              }
              LastSelectedRowClass = SelectedRow.className;
              LastSelectedRow = SelectedRow;
              SelectedRow.className = "CssSelectedItemStyle";
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnNew() {
              url = "AddPublicAccess.aspx?AccessId=0";
              rr = window.showModalDialog(url, window, "dialogHeight: 450px;dialogWidth: 800px;center: Yes;help: no;status: no")
              if (rr == 1) 
              {
                  $get(MasterObj + "txtSubmit").value = "ShowCurPage";
                  document.getElementById(MasterObj + "BtnSubmit").click();
              }
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnDel() {
              document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
              if (LastSelectedRow != null) {
                  if (confirm("آیا برای حذف مطمئنید؟")) {
                      
                      $get(MasterObj + "txtAccessId").value = LastSelectedRow.PublicAccessID
                      $get(MasterObj + "txtSubmit").value = "Delete";
                      document.getElementById(MasterObj + "BtnSubmit").click();
                  }
              }
              else {
                alert("به منظور ویرایش باید یک سطر را انتخاب نمایید.")
              }
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickSubNode(SelectedImage) {
              var oGrid
              oGrid = document.getElementById("GrdPublicAccess")

              var j;
              var i;
              var oRow = SelectedImage.parentElement.parentElement
              for (j = oRow.rowIndex; j < oGrid.rows.length; ++j)
                  if (oGrid.rows(j).cells(0).firstChild == SelectedImage) {
                  if (oGrid.rows(j + 1) && oGrid.rows(j + 1).style.display == "none") {
                      SelectedImage.src = "/FrmPresentation/App_Utility/Images/Icons/add_sub_task.png"
                      i = j + 1
                      while (oGrid.rows(i) && oGrid.rows(i).MainRowID == 0) {
                          oGrid.rows(i).style.display = "inline"
                          i++;
                      }
                  }
                  else if (oGrid.rows(j + 1) && oGrid.rows(j + 1).style.display == "inline") {
                      SelectedImage.src = "/FrmPresentation/App_Utility/Images/Icons/14_selectnodes.png"
                      i = j + 1
                      while (oGrid.rows(i) && oGrid.rows(i).MainRowID == 0) {
                          oGrid.rows(i).style.display = "none"
                          i++;
                      }
                  }
              }
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      </script>
</asp:Content>





