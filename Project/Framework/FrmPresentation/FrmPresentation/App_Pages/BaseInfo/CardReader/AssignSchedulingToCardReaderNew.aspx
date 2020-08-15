<%@ Page Title="------------------------------------------مشاهده زمانبندي گروه کارتخوان ها-------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="AssignSchedulingToCardReaderNew.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.AssignSchedulingToCardReaderNew" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register src="../../../App_Utility/Calendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<script language="javascript" type="text/javascript">
    window.document.title = "مشاهده زمانبندی کارتخوانها"
    var MasterObj = "ctl00_ContentPlaceHolder1_";
    var OGrid = $get("GrdCrdReaderActiveForSchdulingNew");
    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    function BeginRequestHandler(sender, args) {
        
    }


    function EndRequestHandler(sender, args) {
        try {
            
            LastSelectedRow = null;
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "")
                SetMsg($get(MasterObj + "txtAlert").value);

            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";
            var OGrid = document.getElementById("GrdCrdScheduling");

            if (OGrid != null) {

                for (var i = 1; i < OGrid.rows.length; i++) {
                    if (OGrid.rows[i].PeriodTypeID == 2) {
                        var array;
                        var str = OGrid.rows(i).WeekDay
                        str = str.substr(0, str.length - 1);
                        array = str.split(',');

                        OGrid.rows(i).cells(4).innerText = ""
                        for (var j = 0; j < array.length; j++) {
                            if (array[j] == 0)
                                OGrid.rows(i).cells(4).innerText += "شنبه" + ","
                            if (array[j] == 1)
                                OGrid.rows(i).cells(4).innerText += "یکشنبه" + ","
                            if (array[j] == 2)
                                OGrid.rows(i).cells(4).innerText += "دوشنبه" + ","
                            if (array[j] == 3)
                                OGrid.rows(i).cells(4).innerText += "سه شنبه" + ","
                            if (array[j] == 4)
                                OGrid.rows(i).cells(4).innerText += "چهار شنبه" + ","
                            if (array[j] == 5)
                                OGrid.rows(i).cells(4).innerText += "پنج شنبه" + ","
                            if (array[j] == 6)
                                OGrid.rows(i).cells(4).innerText += "جمعه" + ","
                        }
                    }
                }
            }
            //if (StrVal == "BtnNext" | StrVal == "BtnPrev" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const") {
            if (StrVal != "") {

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
        }
        catch (Exception) {
            alert("اطلاعات ناقص است");
        }
    }
    </script>
    <table>
        <tr>
            <td>
                <fieldset dir="rtl" style="width: 100%; height: 50px; border-right: lightblue thin inset;
                    border-top: lightblue thin solid; border-left: lightblue thin outset; border-bottom: lightblue thin solid;"
                    align="center">
                    <legend style="color: lightblue">آيتم هاي جستجو</legend>
                    <table align="right">
                        <tr>
                            <td>
                                گروه کارتخوان :
                            </td>
                            <td>
                                <div align="right">
                                    <select id="CmbCardReader" name="CmbCardReader" style="width: 130px" runat="server"
                                        class="TxtControls">
                                        <option></option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                زمانبندی :
                            </td>
                            <td>
                                <div align="right">
                                    <select id="cmbScheduling" runat="server" style="width: 130px" class="TxtControls">
                                        <option></option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="4" width="950px" >
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <table>
                    <tr>
                        <td style="border: medium groove #C0C0C0; background-color: #C5D5E9; height: 400px; width:910px" align="center" valign="top">
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
                                    <div style="height: 339px; position: fixed; top: 10px; " align="center">
                                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                    </div>
                                    <asp:HiddenField ID="CurPage" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                      <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />      
                                 </Triggers>
                            </asp:UpdatePanel>
                            <div style="display: none">
                            	<cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity>
                                <input type="text" id="SDate" name="SDate" runat="server" />
                                <input type="text" id="txtSchedulingID" name="txtSchedulingID" runat="server" />
                                <input type="text" id="txtCrdReaderID" name="txtCrdReaderID" runat="server" />
                                <input type="text" id="txtCardReaderGroupID" name="txtCardReaderGroupID" runat="server" />
                                <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
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
                                <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                                <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                                    runat="server" />
                                <input type="text" id="txtModalFlag" name="txtModalFlag" runat="server" />
                           
                            </div>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                &nbsp;
            </td>
        </tr>
    </table>
      <script language="javascript" type="text/javascript">
          var MasterObj = "ctl00_ContentPlaceHolder1_";

          var LastSelectedRow = null;
          var LastSelectedRowClass = "";

          if (document.getElementById(MasterObj + "txtModalFlag").value == "0" || document.getElementById(MasterObj + "txtModalFlag").value == "")
              document.getElementById('OToolBar_BtnCancel').style.visibility = "hidden";
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          var OGrid = document.getElementById("GrdCrdScheduling");

          if (OGrid != null) {
              for (var i = 1; i < OGrid.rows.length; i++) {
                  if (OGrid.rows[i].PeriodTypeID == 2) {

                      var array;

                      var str = OGrid.rows[i].WeekDay
                      str = str.substr(0, str.length - 1);
                      array = str.split(',');
                      OGrid.rows(i).cells(4).innerText = ""
                      for (var j = 0; j < array.length; j++) {
                          if (array[j] == 0)
                              OGrid.rows(i).cells(4).innerText += "شنبه" + ","
                          if (array[j] == 1)
                              OGrid.rows(i).cells(4).innerText += "یکشنبه" + ","
                          if (array[j] == 2)
                              OGrid.rows(i).cells(4).innerText += "دوشنبه" + ","
                          if (array[j] == 3)
                              OGrid.rows(i).cells(4).innerText += "سه شنبه" + ","
                          if (array[j] == 4)
                              OGrid.rows(i).cells(4).innerText += "چهار شنبه" + ","
                          if (array[j] == 5)
                              OGrid.rows(i).cells(4).innerText += "پنج شنبه" + ","
                          if (array[j] == 6)
                              OGrid.rows(i).cells(4).innerText += "جمعه" + ","
                      }
                  }
              }
          }

          ////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!OnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnNext() {
              document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnPrv() {
              document.getElementById(MasterObj + "txtSubmit").value = "BtnPrv";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnLast() {
              document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnFirst() {
              document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickGrd(SelectedRow) {
              if (LastSelectedRow != null) {
                  LastSelectedRow.className = LastSelectedRowClass;
              }
              LastSelectedRowClass = SelectedRow.className;
              LastSelectedRow = SelectedRow;
              SelectedRow.className = "CssSelectedItemStyle";
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnCancel() {
              window.close();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnFilter() {

              // document.getElementById(MasterObj + "txtCrdReaderID").value = document.getElementById(MasterObj + "cmbCardReader").value
              document.getElementById(MasterObj + "txtCardReaderGroupID").value = document.getElementById(MasterObj + "CmbCardReader").value
              document.getElementById(MasterObj + "txtSchedulingID").value = document.getElementById(MasterObj + "cmbScheduling").value
              document.getElementById(MasterObj + "txtSubmit").value = "Filter";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnShowAll() {
              document.getElementById(MasterObj + "txtCardReaderGroupID").value = "0";
              document.getElementById(MasterObj + "CmbCardReader").value = "0";
              document.getElementById(MasterObj + "cmbScheduling").value = "0";
              document.getElementById(MasterObj + "txtSchedulingID").value = "0";
              document.getElementById(MasterObj + "txtSubmit").value = "Filter";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnNew() {
              url = "AssignScheduleToCardReaderGroup.aspx" + "?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUser").value
             + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value;

              returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight: 600px;dialogWidth:1000px;center: Yes;help: no;status: no")

              if (returnValue == 1) {
                  document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                  document.getElementById(MasterObj + "BtnSubmit").click();
              }

          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OndbClickGrd() {
              url = "AssignScheduleToCardReaderGroup.aspx?SchedulingID=" + LastSelectedRow.getAttribute("SchedulingID")
              + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUser").value
              + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
              + "&CardSchedulingID=" + LastSelectedRow.getAttribute("CardSchedulingID")
              + "&CardReaderGroupID=" + LastSelectedRow.getAttribute("CardReaderGroupID");
              returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:600px;dialogWidth: 1000px;center: Yes;help: no;status: no")

              if (returnValue == 1) {
                  document.getElementById(MasterObj + "txtSubmit").value = "Filter";
                  document.getElementById(MasterObj + "BtnSubmit").click();
              }


          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          function OnClickBtnEdit() {
              if (LastSelectedRow != null)
                  OndbClickGrd();
              else
                  alert("به منظور ويرايش يک سطر را انتخاب کنيد")
          }
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   
    </script>
     
</asp:Content>
