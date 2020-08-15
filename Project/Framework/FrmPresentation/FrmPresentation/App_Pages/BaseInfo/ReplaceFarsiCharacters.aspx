<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false"
    AutoEventWireup="true" CodeBehind="ReplaceFarsiCharacters.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.ReplaceFarsiCharacters" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="600">
    </asp:ScriptManager>
    <table class="style1">
        <tr>
            <td colspand="3" style="height: 100px">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td style="width:100px">
            </td>
            <td bgcolor="#b8d2e2"style="border:2;border-color:Black;" valign="top">
            <br />
                <table id="XTabTable_Header" cellpadding="0" align="center" cellspacing="1">
                    <tr>
                        <td class="CssHeaderStyle" style="width: 200px" align="center" valign="top">
                            نام پروژه
                        </td>
                        <td class="CssHeaderStyle" style="width: 50px" align="center" valign="top">
                           حذف
                        </td>
                        <td class="CssHeaderStyle" style="width: 50px" align="center" valign="top">
                            ايجاد 
                        </td>
                    </tr>
                </table>
                <div style="width: 310px;height:300px;vertical-align:top;overflow:auto">
                    <table id="XTabTable" style="width: 300px;" cellpadding="0">
                    
                    </table>
                </div>
            </td>
            <td  bgcolor="#b8d2e2" style="border:2;border-color:Black;" valign="top" align="center">
            <br />
              <table id="XTableStr_Header" cellpadding="0" align="center" cellspacing="1">
                    <tr>
                        <td class="CssHeaderStyle" style="width: 100px" align="center" valign="top">
                           رشته موجود
                        </td>
                        <td class="CssHeaderStyle" style="width: 100px" align="center" valign="top">
                           رشته جايگزين
                        </td>
                        <td class="CssHeaderStyle" style="width: 50px" align="center" valign="top">
                           حذف
                        </td>
                        <td class="CssHeaderStyle" style="width: 50px" align="center" valign="top">
                            ايجاد 
                        </td>
                    </tr>
                </table>
                <div style="width: 300px;height:300px;vertical-align:top;overflow:auto">
                    <table id="XTableStr" style="width: 300px;" cellpadding="0">
                    
                    </table>
                </div>  
            </td>
            <td style="width:100px"></td>
        </tr>
    </table>
    <div style="display:none">
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server"  />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <asp:UpdatePanel ID="UpdatePanel3" EnableViewState="true" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <input type="text" id="txtStrPrj" name="txtStrPrj" runat="server"  />
                <input type="text" id="txtStrStr" name="txtStrStr" runat="server"  />
                <asp:HiddenField ID="txtAlert" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
            </Triggers>
        </asp:UpdatePanel>
        
    </div>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        CreateOneRow();
        CreateOneRowStr();

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function BeginRequestHandler(sender, args) {
            
        }
        //===========================================================
        function EndRequestHandler(sender, args) {

            
            alert($get(MasterObj + "txtAlert").value);
        }
        //============================================================      
        function CreateOneRow() {
            var OGrid = XTabTable;
            var NewRow = OGrid.insertRow();
            var index = NewRow.rowIndex;
            if (index - 1 > -1)
                OGrid.rows(index - 1).cells(2).firstChild.style.display = "none";
            if ((OGrid.rows.length - 1) % 2 == 0)
                NewRow.className = "CssItemStyle ";
            else
                NewRow.className = "CssAlternatingItemStyle";
            NewRow.style.verticalAlign = "top";
            NewRow.style.width = "300";
            var NewCell0 = NewRow.insertCell();
            NewCell0.style.width = "200";
            NewCell0.innerHTML = "<input type='text' style='width:200px;font-size:14px' dir='ltr' class='TxtControls' value=''/>";
            var NewCell2 = NewRow.insertCell();
            NewCell2.style.width = "50";
            NewCell2.innerHTML = "<Img src='../../App_Utility/Images/Icons/DelIcon.gif' onclick='onclickDelete(this)' style='cursor:pointer' />";
            var NewCell1 = NewRow.insertCell();
            NewCell1.style.width = "50";
            NewCell1.innerHTML = "<Img src='../../App_Utility/Images/Icons/NewIcon.gif' onclick='onclickNew()'  style='cursor:pointer'/>";
        }

        //=============================================================================
        function CreateOneRowStr() {
            var OGrid = XTableStr;
            var NewRow = OGrid.insertRow();
            var index = NewRow.rowIndex;
            if (index - 1 > -1)
                OGrid.rows(index - 1).cells(3).firstChild.style.display = "none";
            if ((OGrid.rows.length - 1) % 2 == 0)
                NewRow.className = "CssItemStyle ";
            else
                NewRow.className = "CssAlternatingItemStyle";
            NewRow.style.verticalAlign = "top";
            NewRow.style.width = "300";
            var NewCell0 = NewRow.insertCell();
            NewCell0.style.width = "100";
            NewCell0.innerHTML = "<input type='text' style='width:90px;font-size:14px' dir='ltr' class='TxtControls' value=''/>";

            var NewCell2 = NewRow.insertCell();
            NewCell2.style.width = "100";
            NewCell2.innerHTML = "<input type='text' style='width:90px;font-size:14px' dir='ltr' class='TxtControls' value=''/>";

            var NewCell3 = NewRow.insertCell();
            NewCell3.style.width = "50";
            NewCell3.innerHTML = "<Img src='../../App_Utility/Images/Icons/DelIcon.gif' onclick='onclickDeleteStr(this)' style='cursor:pointer' />";

            var NewCell4 = NewRow.insertCell();
            NewCell4.style.width = "50";
            NewCell4.innerHTML = "<Img src='../../App_Utility/Images/Icons/NewIcon.gif' onclick='onclickNewStr()'  style='cursor:pointer'/>";
        }
        //============================================
        function onclickNew() {
            CreateOneRow();
        }

        //============================================
        function onclickDelete(Obj) {
            var index = Obj.parentElement.parentElement.rowIndex;
            if (XTabTable.rows.length - 1 != 0) {
                if (index == XTabTable.rows.length - 1) {
                    XTabTable.rows(index - 1).cells(2).firstChild.style.display = "inline";
                }
                XTabTable.deleteRow(index);
            }
            else {
                XTabTable.rows(0).cells(0).firstChild.value = "";
                XTabTable.rows(0).cells(1).firstChild.value = "";
            }
        }
        //============================================
        function OnClickBtnExecute() {
            var i = 0, flag = true, str = "", Str2 = "";
            while (i < XTabTable.rows.length && flag) {
                if (XTabTable.rows(i).cells(0).firstChild.value == "") {
                    alert("نام پروژه وارد نشده است");
                    XTabTable.rows(i).cells(0).firstChild.focus();
                    flag = false;
                }
                str += XTabTable.rows(i).cells(0).firstChild.value + "?";
                i++;
            }
            i = 0
            while (i < XTableStr.rows.length && flag) {
                if (XTableStr.rows(i).cells(0).firstChild.value == "") {
                    alert("رشته وارد نشده است");
                    XTableStr.rows(i).cells(0).firstChild.focus();
                    flag = false;
                }
                if (XTableStr.rows(i).cells(1).firstChild.value == "" && flag) {
                    alert("رشته جايگزين وارد نشده است");
                    XTableStr.rows(i).cells(1).firstChild.focus();
                    flag = false;
                }
                Str2 += XTableStr.rows(i).cells(0).firstChild.value + ":" + XTableStr.rows(i).cells(1).firstChild.value + "?";
                i++;
            }
            if (flag) {
                $get(MasterObj + "txtStrPrj").value = str;
                $get(MasterObj + "txtStrStr").value = Str2;
                //alert($get(MasterObj + "txtStrPrj").value + "    " + $get(MasterObj + "txtStrStr").value);
                $get(MasterObj + "txtSubmit").value = "Exec";
                $get(MasterObj + "BtnSubmit").click();
            }
        }
        //=================================================================
        function onclickDeleteStr(Obj) {
            var index = Obj.parentElement.parentElement.rowIndex;
            if (XTableStr.rows.length - 1 != 0) {
                if (index == XTableStr.rows.length - 1) {
                    XTableStr.rows(index - 1).cells(3).firstChild.style.display = "inline";
                }
                XTableStr.deleteRow(index);
            }
            else XTableStr.rows(0).cells(0).firstChild.value = "";
        }
        //=================================================================
        function onclickNewStr() {
            CreateOneRowStr();
        } 
       
    </script>
</asp:Content>
