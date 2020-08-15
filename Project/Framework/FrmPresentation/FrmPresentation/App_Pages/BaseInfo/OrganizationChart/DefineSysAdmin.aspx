<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefineSysAdmin.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Person.DefineSysAdmin" MasterPageFile="../../../App_Utility/MasterPage/MasterBule.master" ValidateRequest="false"%>

<%@ Register src="../../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>


<%@ Register src="../../../App_Utility/Calendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <title>Untitled Page</title>
     <script src="../../../App_Utility/Scripts/KeySorting.js"></script>
    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/General.js"></script>
    <script language ="javascript" type ="text/javascript" src="../../../App_Utility/Scripts/Maskdiv.js"></script>
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
                                 
                                 $get(MasterObj + "txtSysAdminID").value = $get(MasterObj + "hdnSysAdminId").value
                                 var StrVal = $get(MasterObj + "txtSubmit").value

                                 if ($get(MasterObj + "txtAlert").value != "") {
                                     SetMsg($get(MasterObj + "txtAlert").value);
                                     $get(MasterObj + "txtAlert").value = ""
                                 }
                                     
                                 if (StrVal == "ImgRefreshPerson") {

                                     document.getElementById('ImgRefreshPerson').disabled = true;
                                     document.getElementById('ImgRefreshDownPerson').disabled = true;
                                     document.getElementById('MaskedDiv').style.display = 'none';
                                     document.getElementById('ModalPopupDiv').style.display = 'none';

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
                                     LastSelectedRow = '';
                                 }

                                 if (StrVal != "Search")
                                     $get(MasterObj + "SearchRowIndex").value = "";

                                 $get(MasterObj + "txtSubmit").value = "";
                             }
                             </script>
<script language="javascript" type="text/javascript">
    var MasterObj = "ctl00_ContentPlaceHolder1_";

    /////-------------------------------------------
    </script>
     <table scroll="no">
        <tr>
            <td align="right" valign="top">
            
                <table style=" width: 715px;">
                    <tr>
                        <td id="tdFilter" valign="top" style="height: 38px">
                             <table style="width: 100%">
                                                                
                                <tr>
                                    <td style="width: 82px"  > پرسنلی :</td>
                                    <td style="width: 203px" >
                        <input type="text"  ID="txtPersonCode"  onblur="onblurtxt('cmbPersonName','txtPersonCode')"
                                            runat="server" width="120px" onkeydown="OnKeyDownInt(this)"/>
                        
                            
                            </td>
                                    <td style="width: 125px" >نام خانوادگی و نام :</td> 
                                    <td >
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                                                                <ContentTemplate>
                       <asp:DropDownList onchange="onChangecmb('cmbPersonName','txtPersonCode')"   ID="cmbPersonName" 
                                            runat="server" width="160px">
                           
                        </asp:DropDownList>
                        <img id="ImgRefreshPerson" alt="به روزرساني نام" 
                                                                                        onclick="onClickImgRefreshPerson()" 
                                                                                        src="../../../App_Utility/Images/Icons/Refresh1.png" />
                                                                                </ContentTemplate>
                                                                                <Triggers>
                                                                                <asp:AsyncPostBackTrigger ControlID="ImgRefreshPersonSubmit" EventName="click" />
                                                                                </Triggers>
                                                                            </asp:UpdatePanel>
                        
                            
                                    </td>
                                </tr>
                                
                                 <tr>
                                    <td style="width: 82px"  >کد سرور :</td>
                                    <td style="width: 203px" >  
                        <input type="text"  ID="txtServerCode"  onblur="onblurtxt('cmbServerName','txtServerCode')"
                                            runat="server" width="120px" onkeydown="OnKeyDownInt(this)"/>
                        
                            
                            </td>
                                    <td style="width: 125px" >نام سرور :</td> 
                                    <td >
                        
                       <asp:DropDownList onchange="onChangecmb('cmbServerName','txtServerCode')"  ID="cmbServerName" 
                                            runat="server" Width="160px">
                           
                        </asp:DropDownList>
                            
                                    </td>
                                </tr>
                             </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="height: 16px">
                         
                         
                            <uc1:ToolBar ID="OToolBar" runat="server" PageName="DefineSysAdmin.aspx" 
                                PageID="1109" />
                        
                         
                        

                         </td>
                    </tr>
                    <tr>
                        <td id="tdGrid"  align="center" valign="top" style="height: 273px">
                        
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">    
                            
                                <ContentTemplate> 
                                
                                    
                                    <div style="DISPLAY: none">
                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                        <asp:HiddenField ID="txtCurPage" runat="server" />
                                        <asp:HiddenField ID="lblFrom" runat="server" />
                                        <asp:HiddenField ID="lblTo" runat="server" />
                                        <asp:HiddenField ID="lblTotal" runat="server" />
                                        <asp:HiddenField ID="hdnSysAdminId" runat="server" />
                                        <asp:HiddenField ID="txtSearch" runat="server" />
                                        <asp:HiddenField ID="Totalpage" runat="server" />
                                        <asp:HiddenField ID="SearchRowIndex" runat="server" />
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
                        <td align="center" valign="top">
                        
                            <hr style="width: 574px" />
                            
                             
                        </td>
                    </tr>
                    <tr >
                    <td id="tdNew" align="center">
                    <table >
                    <tr><td>
                    
                    <table>
                    <tr>
                    
                    <td style="width: 86px">پرسنلی:</td> 
                    <td style="width: 232px"><input type="text" onblur="onblurtxt('cmbDownPersonName','txtDownPersonCode')" onkeydown="OnKeyDownInt(this)" runat="server" id="txtDownPersonCode" /></td>
                    <td style="width: 114px">نام خانوادگی و نام</td>
                    <td style="width: 190px">
                    
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                                                <ContentTemplate>
                    <asp:DropDownList onchange="onChangecmb('cmbDownPersonName','txtDownPersonCode')"  ID="cmbDownPersonName" 
                                            runat="server" Width="160px">
                           
                        </asp:DropDownList>
                        <img id="ImgRefreshDownPerson" alt="به روزرساني نام" 
                                                                                        onclick="onClickImgRefreshPerson()" 
                                                                                        src="../../../App_Utility/Images/Icons/Refresh1.png" />
                                                                                </ContentTemplate>
                                                                                <Triggers>
                                                                                <asp:AsyncPostBackTrigger ControlID="ImgRefreshPersonSubmit" EventName="click" />
                                                                                </Triggers>
                                                                            </asp:UpdatePanel>
                    </td>
                    
                    </tr>
                    <tr>
                    
                    <td style="width: 86px">کد سرور:</td> 
                    <td style="width: 232px"><input  type="text" id="txtDownServerCode" runat="server" maxlength="3" onkeydown="OnKeyDownInt(this)"/></td>
                    <td style="width: 114px">نام سرور:</td>
                    <td style="width: 159px">
                    <input type="text" runat="server" id="txtDownServerName" style="width: 160px" />
                    
                    </td>
                    
                    </tr>
                    <tr>
                    
                    <td style="width: 86px">تاریخ انتساب:</td>
                    <td style="width: 232px">
                        <uc2:KCalendar ID="CalSDate" runat="server" />
                        </td>
                    <td style="width: 114px">تاریخ خاتمه:</td>
                    <td style="width: 159px">
                    <uc2:KCalendar ID="CalEDate" runat="server" />
                    </td>
                    
                    </tr> 
                    </table>
                    <table> 
                    <tr>
                     <td> <input type="checkbox" runat="server" id="chkEnable"   onclick="onclickchkEnable()" /></td>
                    <td>  <input type="radio" runat="server" disabled="disabled" name="type"   id="rdbAdminDepartment" /></td>
                    <td style="width: 276px">  ایجاد واحد سازمانی مدیرعامل</td>
                    <td><input type="radio" runat="server" disabled="disabled" name="type"  id="rdbsubDepartment" /> </td>
                    <td> ایجاد واحد سازمانی زیر مجموعه مدیرعامل</td>
                    </tr>
                    </table>
                    
                    </td></tr>
                    <tr><td>
                    
                    </td></tr>
                    </table>
                    
                    </td>
                    </tr>
                    </table>
                
                 <div style="DISPLAY: none">
                 <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                    <input type="text" id="txtTmpPersonCode" name="txtTmpPersonCode" runat="server" />
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
                    <input type="text" id="Active" runat="server" />
                    <input type="text" runat="server" id="txtSaveXml" />
                    <input type="text" runat="server" id="txtIssysAdmin" />
                    <input type="text" runat="server" id="txtOnLineUser" />
                    <input type="text" id="txtSysAdminID" runat="server" />
                   <input type="text"  ID="hdnPersonCode" runat="server" />
                   <input type="text"  ID="hdnServerCode" runat="server" />
                   <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" onclick="BtnSubmit_Click" />
                   <asp:Button ID="ImgRefreshPersonSubmit" runat="server"  onclick="ImgRefreshPersonSubmit_Click" />
                </div>
                
            </td>
        </tr>
     </table>
     
     <script language="javascript">

         //*************************************Declaration*************************************
         var str = "";
         var MasterObj = "ctl00_ContentPlaceHolder1_";
         var PersonCode = "0";
         var LastSelectedRow = null;
         var LastSelectedRowClass = "";
         //*************************************EndDeclaration*************************************

         //*************************************OnLoad*************************************
         document.body.attachEvent('onkeydown', SetEnter)
         document.body.attachEvent('onkeypress', SetEnter)
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
             var TotalPage = parseInt($get(MasterObj + "lblTotal").value) / parseInt($get(MasterObj + "txtPageSize").value)
             if (parseInt($get(MasterObj + "lblTotal").value) % parseInt($get(MasterObj + "txtPageSize").value) != 0)
                 TotalPage++;
             if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                    document.getElementById("OToolBar_txtCurPage").value != "0") {
                 if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                     document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
                     document.getElementById(MasterObj + "txtSubmit").value = "Const";
                     document.getElementById(MasterObj + "BtnSubmit").click();
                 }
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
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNew() {
            clearAll()
            document.getElementById(MasterObj + "txtDownPersonCode").focus();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function clearAll() {
            document.getElementById(MasterObj + "txtSysAdminID").value=""
            document.getElementById(MasterObj + "txtDownServerCode").readOnly = ""
            document.getElementById(MasterObj + "chkEnable").disabled = false 
            document.getElementById(MasterObj +"rdbAdminDepartment").checked = false
            document.getElementById(MasterObj +"rdbsubDepartment").checked=false
            document.getElementById(MasterObj + "chkEnable").checked=false
            onclickchkEnable()
            
            document.getElementById(MasterObj + "txtDownServerCode").value = "";
            document.getElementById(MasterObj + "txtDownPersonCode").value="";
            document.getElementById(MasterObj + "txtDownServerName").value = "";
            document.getElementById(MasterObj + "cmbDownPersonName").value="0";
             
            document.getElementById(MasterObj + "CalEDate_txtYear").value = "";
            document.getElementById(MasterObj + "CalEDate_txtMonth").value = "";
            document.getElementById(MasterObj + "CalEDate_txtDay").value = "";
            document.getElementById(MasterObj + "CalSDate_txtYear").value = "";
            document.getElementById(MasterObj + "CalSDate_txtMonth").value = "";
            document.getElementById(MasterObj + "CalSDate_txtDay").value = "";
           
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            var str = ""
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            if (checkNotEmpty() == true) {
                var SDate = ""
                var EDate = ""
                SDate = document.getElementById(MasterObj + "CalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "CalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "CalSDate_txtDay").value
                EDate = document.getElementById(MasterObj + "CalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "CalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "CalEDate_txtDay").value
                if (SDate == "//")
                    SDate = ""
                if (EDate == "//")
                    EDate = ""
                
                var sysAdminType="0"
                if (document.getElementById(MasterObj + "chkEnable").checked == true) {
                    if (document.getElementById(MasterObj +"rdbAdminDepartment").checked == true)
                        sysAdminType = "2"
                    else if (document.getElementById(MasterObj +"rdbsubDepartment").checked == true)
                        sysAdminType = "1"
                }
                str = str + "<sysAdmin>"
                str = str + "<serverCode>" + document.getElementById(MasterObj + "txtDownServerCode").value + "</serverCode>"
                str = str + "<serverName>" + document.getElementById(MasterObj + "txtDownServerName").value + "</serverName>"
                str = str + "<PersonCode>" + document.getElementById(MasterObj + "txtDownPersonCode").value + "</PersonCode>"
                str = str + "<SDate>" + SDate + "</SDate>"
                str = str + "<EDate>" + EDate + "</EDate>"
                str = str + "<sysAdminType>" + sysAdminType + "</sysAdminType>"
                str = str + "<CreatorID>" + document.getElementById(MasterObj + "txtOnLineUser").value + "</CreatorID>"
//                str = str + "<CreatorDate>" + document.getElementById(MasterObj + "txtOnLineUser").value + "</CreatorDate>"
//                str = str + "<CreatorTime>" + document.getElementById(MasterObj + "txtOnLineUser").value + "</CreatorTime>"
                str = str + "</sysAdmin>"

                document.getElementById(MasterObj + "txtSaveXml").value = '<Root>' + str + '</Root>'
//                alert(document.getElementById(MasterObj + "txtSaveXml").value)
               document.getElementById(MasterObj + "txtSubmit").value = "Save";
               document.getElementById(MasterObj + "BtnSubmit").click();
           }
            
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function checkNotEmpty() {
            var SDate = document.getElementById(MasterObj + "CalSDate_txtYear").value + document.getElementById(MasterObj + "CalSDate_txtMonth").value + document.getElementById(MasterObj + "CalSDate_txtDay").value
            var EDate = document.getElementById(MasterObj + "CalEDate_txtYear").value + document.getElementById(MasterObj + "CalEDate_txtMonth").value + document.getElementById(MasterObj + "CalEDate_txtDay").value
            
            if (document.getElementById(MasterObj + "txtDownServerCode").value == "") {
                $get(MasterObj + "txtAlert").value = "وارد کردن کد سرور الزامی است"
                alert($get(MasterObj + "txtAlert").value)
                return false;
            }
            else if (document.getElementById(MasterObj + "txtDownServerCode").value.length!= 3) {
                $get(MasterObj + "txtAlert").value = "کد سرور باید سه رقمی باشد"
                alert($get(MasterObj + "txtAlert").value)
                return false;
            }
            else if (document.getElementById(MasterObj + "txtDownServerName").value == "") {
                $get(MasterObj + "txtAlert").value = "وارد کردن نام سرور الزامی است"
                alert($get(MasterObj + "txtAlert").value)
                return false;
            }
            else if (document.getElementById(MasterObj + "txtDownPersonCode").value == "") {
                $get(MasterObj + "txtAlert").value = "انتخاب کد پرسنلی الزامی است"
                alert($get(MasterObj + "txtAlert").value)
                return false;
            }
            else if (document.getElementById(MasterObj + "CalSDate_txtYear").value == "") {
                $get(MasterObj + "txtAlert").value = "وارد کردن تاريخ انتساب الزامی است"
                alert($get(MasterObj + "txtAlert").value)
                return false;
            }
            else if (EDate!="" & SDate > EDate)
            {
                $get(MasterObj + "txtAlert").value = "تاريخ خاتمه بايد بزرگتر از تاريخ شروع باشد"
                alert($get(MasterObj + "txtAlert").value)
                return false;
            }
            else if (document.getElementById(MasterObj + "txtIssysAdmin").value == "1") {
                if (document.getElementById(MasterObj + "txtSysAdminID").value == "") {
                    if (document.getElementById(MasterObj + "chkEnable").checked == true) {
                        //alert(document.getElementById(MasterObj + "chkEnable").checked)
                        if (document.getElementById(MasterObj +"rdbAdminDepartment").checked == true) {
                            $get(MasterObj + "txtAlert").value = "یک واحد سازمانی مدیر عامل در سیستم وجود دارد"
                            SetMsg($get(MasterObj + "txtAlert").value);
                            //animatedPopup()
                            return false;
                        }
                        else
                            return true;
                    }
                    else
                        return true;
                }
            }
            return true;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnDel() {
            if (LastSelectedRow != null) {
                var Msg = "آیا برای حذف مطمئنید؟"
                if (confirm(Msg) == true) {
                    document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
                    document.getElementById(MasterObj + "txtSubmit").value = "Delُ";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else {
                alert("به منظور حذف یک سطر را انتخاب کنید")
            }
        }
         //*************************************EndToolbar*************************************

         //*************************************ThisPage***************************************
         function SetEnter() {
             if (event.srcElement.id == "OToolBar_txtCurPage")
                 return;
              if (window.event.keyCode == 13)
                  if (event.srcElement.id == MasterObj + "cmbServerName" || event.srcElement.id == MasterObj + "txtPersonCode" || event.srcElement.id == MasterObj + "cmbPersonName" || event.srcElement.id == MasterObj + "txtServerCode") {                   
                     OnClickBtnSearch()
                 }
                 else
                     window.event.keyCode = 9
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OnClickBtnSearch() {
             document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
             document.getElementById(MasterObj + "hdnPersonCode").value = document.getElementById(MasterObj + "txtPersonCode").value
             document.getElementById(MasterObj + "hdnServerCode").value = document.getElementById(MasterObj + "txtServerCode").value
             document.getElementById(MasterObj + "txtSubmit").value = "Search";
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
                 $get(MasterObj + "SearchRowIndex").value = "";
             }   
             LoadData();
         }         
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function onclickchkEnable() {
             document.getElementById(MasterObj +"rdbAdminDepartment").disabled = !document.getElementById(MasterObj + "chkEnable").checked
             document.getElementById(MasterObj +"rdbsubDepartment").disabled = !document.getElementById(MasterObj + "chkEnable").checked
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function LoadData() {
             document.getElementById(MasterObj + "txtSysAdminID").value = LastSelectedRow.SysAdminID

             document.getElementById(MasterObj + "txtDownPersonCode").value = LastSelectedRow.cells(0).innerText
             onblurtxt('cmbDownPersonName', 'txtDownPersonCode')
             document.getElementById(MasterObj + "txtDownServerCode").value = LastSelectedRow.cells(2).innerText
             document.getElementById(MasterObj + "txtDownServerName").value = LastSelectedRow.cells(3).innerText

             document.getElementById(MasterObj + "CalEDate_txtYear").value = LastSelectedRow.cells(5).innerText.substring(6, 10);
             document.getElementById(MasterObj + "CalEDate_txtMonth").value = LastSelectedRow.cells(5).innerText.substring(3, 5);
             document.getElementById(MasterObj + "CalEDate_txtDay").value = LastSelectedRow.cells(5).innerText.substring(0, 2);

             document.getElementById(MasterObj + "CalSDate_txtYear").value = LastSelectedRow.cells(4).innerText.substring(6, 10);
             document.getElementById(MasterObj + "CalSDate_txtMonth").value = LastSelectedRow.cells(4).innerText.substring(3, 5);
             document.getElementById(MasterObj + "CalSDate_txtDay").value = LastSelectedRow.cells(4).innerText.substring(0, 2);
             document.getElementById(MasterObj + "chkEnable").disabled = true
             if ((LastSelectedRow.BaseDept == 1) || (LastSelectedRow.BaseDept == 2)) {
                 {
                     document.getElementById(MasterObj + "txtDownServerCode").readOnly = "readOnly"
                 }
                 document.getElementById(MasterObj + "chkEnable").checked = true

                 document.getElementById(MasterObj + "rdbsubDepartment").disabled = true
                 document.getElementById(MasterObj + "rdbAdminDepartment").disabled = true

                 if (LastSelectedRow.BaseDept == 1) {
                     document.getElementById(MasterObj + "rdbsubDepartment").checked = true
                 }
                 else if (LastSelectedRow.BaseDept == 2) {
                     document.getElementById(MasterObj + "rdbAdminDepartment").checked = true
                 }
             }
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function OndbClickGrd() {
             if (LastSelectedRow != null) {
                 clearAll()

                 LoadData();
             }
             else {
                 $get(MasterObj + "txtAlert").value = "به منظور ویرایش یک سطر را انتخاب کنید"
                 alert($get(MasterObj + "txtAlert").value)
             }
         }
         //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         function onClickImgRefreshPerson() {
             OpenModelPopup();
             document.getElementById(MasterObj + "txtSubmit").value = "ImgRefreshPerson";
             document.getElementById(MasterObj + "ImgRefreshPersonSubmit").click();
         }
         //**********************************EndThisPage*************************************
      </script>

</asp:Content>
