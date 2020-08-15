<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="GroupCreditManagement.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.GroupCreditManagement" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../App_Utility/NewCalendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>
<%@ Register src="../../App_Utility/ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc4" %>
<%@ Register Src="../../App_Utility/MultiDepartment/MultiDepartment.ascx" TagName="MultiDepartment"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css" >
        .ReadStyle
        { 
            font-weight:bold;
            font-size:14px;
        }
        .fieldsetStyle 
        {
            width:1180px; 
            height: 60px; 
            border-right: lightblue thin inset;
            border-top: #78BED6 thin solid; 
            border-left: #78BED6 thin outset; 
            border-bottom: #78BED6 thin solid;
        }
        .legendStyle
        {
            color: #78BED6
        }
        .DropDownListStyle
        {
            font-weight:bold;
	        font-size: 8pt;
	        font-family: tahoma;
	        background-color: white;
	        border-color: lightsteelblue;
	        height :20px ;
	        width: 180px;
            display: none
        }
        .DivStyle
        {
            border: thin groove #000000; 
            background-color: #C5D5E9;
            scrollbar-hightlight-color: white;
            overflow: auto; 
            scrollbar-arrow-color: black; 
            scrollbar-base-color: #B1D3FF;
            height:370px; 
            float: center; 
            clear: right; 
            clip: rect(auto, auto, auto, auto);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1"  runat="server">
    </asp:ScriptManager>
    <table width="100%" height="80%" align="center">
        <tr>
            <td>
                <fieldset dir="rtl" class="fieldsetStyle">
                    <legend class="legendStyle">پارامتر هاي جستجو</legend>
                    <table width="100%" align="center">
                        <tr>
                            <td>
                                از تاريخ :
                            </td>
                            <td>
                                <uc2:KCalendar ID="KCalSDate" runat="server" />
                            </td>
                            <td>
                                تا تاريخ :
                            </td>
                            <td>
                                <uc2:KCalendar ID="KCalEDate" runat="server" />
                            </td>
                            <td bgcolor="#DFFFDF" align="left">
                                <input id="RDPerson" type="radio" name="RDFilter" checked value="0" />
                                پرسنلي
                            </td>
                            <td bgcolor="#DFFFDF">
                                <uc4:ComboBox ID="CmbPerson" runat="server" />
                            </td>
                            <td bgcolor="#DFFFDF" align="left">
                                <input id="RDGroup" type="radio" name="RDFilter" value="1" />
                                گروه
                            </td>
                            <td bgcolor="#DFFFDF">
                                <asp:DropDownList class="TxtControls" ID="CmbGroup" onkeydown="OnKeyEnter(this)" name="CmbGroup" style="width: 120px"
                                    runat="server">
                                </asp:DropDownList>
                            </td>
                            <td bgcolor="#DFFFDF" align="left">
                                <input id="RDDepartment" type="radio" name="RDFilter" value="2" />
                                واحد سازماني
                            </td>
                            <td bgcolor="#DFFFDF">
                                <uc3:MultiDepartment ID="UCDepartment" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                گروه مجوز:
                            </td>
                            <td>
                                <asp:DropDownList class="TxtControls" ID="CmbCreditGroup" onchange="OnChangeCmbGroup()"
                                    runat="server" Width="145px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                نوع مجوز:
                            </td>
                            <td>
                                <asp:DropDownList class="TxtControls" ID="CmbType" runat="server" Width="145px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td width="1180px" align="center">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td valign="top" width="1180px" align="center">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="Div2" class="DivStyle" align="center" runat="server">
                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                        </div>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="lblFrom" runat="server" />
                        <asp:HiddenField ID="lblTo" runat="server" />
                        <asp:HiddenField ID="Totalpage" runat="server" />
                        <asp:HiddenField ID="txtCurPage" runat="server" />
                        <asp:HiddenField ID="lblTotal" runat="server" />
                        <asp:HiddenField ID="txtPageSize" runat="server" />
                        <asp:HiddenField ID="txtPageNumber" runat="server" />
                        <asp:HiddenField ID="txtOrderString" runat="server" />
                        <asp:HiddenField ID="CurPage" runat="server" />
                        <asp:HiddenField ID="txtType" runat="server" />
                        <asp:HiddenField ID="txtID" runat="server" />
                        <asp:HiddenField ID="txtAlertStatus" runat="server" />
                        <asp:HiddenField ID="txtXMLCmbCredite" runat="server" />
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
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
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
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtKCalSDate" name="txtKCalSDate" runat="server" />
        <input type="text" id="txtKCalEDate" name="txtKCalEDate" runat="server" />
        <input type="text" id="txtSaveXml" name="txtSaveXml" runat="server" />
        <input type="text" id="txtPersonCode" name="txtPersonCode" runat="server" />
        <input type="text" id="txtOnlineUserName" name="txtOnlineUserName" runat="server" />
        <input type="text" id="txtStrParam" name="txtStrParam" runat="server" />
        <input type="text" id="txtGroupID" name="txtGroupID" runat="server" />
        <input type="text" id="txtDepID" name="txtDepID" runat="server" />
        <input type="text" id="txtCreditType" name="txtCreditType" runat="server" />
        <input type="text" id="txtCreditGroup" name="txtCreditGroup" runat="server" />
        <input type="text" id="txtXMLCredite" name="txtXMLCredite" runat="server" />
    </div>
  <script type="text/javascript" language="javascript"  >
      var MasterObj = "ctl00_ContentPlaceHolder1_";
      var LastSelectedRow = null;
      //====================================================================================
      Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
      Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
      function BeginRequestHandler(sender, args) {
          document.getElementById("OToolBar_ProgressBar").style.visibility = "visible";
      }
      //====================================================================================
      function EndRequestHandler(sender, args) {
          document.getElementById("OToolBar_ProgressBar").style.visibility = "hidden";
      }
      //================================================================================
      $(document).ready(function() {
          $("#RDGroup").click(function() {
              var CheckVal = $('[name="RDFilter"]:checked').val()
              if (CheckVal == 1) {

                  $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").hide()
                  $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").hide()
                  $("#ctl00_ContentPlaceHolder1_CmbGroup").show("slow")
              }
          })
          $("#RDPerson").click(function() {
              var CheckVal = $('[name="RDFilter"]:checked').val()
              if (CheckVal == 0) {
                  $("#ctl00_ContentPlaceHolder1_CmbGroup").hide()
                  $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").hide()
                  $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").show("slow")
              }
          })
          $("#RDDepartment").click(function() {
              var CheckVal = $('[name="RDFilter"]:checked').val()
              if (CheckVal == 2) {
                  $("#ctl00_ContentPlaceHolder1_CmbGroup").hide()
                  $("#ctl00_ContentPlaceHolder1_CmbPerson_TBMain").hide()
                  $("#ctl00_ContentPlaceHolder1_UCDepartment_TBMain").show("slow")
              }
          })
      })
      //================================================================================
      function OnClickBtnNew() {
          var url = "RegisterGroupCredit.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
          returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:550px;dialogWidth:700px;center: Yes;help: no;status: no")
          if (returnValue == 1)
              OnClickBtnFilter();
      }
      //================================================================================
      function OnClickBtnFilter() {
          $get(MasterObj + "txtPersonCode").value = $get(MasterObj + "CmbPerson_txtCode").value;
          $get(MasterObj + "txtCreditType").value = $get(MasterObj + "CmbType").value;
          $get(MasterObj + "txtCreditGroup").value = $get(MasterObj + "CmbCreditGroup").value;
          $get(MasterObj + "txtGroupID").value = $get(MasterObj + "CmbGroup").value;
          //          $get(MasterObj + "txtDepID").value = $get(MasterObj + "UCDepartment_txtCode").value;
          if ($get(MasterObj + "KCalSDate_txtCalendar").value != "")
              $get(MasterObj + "txtKCalSDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalSDate_txtMonth").value + "/" + $get(MasterObj + "KCalSDate_txtDay").value;
          if ($get(MasterObj + "KCalEDate_txtCalendar").value != "")
              $get(MasterObj + "txtKCalEDate").value = $get(MasterObj + "KCalEDate_txtYear").value + "/" + $get(MasterObj + "KCalEDate_txtMonth").value + "/" + $get(MasterObj + "KCalEDate_txtDay").value;
          $get(MasterObj + "txtSubmit").value = "Filter";
          $get(MasterObj + "BtnSubmit").click();
      }
      //================================================================================
      function OnChangeCmbGroup() {
          var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
          xmlDoc.async = "false";
          xmlDoc.loadXML($get(MasterObj + "txtXMLCredite").value);
          var xmlNodes;
          $get(MasterObj + "CmbType").innerHTML = ""

          var j = 0
          if ($get(MasterObj + "CmbCreditGroup").value != 0 && $get(MasterObj + "CmbCreditGroup").value != "") {
              xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo[CodeGroupID=" + $get(MasterObj + "CmbCreditGroup").value + "]");
          }
          else {
              xmlNodes = xmlDoc.documentElement.selectNodes("/GeneralEntity/LCombo");
          }
          if (xmlNodes.length != 0) {
              if ($get(MasterObj + "CmbCreditGroup").value != 0) {
                  if (j == 0) {

                      optionEl = document.createElement("OPTION")
                      $get(MasterObj + "CmbType").options.add(optionEl)
                      $get(MasterObj + "CmbType").all(j).innerText = 'انتخاب همه'
                      $get(MasterObj + "CmbType").all(j).value = '0'
                      j++
                  }
              }
              for (var i = 0; i < xmlNodes.length; ++i) {
                  optionEl = document.createElement("OPTION")
                  $get(MasterObj + "CmbType").options.add(optionEl)
                  $get(MasterObj + "CmbType").all(j).innerText = xmlNodes.item(i).selectSingleNode('CodeName').text
                  $get(MasterObj + "CmbType").all(j).value = xmlNodes.item(i).selectSingleNode('CodeID').text
                  j++
              }
          }
      }
      //================================================================================
      function OnClickGrd(SelectedRow) {
          if (LastSelectedRow != null) {
              LastSelectedRow.className = LastSelectedRowClass;
          }
          LastSelectedRowClass = SelectedRow.className;
          LastSelectedRow = SelectedRow;
          SelectedRow.className = "CssSelectedItemStyle";
      }
      //================================================================================
      function OndbClickGrd() {
          var SDate = LastSelectedRow.cells(1).innerText
          SDate = "13" + SDate.substr(6, 2) + "/" + SDate.substr(3, 2) + "/" + SDate.substr(0, 2);
          var Edate = LastSelectedRow.cells(2).innerText;
          Edate = "13" + Edate.substr(6, 2) + "/" + Edate.substr(3, 2) + "/" + Edate.substr(0, 2);
          var url = "RegisterGroupCredit.aspx?SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            + "&ToPersonId=" + document.getElementById(MasterObj + "txtOnLineUser").value
            + "&SDate=" + SDate
            + "&EDate=" + Edate
            + "&STime=" + LastSelectedRow.cells(3).innerText
            + "&ETime=" + LastSelectedRow.cells(4).innerText
            + "&Type=" + LastSelectedRow.getAttribute("CreditGroup")
            + "&Des=" + LastSelectedRow.cells(5).innerText
            + "&CreditType=" + LastSelectedRow.getAttribute("CreditType")
            + "&CreditID=" + LastSelectedRow.getAttribute("CreditID")
          returnValue = window.showModalDialog(encodeURI(url), window, "dialogHeight:550px;dialogWidth:700px;center: Yes;help: no;status: no")
          if (returnValue == 1)
              OnClickBtnFilter();
      }
      //================================================================================
      function OnClickBtnEdit() {
          if (LastSelectedRow != null)
              OndbClickGrd();
          else
              alert("لطفا يک سطر را انتخاب کنيد"); 
         
      }
  </script>
</asp:Content>

