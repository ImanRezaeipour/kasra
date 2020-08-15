<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefineGroupAccessGroup.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.DefineGroupAccessGroup" MasterPageFile="../../App_Utility/MasterPage/MasterBule.master" ValidateRequest="false"%>

<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <script language="javascript" src="../../App_Utility/Scripts/General.js" type="text/javascript"></script>
    <script language="javascript" src="../../App_Utility/Scripts/KeySorting.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        /////-------------------------------------------
    </script>
     <table>
        <tr valign="top">
            <td valign="top" align="right" >
            
                <table style="height: 499px; width: 709px;">
                <tr style="height: 13px">
                <td >
                <table>
                <tr>
                <td align="right" >
                                نام گروه اصلی:
                            </td>
                            <td align="right" >
                                <asp:DropDownList onkeypress="return KeySort(this,false)" ID="cmbSearchMainGroup" runat="server" Width="130px">
                                </asp:DropDownList>
                            </td> 
                </tr>
                </table>
                </td>
                </tr>
                    <tr>
                        <td valign="top" style="height: 16px" >
                         
                            <uc1:ToolBar ID="OToolBar" runat="server" 
                                PageName="DefineGroupAccessGroup.aspx" PageID="1119" />
                         
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
                                 //if (StrVal == "BtnNext" | StrVal == "BtnPrev" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const") {
                                 if (StrVal != "") {
                                     LastSelectedRow = "";
                                     if ($get(MasterObj + "lblTo").value == "") {
                                         document.getElementById('OToolBar_txtFromData').value = "";
                                         document.getElementById('OToolBar_txtToData').value = "";
                                         document.getElementById('OToolBar_txtTotalData').value = "";

                                         document.getElementById('OToolBar_BtnNext').disabled = true;
                                         document.getElementById('OToolBar_BtnPrv').disabled = true;
                                         document.getElementById('OToolBar_BtnFirst').disabled = true;
                                         document.getElementById('OToolBar_BtnLast').disabled = true;
                                     }
                                     else if ($get(MasterObj + "lblTo").value != "") {
                                         document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
                                         document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
                                         document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
                                         document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
                                         document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;

                                         if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                                             document.getElementById('OToolBar_BtnNext').disabled = true
                                         else
                                             document.getElementById('OToolBar_BtnNext').disabled = false;

                                         if (parseInt($get(MasterObj + "lblFrom").value) == 1)
                                             document.getElementById('OToolBar_BtnPrv').disabled = true
                                         else
                                             document.getElementById('OToolBar_BtnPrv').disabled = false;

                                         document.getElementById('OToolBar_BtnFirst').disabled = false;
                                         document.getElementById('OToolBar_BtnLast').disabled = false;
                                     }
                                 }
                                 if (StrVal == "Delete") {
                                     if ($get(MasterObj + "txtAlert").value != "")
                                         SetMsg($get(MasterObj + "txtAlert").value);
                                 }
                                 else if (StrVal == "Modify") {
                                     document.getElementById("OToolBar_txtCurPage").value = "";
                                     document.getElementById('OToolBar_BtnPrv').disabled = true;
                                     document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
                                     document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
                                     document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
                                     document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
                                     document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;
                                     if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                                         document.getElementById('OToolBar_BtnNext').disabled = true
                                     else
                                         document.getElementById('OToolBar_BtnNext').disabled = false;

                                     if ($get(MasterObj + "txtAlert").value != "")
                                         SetMsg($get(MasterObj + "txtAlert").value);
                                 }
                                 else if (StrVal == "ShowCurPage") {
                                   
                                     document.getElementById("OToolBar_txtCurPage").value = "";
                                     document.getElementById('OToolBar_BtnPrv').disabled = true;
                                     document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
                                     document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
                                     document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
                                     document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
                                     document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;
                                     if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                                         document.getElementById('OToolBar_BtnNext').disabled = true
                                     else
                                         document.getElementById('OToolBar_BtnNext').disabled = false;
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
                                   <asp:HiddenField ID="txtGroupID" runat="server" />
                                   <asp:HiddenField ID="txtSearchMainGroupID" runat="server" />
                                    <asp:HiddenField ID="txtPageSize" runat="server" />
                                    <asp:HiddenField ID="lblTo" runat="server" />
                                    <asp:HiddenField ID="lblFrom" runat="server" />
                                    <asp:HiddenField ID="lblTotal" runat="server" />
                                    <asp:HiddenField ID="txtBaseGroupID" runat="server" />
                                    <asp:HiddenField ID="txtSubGroupID" runat="server" />
                                   <asp:HiddenField ID="txtCurPage" runat="server" />
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
                    <input type="text" id="txtModal" runat="server" />
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
          document.getElementById('OToolBar_BtnPrv').disabled = true;
          document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
          document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
          document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
          document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
          document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;
          if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
              document.getElementById('OToolBar_BtnNext').disabled = true
          else
              document.getElementById('OToolBar_BtnNext').disabled = false;
          
          if ($get(MasterObj + "txtModal").value == "1")
              document.getElementById('OToolBar_BtnCancel').style.display = "inline"
          else 
              document.getElementById('OToolBar_BtnCancel').style.display = "none"
          

          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!ToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnBlurtxtCurPage() {
              document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

              var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
              if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                    document.getElementById("OToolBar_txtCurPage").value != "0") {
                  if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                      document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
                  }
                  document.getElementById(MasterObj + "txtSubmit").value = "Const";
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
                  url = "AddGroupAccessGroup.aspx?GroupID=" + LastSelectedRow.BaseGroupID;
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
          function OnClickGrd(SelectedRow) {
              if (LastSelectedRow != null) {
                  LastSelectedRow.className = LastSelectedRowClass;
              }
              LastSelectedRowClass = SelectedRow.className;
              LastSelectedRow = SelectedRow;
              SelectedRow.className = "CssSelectedItemStyle";
              $get(MasterObj + "txtBaseGroupID").value = SelectedRow.BaseGroupID
              $get(MasterObj + "txtSubGroupID").value = SelectedRow.SubGroupID
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnNew() {
              url = "AddGroupAccessGroup.aspx?GroupID=0";
              rr = window.showModalDialog(url, window, "dialogHeight: 450px;dialogWidth: 800px;center: Yes;help: no;status: no")
              if (rr == 1) 
              {
                  $get(MasterObj + "txtSubmit").value = "ShowCurPage";
                  document.getElementById(MasterObj + "BtnSubmit").click();
              }
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnCancel() {
              window.close()
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnDel() {
              document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
              if (LastSelectedRow != null) {
                  if (confirm("آیا برای حذف مطمئنید؟")) {
                      $get(MasterObj + "txtSubmit").value = "Delete";
                      document.getElementById(MasterObj + "BtnSubmit").click();
                  }
              }
              else {
                alert("به منظور حذف باید یک سطر را انتخاب نمایید.")
              }
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnFilter() {
              $get(MasterObj + "txtGroupID").value = $get(MasterObj + "cmbSearchMainGroup").value
              document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
              document.getElementById(MasterObj + "txtSubmit").value = "Search";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndToolBar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClicklinkSubGroup(obj) {
              while (obj.tagName != "TR") {
                  obj=obj.parentNode
              }
              url = "DefineGroupAccessGroup.aspx?GroupID=" + obj.SubGroupID+"&Modal=1";
              rr = window.showModalDialog(url, window, "dialogHeight: 450px;dialogWidth: 800px;center: Yes;help: no;status: no")
                  
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      </script>
</asp:Content>





