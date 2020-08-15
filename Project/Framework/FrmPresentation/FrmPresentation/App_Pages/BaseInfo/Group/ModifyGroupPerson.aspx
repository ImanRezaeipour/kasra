<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyGroupPerson.aspx.cs"
    Inherits="FrmPresentation.App_Pages.BaseInfo.Group.ModifyGroupPerson" MasterPageFile="../../../App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/General.js"></script>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";

        /////-------------------------------------------
    </script>

    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/Maskdiv.js"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <script type="text/javascript" language="javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
        }

        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
            var StrVal = $get(MasterObj + "txtSubmit").value
            //if (StrVal == "BtnNext" | StrVal == "BtnPrev" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const") {

            if (StrVal == "ImgRefreshPerson") {

                document.getElementById('ImgRefreshPerson').disabled = true;
                document.getElementById('MaskedDiv').style.display = 'none';
                document.getElementById('ModalPopupDiv').style.display = 'none';

            }

            if (StrVal != "") {
                {
                    CountChkSelected = 0
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
                    if ($get(MasterObj + "txtAlert").value != "") {
                        if ($get(MasterObj + "txtAlert").value == "Display") {
                           // alert($get(MasterObj + "txtOverlapXML").value)
                            
                            url = "ShiftOverlap.aspx?Kind=Update"
                            var rr = window.showModalDialog(url, window, "dialogHeight: 500px;dialogWidth: 700px;center: Yes;help: no;status: no")
                            if (rr == 1) {
                                document.getElementById(MasterObj + "txtSubmit").value = "SaveDate";
                                document.getElementById(MasterObj + "BtnSubmit").click();
                            }
                        }
                        else {
                            SetMsg($get(MasterObj + "txtAlert").value);
                        }
                        $get(MasterObj + "txtAlert").value=""
                    }
                    
                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    SetChk()
                }

            }
            $get(MasterObj + "txtSubmit").value = "";
        }
    </script>

    <table scroll="no">
        <tr>
            <td align="right" valign="top">
                <table style="height: 499px; width: 690px;">
                    <tr>
                        <td valign="top" style="height: 38px">
                            <table style="border-left: solid 1px #8db2e3; border-bottom: solid 1px #8db2e3; border-top: solid 1px #8db2e3;
                                border-right: solid 1px #8db2e3; width: 100%">
                                <tr>
                                    <td style="width: 130px" align="left">
                                        <font color="#FF66B3">نمايش اعضاي گروه :</font>
                                    </td>
                                    <td id="TDGroupName" runat="server" align="right" width="200px">
                                    </td>
                                     <td style="width: 130px" align="left">
                                        <font color="#FF66B3">دسته بندی :</font>
                                    </td>
                                    <td id="tdCategory" runat="server" align="right">
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td >
                                        برسنلی :
                                    </td>
                                    <td >
                                        <input id="txtPersonCode" name="txtPersonCode" onblur="OnBlurTxtPersonCode()" type="text"
                                            runat="server" dir="rtl" style="width: 60px" />
                                    </td>
                                    <td >
                                        نام و نام خانوادگی:
                                    </td>
                                    <td >
                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <input id="txtPersonName" name="txtPersonName" onblur="OnBlurTxtPersonName()" type="text"
                                                    runat="server" dir="rtl" style="width: 100px" /><asp:DropDownList onchange="onChangeCmbPersonName()"
                                                        ID="CmbPersonName" runat="server" Width="150px">
                                                    </asp:DropDownList>
                                                <img id="ImgRefreshPerson" alt="به روزرساني نام" onclick="onClickImgRefreshPerson()"
                                                    src="../../../App_Utility/Images/Icons/Refresh1.png" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ImgRefreshPersonSubmit" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="height: 16px">
                            <uc1:ToolBar ID="OToolBar" runat="server" GridID="3" PageName="ModifyGroupPerson.aspx"
                                PageID="1144" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" style="height: 406px">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div style="display: none">
                                        <asp:HiddenField ID="Totalpage" runat="server" />
                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                        <asp:HiddenField ID="txtSaveXml" runat="server" />
                                        <asp:HiddenField ID="txtCurPage" runat="server" />
                                        <asp:HiddenField ID="txtGroupID" runat="server" />
                                        <asp:HiddenField ID="txtSearch" runat="server" />
                                        <asp:HiddenField ID="lblFrom" runat="server" />
                                        <asp:HiddenField ID="lblTo" runat="server" />
                                        <asp:HiddenField ID="lblTotal" runat="server" />
                                        <asp:HiddenField ID="txtOverlapXML" runat="server" />
                                    </div>
                                    <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <div style="display: none">
                <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
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
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                    <input  type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtWithoutDate" runat="server" />
                    <input type="text" runat="server" id="txtCategoryID" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <asp:Button ID="ImgRefreshPersonSubmit" runat="server" OnClick="ImgRefreshPersonSubmit_Click" />
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/General.js"></script>

    <script language="javascript">

        //*************************************Declaration*************************************
        var str = "";
        var CountChkSelected = 0
        //*************************************EndDeclaration*************************************

        //*************************************OnLoad*************************************
//        document.body.attachEvent('onkeydown', SetEnter)
//        document.body.attachEvent('onkeypress', SetEnter)
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
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            document.getElementById(MasterObj + "txtSaveXml").value = "<Root>" + str + "</Root>"
           // alert(document.getElementById(MasterObj + "txtSaveXml").value)
            document.getElementById(MasterObj + "txtSubmit").value = "Save";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close();
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
        function onclickChk(obj) {
            var OGrid = document.getElementById("GrdPerson");
            var RowIndex = obj.parentElement.parentElement.rowIndex;
            var strXml = "<Root>" + str + "</Root>"


            //========================================================Chk ALL
            var oLen = OGrid.rows.length
            if (obj.checked == true && CountChkSelected != oLen - 1)
                CountChkSelected++;
            else if (obj.checked == false)
                CountChkSelected--;

            if (CountChkSelected == oLen - 1 && OGrid.rows(0).cells(0).firstChild.checked != true)
                OGrid.rows(0).cells(0).firstChild.checked = true
            else if (CountChkSelected != oLen - 1 && OGrid.rows(0).cells(0).firstChild.checked != false)
                OGrid.rows(0).cells(0).firstChild.checked = false
            //========================================================


            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [GroupPersonID=" + OGrid.rows(RowIndex).GroupPersonID  +"]");

            if (oXmlNodes.length > 0) {
                if (OGrid.rows(RowIndex).cells(0).firstChild.checked == true)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                else
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                strXml = oXmlDoc.xml;
                str = strXml.replace("<Root>", "");
                str = str.replace("</Root>", "");
            }
            else {
                var sd = OGrid.rows(RowIndex).cells(3).firstChild.value.substring(6, 10) + "/" + OGrid.rows(RowIndex).cells(3).firstChild.value.substring(3, 5) + "/" + OGrid.rows(RowIndex).cells(3).firstChild.value.substring(0, 2)
                var ed = OGrid.rows(RowIndex).cells(4).firstChild.value.substring(6, 10) + "/" + OGrid.rows(RowIndex).cells(4).firstChild.value.substring(3, 5) +"/"+ OGrid.rows(RowIndex).cells(4).firstChild.value.substring(0, 2)
                str += "<Tb>"
                str += "<GroupPersonID>" + OGrid.rows(RowIndex).GroupPersonID + "</GroupPersonID>"
                str += "<PersonCode>" + OGrid.rows(RowIndex).cells(1).innerText + "</PersonCode>"
                str += "<SDate>" + sd + "</SDate>"
                str += "<EDate>" + ed + "</EDate>"
                if (OGrid.rows(RowIndex).cells(0).firstChild.checked == false)
                    str += "<Selected>0</Selected>"
                else
                    str += "<Selected>1</Selected>"
                str += "<GroupID>" + document.getElementById(MasterObj + "txtGroupID").value + "</GroupID>"
                str += "</Tb>"
            }

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetChk() {
            var i = 0;
            var j = 0;
            var OGrid = document.getElementById("GrdPerson");
            if (OGrid == null)
                return
            var PageSize = OGrid.rows.length

            var strXml = "<Root>" + str + "</Root>"            

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";

            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [Selected=0]");

            CountChkSelected = OGrid.rows.length - 1 //Defult is SelectedAll

            for (j = 0; j < oXmlNodes.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    if (OGrid.rows(RowIndex).GroupPersonID == oXmlNodes.item(j).selectSingleNode("GroupPersonID").text) {
                        OGrid.rows(i).cells(0).firstChild.checked = false;
                        CountChkSelected--;
                    }
                }
            }
            //=========================================================Chk ALL
            if (CountChkSelected == OGrid.rows.length - 1)
                OGrid.rows(0).cells(0).firstChild.checked = true
            else
                OGrid.rows(0).cells(0).firstChild.checked = false

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSearch() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            var str
            str = "<Root><Tb><GroupID>" + document.getElementById(MasterObj + "txtGroupID").value + "</GroupID>"
            str += "<PersonCode>" + document.getElementById(MasterObj + "txtPersonCode").value + "</PersonCode>"

            if (document.getElementById(MasterObj + "txtPersonName").value != "")
                str += "<PersonName>" + document.getElementById(MasterObj + "txtPersonName").value + "</PersonName>"

            str += "</Tb></Root>"

            document.getElementById(MasterObj + "txtSearch").value = str
            document.getElementById(MasterObj + "txtSubmit").value = "Search";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onChangeCmbPersonName() {
            document.getElementById(MasterObj + "txtPersonCode").value = document.getElementById(MasterObj + "CmbPersonName").value
            if (document.getElementById(MasterObj + "CmbPersonName").value == 0)
                document.getElementById(MasterObj + "txtPersonCode").value = ""
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurTxtPersonCode() {
            document.getElementById(MasterObj + "CmbPersonName").value = document.getElementById(MasterObj + "txtPersonCode").value
            if (document.getElementById(MasterObj + "txtPersonCode").value == "" || document.getElementById(MasterObj + "txtPersonCode").value == "0")
                document.getElementById(MasterObj + "CmbPersonName").value = 0
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurTxtPersonName() {
            if (document.getElementById(MasterObj + "txtPersonName").value != "") {
                document.getElementById(MasterObj + "txtPersonCode").value = ""
                document.getElementById(MasterObj + "CmbPersonName").value = 0
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onClickImgRefreshPerson() {
            OpenModelPopup();
            document.getElementById(MasterObj + "txtSubmit").value = "ImgRefreshPerson";
            document.getElementById(MasterObj + "ImgRefreshPersonSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickHeaderChk(obj) {
            var OGrid = document.getElementById("GrdPerson");
            var oLen = OGrid.rows.length

            if (obj.checked == true)
                CountChkSelected = oLen - 1
            else
                CountChkSelected = 0


            for (var i = 1; i < oLen; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                onclickChk(OGrid.rows(i).cells(0).firstChild);
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onblurtxtDate(obj) {
            datechk()
            var OGrid = document.getElementById("GrdPerson");
            var RowIndex = obj.parentElement.parentElement.rowIndex;

            var sd = OGrid.rows(RowIndex).cells(3).firstChild.value.substring(6, 10) + "/" + OGrid.rows(RowIndex).cells(3).firstChild.value.substring(3, 5) + "/" + OGrid.rows(RowIndex).cells(3).firstChild.value.substring(0, 2)
            var ed = OGrid.rows(RowIndex).cells(4).firstChild.value.substring(6, 10) + "/" + OGrid.rows(RowIndex).cells(4).firstChild.value.substring(3, 5) + "/" + OGrid.rows(RowIndex).cells(4).firstChild.value.substring(0, 2)

            if (ed < sd) {
                alert("تاریخ پایان باید بزرگتر از تاریخ شروع باشد")
                window.event.srcElement.focus()
                window.event.returnvalue = false
            }
            var strXml = "<Root>" + str + "</Root>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb[GroupPersonID=" + OGrid.rows(RowIndex).GroupPersonID + "]");

            if (oXmlNodes.length > 0) {
                oXmlNodes.item(0).selectSingleNode("SDate").text = sd
                oXmlNodes.item(0).selectSingleNode("EDate").text = ed
                if (OGrid.rows(RowIndex).cells(0).firstChild.checked == true)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                else
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                strXml = oXmlDoc.xml;
                str = strXml.replace("<Root>", "");
                str = str.replace("</Root>", "");
            }
            else {
                str += "<Tb>"
                str += "<GroupPersonID>" + OGrid.rows(RowIndex).GroupPersonID + "</GroupPersonID>"
                str += "<PersonCode>" + OGrid.rows(RowIndex).cells(1).innerText + "</PersonCode>"
                str += "<SDate>" + sd + "</SDate>"
                str += "<EDate>" + ed + "</EDate>"
                if (OGrid.rows(RowIndex).cells(0).firstChild.checked == false)
                    str += "<Selected>0</Selected>"
                else
                    str += "<Selected>1</Selected>"
                str += "<GroupID>" + document.getElementById(MasterObj + "txtGroupID").value + "</GroupID>"
                str += "</Tb>"
            }
           
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //**********************************EndThisPage*************************************
    </script>
<script language="vbscript">
		'#ccaecc
		dim century
		century="13"
		function datechk()
			dim val
			val=replace(window.event.srcElement.value," ","",1,-1,1)
			if (not (val=""))and(not Isvaliddate(val)) then
 			Dim strQuestion, intReturn
			strQuestion="  ! لطفا دراين قسمت تاريخ شمسي صحيح وارد كنيد"
			strQuestion=MsgBox(strQuestion, 0, "تاريخ شمسي اشتباه ")
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
				Mi2sh=InttoSHD(roz)
		else
				mi2sh=""
		end if
		end function
		'*********************
		function InttoSHD(roz)
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
		       
			InttoSHD=cstr(sal)+"/"+right("0"&(mah+1),2)+"/"+right("0"&(roz+1),2)
		end function
		'*************************************************
		function SHDtoInt(shd)
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

			SHDtoInt=Tr+roz
		else
			alert("اشكال در تاريخ شمسي")
			SHDtoInt=0
		end if
		end function
		'*******************************
		function Between(date1,date2)
		between=SHDtoInt(date2)-SHDtoInt(date1)+1
		end function
		'*******************************
		function shdAdd(Sdate,days)
		days=cint(days)
		if days<>0 then 
				shdAdd=InttoSHD(SHDtoInt(cstr(Sdate))+days)
		else
				shdAdd=Sdate
		end if
		end function
		'*******************************
		</script>
</asp:Content>
