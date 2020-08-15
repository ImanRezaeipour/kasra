<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefineHoliday.aspx.cs" MasterPageFile="../../../App_Utility/MasterPage/MasterBule.master" Inherits="FrmPresentation.App_Pages.BaseInfo.Holiday.DefineHoliday1" ValidateRequest="false" %>

<%@ Register src="../../../App_Utility/Calendar/KCalendar.ascx" tagname="KCalendar" tagprefix="uc2" %>

<%@ Register src="../../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <title></title>
    
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";

    </script>
    
    <table scroll="no">
        <tr>
            <td align="right" valign="top">
            
                <table style="height: 499px; width: 800px;">
                    <tr>
                        <td valign="top" style="height: 38px">
                             <table style="width: 100%">
                                                                
                                <tr>
                                    <td style="width: 58px">ازتاريخ:</td>
                                    <td style="width: 112px">
                                        <uc2:KCalendar ID="KCalSDate" runat="server" />
                                    </td>
                                    <td style="width: 58px">تاتاريخ:</td>
                                    <td style="width: 117px">
                                        <uc2:KCalendar ID="KCalEDate" runat="server" />
                                    </td>
                                    <td style="width: 58px">&nbsp;نوع:</td>
                                    <td style="width: 53px">
                        
                                        <asp:DropDownList ID="CmbHolidayType" 
                                            runat="server" Width="100px">
                        </asp:DropDownList>
                                                            </td>
                                    <td style="width: 113px">شرح:</td>
                                    <td style="width: 231px">
                                        <asp:TextBox ID="txtDescr" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                             </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="height: 16px">
                        
                            <uc1:ToolBar ID="OToolBar" runat="server"   GridID="41" 
                                PageName="DefineHoliday.aspx" PageID="1133"/>
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
                                //$get(MasterObj + "txtAlert").value = Stalert($get(MasterObj + "txtAlert").value)rVal
                               
                                if ($get(MasterObj + "txtAlert").value != "")
                                    SetMsg($get(MasterObj + "txtAlert").value);

                                $get(MasterObj + "txtSubmit").value = "";
                                $get(MasterObj + "txtAlert").value = "";
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
                            </script>

                         </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" style="height: 364px">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">    
                            
                                <ContentTemplate> 
                                
                                    <div style="DISPLAY: none">
                                        <asp:HiddenField ID="Totalpage" runat="server" />
                                        <asp:HiddenField ID="txtAlert" runat="server" />
                                        <asp:HiddenField ID="txtSaveXml" runat="server" />
                                        <asp:HiddenField ID="txtCurPage" runat="server" />
                                        <asp:HiddenField ID="txtSearch" runat="server" />
                                        <asp:HiddenField ID="lblFrom" runat="server" />
                                        <asp:HiddenField ID="lblTo" runat="server" />
                                        <asp:HiddenField ID="lblTotal" runat="server" />
                                        <asp:HiddenField ID="txtCmbHolidayTypeValue" runat="server" />
                                        <asp:HiddenField ID="txtHolidayID" runat="server" />
                                        
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
                        <td>
                            <hr style="width: 447px" />
                            <table style="width: 100%; height: 21px;">
                                <tr>
                                    <td style="width: 55px">
                                        نوع :</td>
                                    <td style="width: 152px">
                                        <asp:DropDownList ID="CmbHolidayTypeNew" 
                                            runat="server" Width="100px">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 49px">
                                        تاريخ :
                                    </td>
                                    <td style="width: 132px">
                                        <uc2:KCalendar ID="KCalDateNew" runat="server" />
                                    </td>
                                    <td style="width: 36px">
                                        شرح :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDescrNew" runat="server" TextMode="MultiLine" Width="335px" 
                                            Height="37px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            
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
                    <input type="text" id="txtPageSize" name="txtPageSize" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                </div>
                
            </td>
        </tr>
     </table>
     
    <script language="javascript">

        //*************************************Declaration*************************************
        var str = "";
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
        function OnClickBtnDel() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            if ($get(MasterObj + "txtHolidayID").value != 0 && $get(MasterObj + "txtHolidayID").value!="")
            {
                if (confirm("ايا از حذف مطمئن هستيد؟")) {

                    $get(MasterObj + "txtSubmit").value = "Delete";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
            }
            else
            {
                alert("ابتدا يک سطر انتخاب نماييد")
                return;
            }
        
        }
        function OnClickBtnSave() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            var Date="";
            Date=document.getElementById(MasterObj + "KCalDateNew_txtYear").value + "/" + document.getElementById(MasterObj + "KCalDateNew_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalDateNew_txtDay").value
            if (Date=="//")
                Date="";

            //*****Check valid Data*****
            if ($get(MasterObj + "CmbHolidayTypeNew").value == "" || $get(MasterObj + "CmbHolidayTypeNew").value=="0") {
                alert("نوع را وارد نماييد.")
                return;
            }
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            if (Date == "") {
                alert("تاريخ را وارد نماييد.")
                return;
            }
            //*****End Check valid Data*****

            var xmlStr = "";
            xmlStr += "<Root><Tb>"
            xmlStr += "<Date>" +Date+"</Date>"
            xmlStr += "<Descr>" +$get(MasterObj + "txtDescrNew").value+"</Descr>"
            xmlStr += "<HodidayType>" +$get(MasterObj + "CmbHolidayTypeNew").value+"</HodidayType>"
            xmlStr += "<HolidayID>" + $get(MasterObj + "txtHolidayID").value + "</HolidayID>"
            xmlStr += "</Tb></Root>"

            document.getElementById(MasterObj + "txtSaveXml").value = xmlStr;
            document.getElementById(MasterObj + "txtSubmit").value = "Save";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        
        //*************************************EndToolbar*************************************

        //*************************************ThisPage***************************************
        function OnClickBtnNew() {
            $get(MasterObj + "CmbHolidayTypeNew").value = "0";
            $get(MasterObj + "txtDescrNew").value = "";
            $get(MasterObj + "CmbHolidayTypeNew").value = "0";
            //-----------
            $get(MasterObj + "KCalDateNew_txtYear").value = "";
            $get(MasterObj + "KCalDateNew_txtMonth").value = "";
            $get(MasterObj + "KCalDateNew_txtDay").value = "";
            //-----------
        }
        
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFilter() {
            document.getElementById(MasterObj + "txtAcCode").value = GetAccessCode(window.event.srcElement) 
            //-------------------------            
            $get(MasterObj + "SDate").value = document.getElementById(MasterObj + "KCalSDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalSDate_txtDay").value
            $get(MasterObj + "EDate").value = document.getElementById(MasterObj + "KCalEDate_txtYear").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtMonth").value + "/" + document.getElementById(MasterObj + "KCalEDate_txtDay").value
            if ($get(MasterObj + "SDate").value == "//")
                $get(MasterObj + "SDate").value = ""
            if ($get(MasterObj + "EDate").value == "//")
                $get(MasterObj + "EDate").value = ""
            //-------------------------
            $get(MasterObj + "txtCmbHolidayTypeValue").value = document.getElementById(MasterObj + "CmbHolidayType").value
            if ($get(MasterObj + "txtCmbHolidayTypeValue").value == "")
                $get(MasterObj + "txtCmbHolidayTypeValue").value = "0";


            var str = ""
            str += "<Root><Tb>"
            str += "<SDate>" + $get(MasterObj + "SDate").value + "</SDate>"
            str += "<EDate>" + $get(MasterObj + "EDate").value + "</EDate>"
            str += "<Descr>" + $get(MasterObj + "txtDescr").value + "</Descr>"
            str += "<HodidayType>" + $get(MasterObj + "txtCmbHolidayTypeValue").value + "</HodidayType>"
            str += "</Tb></Root>"

            $get(MasterObj + "txtSearch").value = str
            //-------------------
            $get(MasterObj + "txtSubmit").value = "Filter";
            document.getElementById(MasterObj + "BtnSubmit").click();
 

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickGrdHoliday(SelectedRow) {
          try {
                if (LastSelectedRow != "")
                    SelectedRow.parentElement.rows(parseInt(LastSelectedRow)).style.backgroundColor = "";
                LastSelectedRow = SelectedRow.rowIndex;
                SelectedRow.style.backgroundColor = "#FFFFCC";
                //****LoadDate In Controls************************************************************
                $get(MasterObj + "CmbHolidayTypeNew").value = SelectedRow.getAttribute('Type');
                $get(MasterObj + "txtDescrNew").value = SelectedRow.cells(3).innerText;
                $get(MasterObj + "txtHolidayID").value = SelectedRow.getAttribute('HolidayID');
                
                //-----------
                var Date = SelectedRow.cells(1).innerText;
                $get(MasterObj + "KCalDateNew_txtYear").value = Date.substring(6, 10);
                $get(MasterObj + "KCalDateNew_txtMonth").value = Date.substring(3, 5);
                $get(MasterObj + "KCalDateNew_txtDay").value = Date.substring(0, 2);
                //-----------
                //****End LoadDate In Controls************************************************************
            }
            catch (e)
          { }
        }
        //**********************************EndThisPage*************************************
      </script>
     
</asp:Content>