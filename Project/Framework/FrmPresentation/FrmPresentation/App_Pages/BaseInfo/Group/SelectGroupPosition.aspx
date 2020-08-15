<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="SelectGroupPosition.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Group.SelectGroupPosition" 
ValidateRequest="false"%>
<%@ Register Src="../../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc1" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .TblFilter
        {
            width:100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false"></asp:ScriptManager>
    <table width="850px;" >
        <!-----------------------ToolBar------------------------------>
        <tr>
            <td>
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <fieldset dir="rtl" style="width: 100%; height: 50px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="center">
                    <legend style="color: #78BED6">انتخاب سمت</legend>
                    <table align="right">
                        <tr>
                            <td>
                                پرسنلي :
                            </td>
                            <td>
                                    <uc1:ComboBox ID="CmbPerson" runat="server" />
                            </td>
                            <td>
                                <input id="BtnSelectPerson" class="CssHeaderStyle" onclick="onClickBtnSelectPerson(this)"
                                    style="width: 25px; cursor: pointer; height: 22px" type="button" value="..." />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
                <fieldset dir="rtl" style="width: 100%; height: 400px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="center">
                    <legend style="color: #78BED6">انتخاب گروه</legend>
                    <table>
                        <!------------------------------آیتم های جستجو---------------------------->
                        <tr>
                            <td>
                                <fieldset dir="rtl" style="width: 100%; height: 50px; border-right: lightblue thin inset;
                                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                                    align="center">
                                    <legend style="color: #78BED6">پارامتر هاي جستجو</legend>
                                    <table class="TblFilter">
                                        <tr>
                                            <td>
                                                نام گروه :
                                            </td>
                                            <td>
                                                <input type="text" id="txtGroupName" runat="server" style="width: 100px" class="TxtControls" />
                                            </td>
                                            <td>
                                                نام مخفف :
                                            </td>
                                            <td>
                                                <input type="text" id="txtAcronymName" style="width: 100px" class="TxtControls" />
                                            </td>
                                            <td>
                                                شهر :
                                            </td>
                                            <td>
                                                <uc1:ComboBox ID="CmbMember" runat="server" />
                                            </td>
                                            <td>
                                                دسته بندي :
                                            </td>
                                            <td>
                                                <select id="CmbCategory" runat="server" style="width: 150px" class="TxtControls">
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                        <!----------------------------------گرید------------------------->
                        <tr>
                            <td align="center">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                        <asp:HiddenField ID="txtValidate" runat="server" />
                                        <asp:HiddenField ID="txtCurPage" runat="server" />
                                        <asp:HiddenField ID="Totalpage" runat="server" />
                                        <asp:HiddenField ID="txtSortExpression" runat="server" />
                                        <asp:HiddenField ID="txtSortDirection" runat="server" />
                                          <asp:HiddenField ID="txtOldPersonCode" runat="server" />
                                        <div id="GridViewPerson">
                                            <cc2:KasraGrid ID="GrdGroupPosition" runat="server" OnRowDataBound="Grid_RowDataBound"
                                                AllowSorting="true" OnSorting="GrdGroupPosition_Sorting">
                                            </cc2:KasraGrid>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
  
    </table>
    <!------------------------------------------------------------->
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSearchFlag" name="txtSearchFlag" runat="server" />
        <input type="text" id="txtSystemID" name="txtSystemID" runat="server" />
        <!---------------Temp------------------------>
        <input type="text" id="txtTmpMemberCode" name="txtTmpMemberCode" runat="server" />
        <input type="text" id="txtTmpName" name="txtTmpName" runat="server" />
        <input type="text" id="txtTmpAcronym" name="txtTmpAcronym" runat="server" />
        <input type="text" id="txtTmpCategory" name="txtTmpCategory" runat="server" />
        <input type="text" id="txtPersonCode" name="txtPersonCode" runat="server" />
        <input type="text" id="txtXmlGroup" name="txtXmlGroup" runat="server" />
        <input type="text" id="txtRoleID" name="txtRoleID" runat="server" />
    </div>
      <script src="../../../App_Utility/Scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script>
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        document.body.scroll = "no";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var str="<Root></Root>"
        $("#OToolBar_TDTopToolBar").css("display", "none");
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //------------------------------------------------------------------------------

        function EndRequestHandler(sender, args) {
            LastSelectedRow = null;
            var StrVal = $get(MasterObj + "txtSubmit").value
            if (StrVal == "Modify") {
                if ($get(MasterObj + "txtValidate").value == "0")
                    alert($get(MasterObj + "txtAlert").value);
                else {
                    SetMsg($get(MasterObj + "txtAlert").value);
                    window.returnValue = 1;
                }

            }
            if ((StrVal == "BtnFirst" || StrVal == "BtnNext" || StrVal == "BtnLast" || StrVal == "BtnPrev" || StrVal == "Const" || StrVal == "Filter" || StrVal == "Modify"))
                SetChk();
            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";
            $get(MasterObj + "txtValidate").value = "";
        }

//===============================================Paging================================================
        function OnBlurtxtCurPage(obj) {
            if (obj.value != 0 && obj.value.replace(" ", "") != "") {
                $("#" + MasterObj + "txtCurPage").val(obj.value)
                $("#" + MasterObj + "txtSubmit").val("Const")
                $("#" + MasterObj + "BtnSubmit").click()
            }
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnNext() {
            $("#" + MasterObj + "txtSubmit").val("BtnNext")
            $("#" + MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnLast() {
            $("#" + MasterObj + "txtSubmit").val("BtnLast")
            $("#" + MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnPrv() {
            $("#" + MasterObj + "txtSubmit").val("BtnPrev")
            $("#" + MasterObj + "BtnSubmit").click()
        }
        //--------------------------------------------------------------------------------------------
        function OnClickBtnFirst() {
            $("#" + MasterObj + "txtSubmit").val("BtnFirst")
            $("#" + MasterObj + "BtnSubmit").click()
        }
        //------------------------------------------------------------------------------------------
        function OnClickGrd(SelectedRow) {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {
            $("#" + MasterObj + "txtTmpName").val($("#" + MasterObj + "txtGroupName").val());
            $("#" + MasterObj + "txtTmpMemberCode").val($("#" + MasterObj + "CmbMember_txtCode").val());
            $("#" + MasterObj + "txtTmpAcronym").val($("#txtAcronymName").val());
            $("#" + MasterObj + "txtTmpCategory").val($("#" + MasterObj + "CmbCategory").val());
            $("#" + MasterObj + "txtSubmit").val("Filter")
            $("#" + MasterObj + "BtnSubmit").click()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnShowAll() {
            $("#" + MasterObj + "CmbMember_txtCode").val("");
            $("#" + MasterObj + "CmbMember_txtPCode").val("");
            $("#" + MasterObj + "CmbMember_txtName").val("");
            $("#" + MasterObj + "CmbCategory").val("0");
            $("#" + MasterObj + "txtGroupName").val("");
            $("#txtAcronymName").val("");
            OnClickBtnFilter();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onClickBtnSelectPerson() {
            var strUrl = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?SessionID=" + $get(MasterObj + "txtSessionID").value + "&Type=1"  
            strUrl = encodeURI(strUrl)
            returnResult = window.showModalDialog(strUrl, '', 'dialogHeight: 600px;dialogWidth:900px;center: Yes;help: no;status: no;minimize: yes;resizable:yes')

            if (returnResult != "" && returnResult != undefined) {
                var xmlNew;
                if (window.ActiveXObject) {
                    xmlNew = new ActiveXObject('Microsoft.XMLDOM');
                    xmlNew.async = 'false';
                    xmlNew.loadXML(returnResult);
                } else {
                    var parser = new DOMParser();
                    xmlNew = parser.parseFromString(returnResult, 'text/xml');
                }
                //------------------------------------------------------------------
                $(xmlNew).find("Root").find("Tb").each(function() {
                    $("#" + MasterObj + "CmbPerson_txtCode").val($(this).find("PCode").text())
                    $("#" + MasterObj + "CmbPerson_txtPCode").val($(this).find("PCode").text())
                    $("#" + MasterObj + "CmbPerson_txtName").val($(this).find("PName").text())
                });
                //------------------------------------------------------------------
            }
        }
        //===============================================================================================
        function OnClickHeaderChk(obj) {
            var OGrid = document.getElementById(MasterObj + "GrdGroupPosition");
            var PageSize = OGrid.rows.length;
            if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
                PageSize = PageSize - 1;

            for (var i = 1; i < PageSize; i++) {
                if (OGrid.rows(i).cells(0).firstChild.disabled != true) {
                    OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                    OnClickChk(OGrid.rows(i).cells(0).firstChild);
                }
            }
        }
        //===============================================================================================
        function OnClickChk(obj) {
            var OGrid = document.getElementById(MasterObj + "GrdGroupPosition");
            var RowIndex = obj.parentElement.parentElement.rowIndex;
            var TbObj = obj.parentElement.parentElement.parentElement.parentElement
            var GroupID = TbObj.rows(RowIndex).getAttribute("ID")
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            var oXmlNodes = "";
            oXmlDoc.loadXML(str);
            if ((str != "<Root></Root>") && (str != "<Root/>"))
                oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [GroupID=" + GroupID + "]");

            if (oXmlNodes.length == 0) {
                var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDocTemp.async = "false";
                if (obj.checked == true)
                    oXmlDocTemp.loadXML("<Root><Tb><GroupID>" + GroupID + "</GroupID><Selected>1</Selected></Tb></Root>");
                else
                    oXmlDocTemp.loadXML("<Root><Tb><GroupID>" + GroupID + "</GroupID><Selected>0</Selected></Tb></Root>");
                var oXmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
                oXmlDoc.childNodes[0].appendChild(oXmlNodeTemp);
            }
            else if (oXmlNodes.length > 0) {
                var oXmlDocTemp = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDocTemp.async = "false";
                var oXmlNodeTemp = oXmlDoc.documentElement.selectSingleNode("/Root/Tb[GroupID=" + GroupID + "]");
                var f = oXmlDoc.documentElement.removeChild(oXmlNodeTemp);
                if (obj.checked == true)
                    oXmlDocTemp.loadXML("<Root><Tb><GroupID>" + GroupID + "</GroupID><Selected>1</Selected></Tb></Root>");
                else
                    oXmlDocTemp.loadXML("<Root><Tb><GroupID>" + GroupID + "</GroupID><Selected>0</Selected></Tb></Root>");
                var oXmlNodeTemp = oXmlDocTemp.documentElement.selectSingleNode("/Root/Tb");
                
                oXmlDoc.childNodes[0].appendChild(oXmlNodeTemp);
            }
            str = oXmlDoc.xml
        }
        //===============================================================================================
        function SetChk() {
            var OGrid = document.getElementById(MasterObj + "GrdGroupPosition");
            if (OGrid == null)
                return
            var PageSize = OGrid.rows.length;
            if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
                PageSize = PageSize - 1;

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(str);
         
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
            for (var j = 0; j < oXmlNodes.length; j++) {
                for (var i = 1; i < PageSize; i++) {
                    if (OGrid.rows(i).getAttribute("ID") == oXmlNodes.item(j).selectSingleNode("GroupID").text
                     && oXmlNodes.item(j).selectSingleNode("Selected").text=="1") {
                        OGrid.rows(i).cells(0).firstChild.checked = true;
                    }
                }
            }
        }
        //===============================================================================================
        function OnClickBtnSave() {
            if ($("#" + MasterObj + "CmbPerson_txtCode").val() == "") {
                alert("لطفا پرسنلي سمت مورد نظر را انتخاب نماييد");
                $("#" + MasterObj + "txtPersonCode").focus();
            } else if ((str == "" || str == "<Root></Root>" || str == "<Root/>") && $("#" + MasterObj + "txtRoleID").val()== "0")
                alert("لطفا گروه های مورد نظر را انتخاب نماييد")
            else {
                $("#" + MasterObj + "txtPersonCode").val($("#" + MasterObj + "CmbPerson_txtCode").val())
                $("#" + MasterObj + "txtXmlGroup").val(str);
                $("#" + MasterObj + "txtSubmit").val("Modify");
                $("#" + MasterObj + "BtnSubmit").click();
            }
        }
//===============================================================================================
        function OnClickBtnNew() {
            var OGrid = $get(MasterObj + "GrdGroupPosition");
            var PageSize = OGrid.rows.length;
            if (OGrid.rows(PageSize - 1).getAttribute("Footer") == 1)
                PageSize = PageSize - 1;
          
            for (var i = 0; i < PageSize; i++)
                OGrid.rows(i).cells(0).firstChild.checked = false;
            str = "<Root></Root>";
            $("#" + MasterObj + "txtXmlGroup").val("");
            $("#" + MasterObj + "txtPersonCode").val("");
            $("#" + MasterObj + "CmbPerson_txtCode").val("")
            $("#" + MasterObj + "CmbPerson_txtPCode").val("")
            $("#" + MasterObj + "CmbPerson_txtName").val("")
            $("#" + MasterObj + "CmbMember_txtCode").val("");
            $("#" + MasterObj + "CmbMember_txtPCode").val("");
            $("#" + MasterObj + "CmbMember_txtName").val("");
            $("#" + MasterObj + "CmbCategory").val("0");
            $("#" + MasterObj + "txtGroupName").val("");
            $("#txtAcronymName").val("");
            $("#" + MasterObj + "txtRoleID").val("0");
            $("#" + MasterObj + "txtOldPersonCode").val("");
        }
        //===============================================================================================
    </script>
</asp:Content>

