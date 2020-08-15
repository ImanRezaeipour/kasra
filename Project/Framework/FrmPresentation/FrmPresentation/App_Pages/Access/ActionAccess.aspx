<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActionAccess.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.ActionAccess"  MasterPageFile="../../App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" %>

<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script src="../../App_Utility/Scripts/KeySorting.js"></script>
<script language="javascript" type="text/javascript">
    var MasterObj = "ctl00_ContentPlaceHolder1_";
    //----------------------------------
    </script>
    
    

<table style="width: 892px">
        <tr>
            <td valign="top" align="center" >
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <table align="center" style="width: 101%">
                    <tr>
                        <td style="width: 96px">
                            &nbsp; نام زیرسیستم :
                        
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
                                  //if (StrVal == "BtnNext" | StrVal == "BtnPrev" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const") {
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
                                          
                                          if (StrVal == "Save") {
                                              if ($get(MasterObj + "txtAlert").value != "")
                                                  SetMsg($get(MasterObj + "txtAlert").value);
                                              //alert("kkk")
                                          }
                                          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                          if (StrVal == "Del") {
                                              if ($get(MasterObj + "txtAlert").value != "")
                                                  SetMsg($get(MasterObj + "txtAlert").value);
                                          }
                                          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                          
                                      }

                                  }

                                  $get(MasterObj + "txtSubmit").value = "";
                                  
                                  if (StrVal == "CheckIDBeforeDelete") {
                                      if ($get(MasterObj + "txtAlert").value == "1") {
                                          var Msg = 'از اين فعاليت در دسترسي ها استفاده شده و با حذف آن اطلاعات مربوطه حذف مي شوند' + String.fromCharCode(13) + 'آيا براي حذف موافقيد؟';
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
                            
                            </td>
                                                <td style="width: 103px">
                                                
                                                        <asp:DropDownList onchange="onChangeCmbSubSys(1)" 
                                                            onkeypress="return KeySort(this,false)" ID="CmbSubSysFilter"
                                                                            runat="server" Width="100px" style="height: 22px">
                                                        </asp:DropDownList>
                                                   
                                                </td>
                                                <td style="width: 60px">
                                                    نام صفحه</td>
                                                <td style="width: 150px">
                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">    
                                                    <ContentTemplate> 
                                                        <asp:DropDownList ID="CmbPageNameTop" onkeypress="return KeySort(this,false)"
                                                            runat="server" Width="150px">
                                                        </asp:DropDownList>
                                                     </ContentTemplate>
                                    
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmitPageName" EventName="click" />
                                                        
                                                    </Triggers>
                                                </asp:UpdatePanel> 
                                                </td>
                                                <td style="width: 63px">
                                                    نام فعاليت</td>
                                                <td style="width: 88px">
                                                    <input id="txtActionNameTop" name="txtActionNameTop" type="text" /></td>
                                                <td>
                                                    کدفعاليت :</td>
                                                <td>
                                                    <input id="txtActionCodeTop" name="txtActionCodeTop" type="text" />
                                            </td>
                                            </tr>
                                        </table>
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" >
                <uc1:ToolBar ID="OToolBar" runat="server" GridID="1" 
                    PageName="ActionAccess.aspx" PageID="1114" />
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" style="height: 321px" >
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">    
                            
                    <ContentTemplate> 
                    
                        <div style="DISPLAY: none">
                            <asp:HiddenField ID="txtActionAccessID" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtSaveXml" runat="server" />
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="txtGroupID" runat="server" />
                            <asp:HiddenField ID="txtSearch" runat="server" />
                            <asp:HiddenField ID="lblFrom" runat="server" />
                            <asp:HiddenField ID="lblTo" runat="server" />
                            <asp:HiddenField ID="lblTotal" runat="server" />
                            <asp:FileUpload ID="BrowseFile"  runat="server" Width="207px" />
                            <input type="text" id="txtSelectIconPath" name="txtSelectIconPath" runat="server" />
                            
                        </div>
                       
                        <asp:placeholder id="GridViewPlaceHolder" runat="Server"/>
                       
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
                            <table style="width: 94%">
                                <tr>
                                    
                                    <td style="width: 87px">
                                        نام زیرسیستم : </td>
                                    <td style="width: 116px">
                                    
                                        <asp:DropDownList onchange="onChangeCmbSubSys(2)" onkeypress="return KeySort(this,false)" ID="CmbSubSys" 
                                            runat="server" Width="130px" style="height: 22px">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 66px">
                                        نام صفحه :</td>
                                    <td style="width: 115px">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">    
                                        <ContentTemplate> 
                                        <asp:DropDownList ID="CmbPageName" onkeypress="return KeySort(this,false)"
                                            runat="server" Width="130px">
                                        </asp:DropDownList>
                                        <div style="DISPLAY: none">
                                            <asp:HiddenField ID="txtSubSysID" runat="server" />
                                        </div>
                                        </ContentTemplate>
                    
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnSubmitPageName" EventName="click" />
                                            
                                        </Triggers>
                            
                                    </asp:UpdatePanel> 
                                    </td>
                                    <td style="width: 77px">
                                        وضعيت :</td>
                                    <td style="width: 118px">
                                        <asp:DropDownList ID="CmbToolBarStatus" onkeypress="return KeySort(this,false)"
                                            runat="server" Width="150px">
                                        </asp:DropDownList>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 87px">
                                        نام فعالیت :</td>
                                    <td style="width: 116px">
                        
                                        <asp:TextBox ID="txtActionName" runat="server" TextMode="MultiLine" 
                                            Width="130px"></asp:TextBox>
                                                </td>
                                    <td style="width: 66px">
                                        کد فعالیت :</td>
                                    <td style="width: 115px">
                        
                        <input id="txtAccessCode" name="txtAccessCode"  type="text" runat="server" lang="en-au" 
                            dir="rtl" style="width: 130px" /></td>
                                    <td style="width: 77px">
                                        شرح فعالیت ؛</td>
                                    <td style="width: 118px">
                        
                                        <asp:TextBox ID="txtDescr" runat="server" TextMode="MultiLine" Width="191px"></asp:TextBox>
                                    </td>
                                </tr>
                                </table>
            <table style="width: 831px; margin-right: 0px;"><tr><td style="width: 102px">الويت :</td>
                <td style="width: 151px">
                        
                        <input id="txtIntVal" name="txtIntVal"  type="text" runat="server" lang="en-au" onkeydown="OnKeyDownInt(this)"
                            dir="rtl" style="width: 130px" /></td><td style="width: 80px">آيکون :</td><td>
                        
                        <input id="txtSelectIconUrl" name="txtSelectIconUrl"  type="text" 
                            runat="server" lang="en-au" 
                            dir="rtl" style="width: 329px" /><input id="BtnFile" name="BtnFile" 
                    type="button" value="انتخاب آيکون" onclick="OnClickBtnFile()"/></td></tr></table>
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
            <asp:Button ID="BtnSubmitPageName" runat="server" Text="BtnSubmitPageName" onclick="BtnSubmitPageName_Click" />
        </div>
        
         
        
</table>
 <script language="javascript" src="../../../App_Utility/Scripts/farsitype.js"></script>
  <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>
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
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnNew() {

         $get(MasterObj + "txtActionAccessID").value = 0
         //$get(MasterObj + "CmbSubSys").value = 0
         //$get(MasterObj + "CmbPageName").value = 0
         $get(MasterObj + "txtActionName").value = ""
         $get(MasterObj + "txtAccessCode").value = ""
         $get(MasterObj + "txtDescr").value = ""
         $get(MasterObj + "txtSelectIconUrl").value = "";
         $get(MasterObj + "CmbToolBarStatus").value = "0";
         $get(MasterObj + "txtIntVal").value = "0";
         //------------------
         $get(MasterObj + "CmbSubSys").value = $get(MasterObj + "CmbSubSysFilter").value
         $get(MasterObj + "CmbPageName").value = $get(MasterObj + "CmbPageNameTop").value
                  
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnSave() {
         document.getElementById(MasterObj+"txtAcCode").value = GetAccessCode(window.event.srcElement)
        
         if ($get(MasterObj + "CmbPageName").value == 0) {
             alert("نام صفحه را وارد نمایید")
             return;
         }
         //-------------
         if ($get(MasterObj + "txtActionName").value =="") {
             alert("نام فعالیت را وارد نمایید")
             return;
         }
         //--------------
         if ($get(MasterObj + "txtAccessCode").value == "") {
             alert("کد فعالیت را وارد نمایید")
             return;
         }
         //--------------
         if ($get(MasterObj + "CmbToolBarStatus").value == "" || $get(MasterObj + "CmbToolBarStatus").value == "0") {
             alert("وضعيت را وارد نمایید")
             return;
         }
         //--------------
         var strXml = '';
         
         if ($get(MasterObj + "txtActionAccessID").value == "")
             $get(MasterObj + "txtActionAccessID").value = "0";

         strXml += "<Root><Tb>"
         strXml += "<ActionAccessID>" + $get(MasterObj + "txtActionAccessID").value + "</ActionAccessID>"
         strXml += "<ActionName>" + $get(MasterObj + "txtActionName").value + "</ActionName>"
         strXml += "<ActionAccessDescr>" + $get(MasterObj + "txtDescr").value + "</ActionAccessDescr>"
         strXml += "<AccessCode>" + $get(MasterObj + "txtAccessCode").value + "</AccessCode>"
         strXml += "<PageID>" + $get(MasterObj + "CmbPageName").value + "</PageID>"
         strXml += "<Icon>" + $get(MasterObj + "txtSelectIconUrl").value + "</Icon>"
         strXml += "<ActionAccessType>" + $get(MasterObj + "CmbToolBarStatus").value + "</ActionAccessType>"
         strXml += "<IntVal>" + $get(MasterObj + "txtIntVal").value + "</IntVal>"

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
         
         if ($get(MasterObj + "txtActionAccessID").value == "") {
             alert("لطفا یک سطر را انتخاب نمایید")
             return;
         }
         if (confirm('آيا براي حذف مطمئن هستيد؟') == true) {
             $get(MasterObj + "txtSubmit").value = "CheckIDBeforeDelete"; //"Del";
             $get(MasterObj + "BtnSubmit").click();
         }
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnFilter() {
         document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement)
         
         LastSelectedRow = "";
         var str=""
         str += "<Root><Tb>"
         str += "<SubSys>" + document.getElementById(MasterObj + "CmbSubSysFilter").value + "</SubSys>"
         str += "<PageID>" + document.getElementById(MasterObj + "CmbPageNameTop").value + "</PageID>"
         str += "<ActionName>" + $get("txtActionNameTop").value + "</ActionName>"
         str += "<ActionCode>" + $get("txtActionCodeTop").value + "</ActionCode>"
         str += "</Tb></Root>"

         document.getElementById(MasterObj + "txtSearch").value = str
         //-------------------
         $get(MasterObj + "txtSubmit").value = "Search";
         $get(MasterObj + "BtnSubmit").click();
     }
     //**********************************EndToolbar*************************************
     
     //**********************************Thispage***************************************
     function onChangeCmbSubSys(flag) {

         if (flag == 1) //In search Mode
         {
             $get(MasterObj + "txtSubSysID").value = $get(MasterObj + "CmbSubSysFilter").value;
             $get(MasterObj + "txtSubmit").value = "Top";
         }
         else if (flag == 2) //In New Mode
         {
             $get(MasterObj + "txtSubSysID").value = $get(MasterObj + "CmbSubSys").value;
             $get(MasterObj + "txtSubmit").value = "New";
         }
        //alert($get(MasterObj + "txtSubSysID").value)

         
         document.getElementById(MasterObj + "BtnSubmitPageName").click();
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickGrd(SelectedRow) {
         if (LastSelectedRow != "")
             SelectedRow.parentElement.rows(parseInt(LastSelectedRow)).style.backgroundColor = "";
         LastSelectedRow = SelectedRow.rowIndex;
         SelectedRow.style.backgroundColor = "#FFFFCC";
         $get(MasterObj + "txtActionAccessID").value = SelectedRow.ActionAccessID
         LoadData(SelectedRow);
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function LoadData(SelectedRow) {
         $get(MasterObj + "CmbSubSys").value = SelectedRow.SubSysID
         $get(MasterObj + "CmbPageName").value = SelectedRow.PageID
         $get(MasterObj + "txtActionName").value = SelectedRow.cells(1).innerText
         $get(MasterObj + "txtAccessCode").value = SelectedRow.cells(2).innerText
         if (SelectedRow.cells(3).firstChild.title != "")
             $get(MasterObj + "txtDescr").value = SelectedRow.cells(3).firstChild.title
         else
             $get(MasterObj + "txtDescr").value = SelectedRow.cells(3).innerText;
         $get(MasterObj + "txtSelectIconUrl").value = SelectedRow.getAttribute("Icon");
         $get(MasterObj + "CmbToolBarStatus").value = SelectedRow.getAttribute("ActionAccessType");
         $get(MasterObj + "txtIntVal").value = SelectedRow.getAttribute("IntVal");
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OndbClickGrd(SelectedRow) {
         LoadData();
     }
     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function OnClickBtnFile() {
         $get(MasterObj + 'BrowseFile').click();
         if ($get(MasterObj + 'BrowseFile').value != '') {
             var s
             s = ReplaceAll($get(MasterObj + 'BrowseFile').value, '\\', '/') + '/'
             var x
             x = 0
             x = getCntChar('/', s) - 1
             //alert($get(MasterObj + 'BrowseFile').value)
             $get(MasterObj + "txtSelectIconUrl").value = getArray(s, x, '/')
             $get(MasterObj + "txtSelectIconUrl").title = $get(MasterObj + 'BrowseFile').value
             $get(MasterObj + "txtSelectIconPath").value = $get(MasterObj + 'BrowseFile').value
         }
     }
     //*******************************EndThispage***************************************
    
              
 </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

    <style type="text/css">
        #txtActionNameTop
        {
            width: 106px;
        }
        #txtActionCodeTop
        {
            width: 119px;
        }
    </style>

</asp:Content>
