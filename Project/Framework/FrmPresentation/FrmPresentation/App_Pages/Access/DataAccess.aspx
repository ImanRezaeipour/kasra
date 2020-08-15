<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataAccess.aspx.cs" Inherits="FrmPresentation.App_Pages.Access.DataAccess" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false"%>

<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<title>Untitled Page</title>
    <link href="../../../App_Utility/Styles/GeneralStyles.css" type="text/css" rel="stylesheet" />
    <script language="javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var str = '';
        /////-------------------------------------------
    </script>
    <table  style="width: 81%; height: 562px" align="center">
        <tr>
            <td style="height: 10px">
                <table style="width: 100%">
                    <tr>
                        <td style="width: 106px; height: 21px;">
                            نام دسترسي :&nbsp;</td>
                                                <td style="width: 245px; height: 21px;">
                        
                        <input id="txtFAccessName" name="txtFAccessName" type="text" runat="server"
                            dir="rtl" /></td>
                                                <td style="width: 94px; height: 21px;">
                                                    نوع دسترسي :</td>
                                                <td style="height: 21px">
                        
                        <asp:DropDownList ID="CmbFAccessType" runat="server" Width="150px">
                        </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                </td>
        </tr>
        <tr>
            <td style="height: 22px">
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="/DataAccess.aspx" 
                    PageID="1115" />
                 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                         
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
                                 //$get(MasterObj + "txtAlert").value = StrVal
                                 //if (StrVal == "BtnNext" | StrVal == "BtnPrev" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const") {
                                 if (StrVal != "") {
                                     LastSelectedRow = "";
                                     document.getElementById(MasterObj + "txtSearch").value = "<Root><Tb></Tb></Root>"
                                     document.getElementById(MasterObj + "txtTempSearch").value = "";

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
                                     LastSelectedRow = '';
                                 }
                                 /*else if (StrVal == "Search") {
                                 document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
                                 document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
                                 document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
                                 }*/
                                 //alert(StrVal)
                                 if (StrVal == "Delete") {
                                     if ($get(MasterObj + "txtAlert").value != "")
                                         SetMsg($get(MasterObj + "txtAlert").value);
                                 }
                                 else if (StrVal == "Modify") {
                                     if ($get(MasterObj + "txtAlert").value != "")
                                         SetMsg($get(MasterObj + "txtAlert").value);
                                 }
                                 else if (StrVal == "Search" & $get(MasterObj + "txtAlert").value != "") {
                                     $get(MasterObj + "SearchRowIndex").value = "";
                                     SetMsg($get(MasterObj + "txtAlert").value);
                                 }
                                 $get(MasterObj + "txtSubmit").value = "";

                                 if (StrVal == "CheckIDBeforeDelete") {
                                     if ($get(MasterObj + "txtAlert").value == "1") {
                                         var Msg = 'از اين دسترسي داده اي در دسترسي هاي ديگر استفاده شده و با حذف آن اطلاعات مربوطه حذف مي شوند' + String.fromCharCode(13) + 'آيا براي حذف موافقيد؟';
                                         if (confirm(Msg) == true) {
                                             $get(MasterObj + "txtSubmit").value = "Delete";
                                             $get(MasterObj + "BtnSubmit").click();
                                         }
                                     }
                                     else {
                                         $get(MasterObj + "txtSubmit").value = "Delete";
                                         $get(MasterObj + "BtnSubmit").click();
                                     }
                                 }
                             }
                             </script>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top" style="height: 302px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional"> 
                    <ContentTemplate>
                        <div style="DISPLAY: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtSaveXml" runat="server" />
                            <asp:HiddenField ID="txtCurPage" runat="server" />
                            <asp:HiddenField ID="txtSearch" runat="server" />
                            <asp:HiddenField ID="txtTempSearch" runat="server" />
                            <asp:HiddenField ID="lblFrom" runat="server" />
                            <asp:HiddenField ID="lblTo" runat="server" />
                            <asp:HiddenField ID="lblTotal" runat="server" />
                            <asp:HiddenField ID="Totalpage" runat="server" />
                            <asp:HiddenField ID="txtDataAccessID" runat="server" />
                             <asp:HiddenField ID="SearchRowIndex" runat="server" />
                        </div>
                        <asp:placeholder EnableViewState="false" id="GridViewPlaceHolder" runat="Server"/>
                    </ContentTemplate>
                   <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                    </asp:UpdatePanel>
           </td>
        </tr>
        <tr><td align="center"><div style="DISPLAY: none">
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
             <hr style="width: 447px" />
                      
            <table style="width: 100%">
                <tr>
                    <td style="width: 93px">
                        کد دسترسي :</td>
                    <td style="width: 206px">
                        
                        <input id="txtAccessCode" name="txtAccessCode" type="text" runat="server" 
                            dir="rtl" /></td>
                    <td style="width: 89px">
                        نام دسترسي :</td>
                    <td style="width: 202px">
                        
                        <input id="txtAccessName" name="txtAccessName" type="text" runat="server" style="width:200px;"
                            dir="rtl" /></td>
                    <td>
                        
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 93px">
                        نام ويو :</td>
                                                <td style="width: 206px">
                        
                        <asp:DropDownList ID="CmbViewName" runat="server" Width="200px">
                        </asp:DropDownList>
                                                </td>
                                                <td style="width: 89px">
                                                    نام فيلد ويو :</td>
                                                <td style="width: 202px">
                        
                        <input id="txtViewFieldName" name="txtViewFieldName" type="text" runat="server" style="width:200px;"
                            dir="rtl" /></td>
                                                <td>
                        
                                                    &nbsp;</td>
                                            </tr>
                <tr>
                    <td style="width: 93px">
                                                    نام تابع :</td>
                                                <td style="width: 206px">
                        
                        <asp:DropDownList ID="CmbFuncName" runat="server" Width="200px">
                        </asp:DropDownList>
                                                </td>
                                                <td style="width: 89px">
                                                    نام فيلد تابع :</td>
                                                <td style="width: 202px">
                        
                        <input id="txtFuncFieldName" name="txtFuncFieldName" type="text" runat="server" style="width:200px;"
                            dir="rtl" /></td>
                                                <td>
                        
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="width: 93px">
                                                    شرح دسترسي :</td>
                    <td style="width: 206px">
                        
                        <asp:TextBox ID="txtAccessDescr" runat="server" TextMode="MultiLine" 
                            Width="200px"></asp:TextBox>
                                                </td>
                    <td style="width: 89px">
                        نوع دسترسي :</td>
                    <td style="width: 202px">
                        
                        <asp:DropDownList ID="CmbAccessType" runat="server" Width="150px">
                        </asp:DropDownList>
                                                </td>
                    <td>
                        
                        <input id="ChkIndirectAccess" name="ChkIndirectAccess" type="checkbox" 
                            runat="server" style="background-color: transparent"/>دسترسي غير مستقيم</td>
                </tr>
            </table>
            </td></tr>
    </table>
     <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/General.js"></script>
      <script language="javascript">

          //*************************************Declaration*************************************
          var str = "";
          var MasterObj = "ctl00_ContentPlaceHolder1_";
          var PersonCode = "0";
          var LastSelectedRow = "";
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
          //alert($get(MasterObj + "Totalpage").value)
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
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnSave() {
              document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
              if (CheckEmptyData()) {
                  var StrXML = "";
                  StrXML += "<Root><Tb>";
                  StrXML += "<DataAccessID>" + document.getElementById(MasterObj + "txtDataAccessID").value + "</DataAccessID>";
                  StrXML += "<AccessCode>" + document.getElementById(MasterObj + "txtAccessCode").value + "</AccessCode>";
                  StrXML += "<DataAccessName>" + document.getElementById(MasterObj + "txtAccessName").value + "</DataAccessName>";
                  StrXML += "<DataAccessDescr>" + document.getElementById(MasterObj + "txtAccessDescr").value + "</DataAccessDescr>";
                  StrXML += "<ViewName>" + ((document.getElementById(MasterObj + "CmbViewName").value=='0')? '':document.getElementById(MasterObj + "CmbViewName").value) + "</ViewName>";
                  StrXML += "<FunctionName>" + ((document.getElementById(MasterObj + "CmbFuncName").value == "0") ? "" : document.getElementById(MasterObj + "CmbFuncName").value) + "</FunctionName>";
                  StrXML += "<ViewFieldName>" + document.getElementById(MasterObj + "txtViewFieldName").value + "</ViewFieldName>";
                  StrXML += "<FunctionFieldName>" + document.getElementById(MasterObj + "txtFuncFieldName").value + "</FunctionFieldName>";
                  StrXML += "<TypeID>" + document.getElementById(MasterObj + "CmbAccessType").value + "</TypeID>";
                  StrXML += "<IndirectAccess>" + ((document.getElementById(MasterObj + "ChkIndirectAccess").checked)? "1":"0") + "</IndirectAccess>";
                  StrXML += "</Tb></Root>";

                  document.getElementById(MasterObj + "txtSaveXml").value = StrXML;
                  document.getElementById(MasterObj + "txtSubmit").value = "Modify";
                  document.getElementById(MasterObj + "BtnSubmit").click();
              }
              else
                alert('لطفا اطلاعات را تکميل نماييد')
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnNew() {
              ClearAll();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnDel() {
              document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
              if (document.getElementById(MasterObj + "txtDataAccessID").value != ""
                    & document.getElementById(MasterObj + "txtDataAccessID").value != "0") {
                  if (confirm("آيا از حذف مطمئنيد؟")) {
                      $get(MasterObj + "txtSubmit").value = "CheckIDBeforeDelete"; //"Delete";
                      document.getElementById(MasterObj + "BtnSubmit").click();
                  }
              }
              else
                  alert("ابتدا يک سطر انتخاب نماييد")
          }
          //*************************************EndToolbar*************************************

          //*************************************ThisPage***************************************
          function SetEnter() {
              if (event.srcElement.id == "OToolBar_txtCurPage")
                  return;

              if (event.srcElement.id == MasterObj + "txtPersonCode" || event.srcElement.id == MasterObj + "txtPersonName" || event.srcElement.id == MasterObj + "CmbPersonName") {
                  if (window.event.keyCode == 13)
                      OnClickBtnSearch()
              }
              else
                  window.event.keyCode = 9

          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function CheckEmptyData() {
              var Flag = true;
              if (document.getElementById(MasterObj + "txtAccessCode").value == "") {
                  Flag = false
                  document.getElementById(MasterObj + "txtAccessCode").focus();
              }
              else if (document.getElementById(MasterObj + "txtAccessName").value == "") {
                  Flag = false
                  document.getElementById(MasterObj + "txtAccessName").focus();
              }
              else if (document.getElementById(MasterObj + "CmbViewName").value == "0" &
                        document.getElementById(MasterObj + "CmbFuncName").value == "0") {
                  Flag = false
                  document.getElementById(MasterObj + "CmbViewName").focus();
              }
              else if (document.getElementById(MasterObj + "txtAccessDescr").value == "") {
                  Flag = false
                  document.getElementById(MasterObj + "txtAccessDescr").focus();
              }
              else if (document.getElementById(MasterObj + "CmbAccessType").value == "0") {
                  Flag = false
                  document.getElementById(MasterObj + "CmbAccessType").focus();
              }
              
              return Flag;
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function ClearAll() {
              document.getElementById(MasterObj + "txtDataAccessID").value = "0";
              document.getElementById(MasterObj + "txtAccessCode").value = "";
              document.getElementById(MasterObj + "txtAccessName").value = "";
              document.getElementById(MasterObj + "txtAccessDescr").value = "";
              document.getElementById(MasterObj + "CmbViewName").value = "0";
              document.getElementById(MasterObj + "CmbFuncName").value = "0";
              document.getElementById(MasterObj + "CmbAccessType").value = "0";
              document.getElementById(MasterObj + "txtViewFieldName").value = "";
              document.getElementById(MasterObj + "txtFuncFieldName").value = "";
              document.getElementById(MasterObj + "txtAccessCode").focus();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnSearch() {
              
              document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
              
              var str = "<Root><Tb>"
              if (document.getElementById(MasterObj + "txtFAccessName").value!="")
                str += "<DataAccessName>" + document.getElementById(MasterObj + "txtFAccessName").value + "</DataAccessName>"
            if (document.getElementById(MasterObj + "CmbFAccessType").value != "0")
                str += "<TypeID>" + document.getElementById(MasterObj + "CmbFAccessType").value + "</TypeID>"
              str += "</Tb></Root>"
              document.getElementById(MasterObj + "txtSearch").value = str

              var StrWhere = "";
              if (document.getElementById(MasterObj + "txtFAccessName").value != "")
                  StrWhere = " DataAccessName like '" + document.getElementById(MasterObj + "txtFAccessName").value + "%'";
              if (document.getElementById(MasterObj + "CmbFAccessType").value != "0")
                  if (StrWhere != "")
                      StrWhere += " And TypeID = '" + document.getElementById(MasterObj + "CmbFAccessType").value + "'"
                  else
                      StrWhere += " TypeID = '" + document.getElementById(MasterObj + "CmbFAccessType").value + "'";
              document.getElementById(MasterObj + "txtTempSearch").value = StrWhere;
              
              document.getElementById(MasterObj + "txtSubmit").value = "Search";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickGrdDataAccess(SelectedRow) {
              if (LastSelectedRow != "") {
                  if (LastSelectedRow % 2 == 1)
                      SelectedRow.parentElement.rows(parseInt(LastSelectedRow)).className = "CssItemStyle"
                  else
                      SelectedRow.parentElement.rows(parseInt(LastSelectedRow)).className = "CssAlternatingItemStyle"    
              }        
              LastSelectedRow = SelectedRow.rowIndex;
              SelectedRow.className = "CssSelectedItemStyle";

              if ($get(MasterObj + "SearchRowIndex").value != "") {
                  var TempRow = $get(MasterObj + "SearchRowIndex").value;
                  if (TempRow == 0) {
                      SelectedRow.parentElement.rows(parseInt(TempRow) + 1).style.backgroundColor = "";
                      SelectedRow.parentElement.rows(parseInt(TempRow) + 1).className = "CssItemStyle"
                  }
                  else {
                      SelectedRow.parentElement.rows(parseInt(TempRow) + 1).style.backgroundColor = "";
                      if (SelectedRow.parentElement.rows(parseInt(TempRow)).className == "CssItemStyle")
                          SelectedRow.parentElement.rows(parseInt(TempRow) + 1).className = "CssAlternatingItemStyle"
                      else
                          SelectedRow.parentElement.rows(parseInt(TempRow) + 1).className = "CssItemStyle"
                  }
                  $get(MasterObj + "SearchRowIndex").value = ""
              }
              LoadData(SelectedRow);
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function LoadData(SelectedRow) {
              document.getElementById(MasterObj + "txtDataAccessID").value = SelectedRow.getAttribute('DataAccessID');
              document.getElementById(MasterObj + "txtAccessCode").value = SelectedRow.cells(0).innerText;
              document.getElementById(MasterObj + "txtAccessName").value = ((SelectedRow.cells(1).firstChild.title == "") ? SelectedRow.cells(1).innerText : SelectedRow.cells(1).firstChild.title); ;
              document.getElementById(MasterObj + "txtAccessDescr").value = ((SelectedRow.cells(2).firstChild.title == "") ? SelectedRow.cells(2).innerText : SelectedRow.cells(2).firstChild.title);
              document.getElementById(MasterObj + "CmbViewName").value = ((SelectedRow.cells(4).firstChild.title != "")? SelectedRow.cells(4).firstChild.title :((SelectedRow.cells(4).innerText == "") ? "0" : SelectedRow.cells(4).innerText));
              document.getElementById(MasterObj + "CmbFuncName").value = ((SelectedRow.cells(5).firstChild.title != "") ? SelectedRow.cells(5).firstChild.title : ((SelectedRow.cells(5).innerText == "") ? "0" : SelectedRow.cells(5).innerText));
              document.getElementById(MasterObj + "CmbAccessType").value = SelectedRow.getAttribute('TypeID');
              document.getElementById(MasterObj + "txtViewFieldName").value = SelectedRow.getAttribute('ViewFieldName');
              document.getElementById(MasterObj + "txtFuncFieldName").value = SelectedRow.getAttribute('FunctionFieldName');
              document.getElementById(MasterObj + "ChkIndirectAccess").checked = ((SelectedRow.getAttribute('IndirectAccess')=="1")? true:false);
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          //**********************************EndThisPage*************************************
      </script>

</asp:Content>
