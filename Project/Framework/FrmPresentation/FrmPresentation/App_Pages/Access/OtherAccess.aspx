<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OtherAccess.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.OtherAccess"  MasterPageFile="../../App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" %>

<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script src="../../App_Utility/Scripts/KeySorting.js"></script>
<script language="javascript" type="text/javascript">
    var MasterObj = "ctl00_ContentPlaceHolder1_";

    /////-------------------------------------------
    </script>

<table style="width: 781px">
        <tr>
            <td valign="top" align="center" >
                <uc1:ToolBar ID="OToolBar" runat="server" GridID="1" 
                    PageName="ActionAccess.aspx" PageID="1123" />
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" style="height: 347px" >
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">    
                            
                    <ContentTemplate> 
                    
                        <div style="DISPLAY: none">
                            <asp:HiddenField ID="txtOtherAccessID" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtSaveXml" runat="server" />
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="txtGroupID" runat="server" />
                            <asp:HiddenField ID="txtSearch" runat="server" />
                            <asp:HiddenField ID="lblFrom" runat="server" />
                            <asp:HiddenField ID="lblTo" runat="server" />
                            <asp:HiddenField ID="lblTotal" runat="server" />
                            
                            
                        </div>
                       
                        <asp:placeholder id="GridViewPlaceHolder" runat="Server"/>
                       
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        
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
                                  
                                  if (StrVal != "") {
                                      {
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
                                          //alert(StrVal)
                                          if (StrVal == "Save") {
                                              if ($get(MasterObj + "txtAlert").value != "")
                                                  SetMsg($get(MasterObj + "txtAlert").value);
                                          }
                                          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                          if (StrVal == "Del") {
                                              if ($get(MasterObj + "txtAlert").value != "")
                                                  SetMsg($get(MasterObj + "txtAlert").value);
                                          }
                                      }

                                  }

                                  $get(MasterObj + "txtSubmit").value = "";

                                  if (StrVal == "CheckIDBeforeDelete") {
                                      if ($get(MasterObj + "txtAlert").value == "1") {
                                          var Msg = 'از اين دسترسي در دسترسي هاي ديگر استفاده شده و با حذف آن اطلاعات مربوطه حذف مي شوند' + String.fromCharCode(13) + 'آيا براي حذف موافقيد؟';
                                          if (confirm(Msg) == true) {
                                              $get(MasterObj + "txtSubmit").value = "Del";
                                              $get(MasterObj + "BtnSubmit").click();
                                          }
                                      }
                                      else {
                                          $get(MasterObj + "txtSubmit").value = "Del";
                                          $get(MasterObj + "BtnSubmit").click();
                                      }
                                  }
                              }
                             </script>
                    </ContentTemplate>
                    
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                        
                    </Triggers>
        
                </asp:UpdatePanel> 
                   
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" >
            
                            <hr style="width: 447px" />
                            <table style="width: 82%">
                                <tr>
                                    <td style="width: 82px">
                                        نام دسترسی :</td>
                                    <td style="width: 62px">
                        
                        <input id="txtAccessName" name="txtAccessName" type="text" runat="server" 
                            dir="rtl" style="width: 116px" /></td>
                                    <td style="width: 91px">
                                        کد دسترسی :</td>
                                    <td style="width: 108px">
                        
                        <input id="txtAccessCode" name="txtAccessCode"  type="text" runat="server" lang="en-au" 
                            dir="rtl" style="width: 116px" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 82px">
                                        نوع&nbsp; :</td>
                                    <td style="width: 62px">
                        
                                                        <asp:DropDownList ID="CmbOtherAccessType" onkeypress="return KeySort(this,false)" 
                                                            runat="server" Width="100px">
                                                        </asp:DropDownList>
                                                     </td>
                                    <td style="width: 91px">
                                        شرح دسترسی ؛</td>
                                    <td style="width: 108px">
                        
                                        <asp:TextBox ID="txtDescr" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                </table>
            
            </td>
        </tr>
        
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
            <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
            <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
            <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" onclick="BtnSubmit_Click" />
            
            
        </div>
        
         
        
</table>
<script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>
 <script language="javascript" src="../../../App_Utility/Scripts/farsitype.js"></script>
 <script language="javascript">
     //*************************************Declaration*************************************
     var LastSelectedRow = ""
     //*************************************EndDeclaration*************************************

     //*************************************OnLoad*************************************
     //document.body.attachEvent('onkeydown', SetEnter)
     //document.body.attachEvent('onkeypress', SetEnter)
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
     //**********************************EndOnLoad*************************************
     //*************************************Toolbar*************************************
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
         var TotalPage = parseInt($get(MasterObj + "txtCurPage").value);
         if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
             document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
             document.getElementById(MasterObj + "BtnSubmit").click();

             if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(TotalPage))
                 document.getElementById("OToolBar_BtnNext").disabled = true
             else
                 document.getElementById("OToolBar_BtnNext").disabled = false
         }
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnLast() {
         document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
         document.getElementById(MasterObj + "BtnSubmit").click();
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnPrv() {
         if (parseInt(document.getElementById("OToolBar_txtCurPage").value) >= 1) {
             document.getElementById(MasterObj + "txtSubmit").value = "BtnPrev";
             document.getElementById(MasterObj + "BtnSubmit").click();

             if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == 1)
                 document.getElementById("OToolBar_BtnPrv").disabled = true
             else
                 document.getElementById("OToolBar_BtnPrv").disabled = false
         }
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnFirst() {
         document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
         document.getElementById(MasterObj + "BtnSubmit").click();
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnNew() {
     
         $get(MasterObj + "txtOtherAccessID").value="0"
         $get(MasterObj + "txtAccessName").value = ""
         $get(MasterObj + "txtAccessCode").value = ""
         $get(MasterObj + "txtDescr").value = ""
         $get(MasterObj + "CmbOtherAccessType").value = "0"
         
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnSave() 
     {
         document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
         if ($get(MasterObj + "txtAccessName").value == "") {
             alert("نام دسترسی را وارد نمایید")
             return;
         }
         //--------------
         if ($get(MasterObj + "txtAccessCode").valuse == "") {
             alert("کد دسترسی را وارد نمایید")
             return;
         } 
         //--------------
         var strXml = '';

         if ($get(MasterObj + "txtOtherAccessID").value == "")
             $get(MasterObj + "txtOtherAccessID").value = "0";

         strXml += "<Root><Tb>"
         strXml += "<OtherAccessID>" + $get(MasterObj + "txtOtherAccessID").value + "</OtherAccessID>"
         strXml += "<AccessCode>" + $get(MasterObj + "txtAccessCode").value + "</AccessCode>"
         strXml += "<OtherAccessDescr>" + $get(MasterObj + "txtDescr").value + "</OtherAccessDescr>"
         strXml += "<OtherAccessName>" + $get(MasterObj + "txtAccessName").value + "</OtherAccessName>"
         strXml += "<OtherAccessType>" + $get(MasterObj + "CmbOtherAccessType").value + "</OtherAccessType>"
         strXml += "</Tb></Root>"
         //alert(strXml)
         //--------------
         $get(MasterObj + "txtSaveXml").value = strXml;
         $get(MasterObj + "txtSubmit").value = "Save";
         $get(MasterObj + "BtnSubmit").click();
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnDel() {
         document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
         if ($get(MasterObj + "txtOtherAccessID").value == "") {
             alert("لطفا یک سطر را انتخاب نمایید")
             return;
         }
         if (confirm('آيا براي حذف مطمئن هستيد؟') == true) {
             $get(MasterObj + "txtSubmit").value = "CheckIDBeforeDelete"//"Del";
             $get(MasterObj + "BtnSubmit").click();
         }
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     //**********************************EndToolbar*************************************
     //**********************************Thispage***************************************
     
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickGrd(SelectedRow) {

         if (LastSelectedRow != "")
             SelectedRow.parentElement.rows(parseInt(LastSelectedRow)).style.backgroundColor = "";
         LastSelectedRow = SelectedRow.rowIndex;
         SelectedRow.style.backgroundColor = "#FFFFCC";
         $get(MasterObj + "txtOtherAccessID").value = SelectedRow.OtherAccessID
         LoadData(SelectedRow)
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function LoadData(SelectedRow) {
         $get(MasterObj + "txtAccessName").value = SelectedRow.cells(0).innerText
         $get(MasterObj + "txtAccessCode").value = SelectedRow.cells(1).innerText
         $get(MasterObj + "txtDescr").value = SelectedRow.OtherAccessDescr//cells(2).innerText
         $get(MasterObj + "CmbOtherAccessType").value = SelectedRow.TypeID//cells(2).innerText
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OndbClickGrd(SelectedRow) {
         LoadData(SelectedRow)
     }
     //*******************************EndThispage***************************************
    
              
 </script>
</asp:Content>