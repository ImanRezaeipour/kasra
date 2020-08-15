<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestPopup.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.TestPopup" 
MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" ValidateRequest="false"%>

<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .imageClick
        {
        	background-color:Red;
        }
        .StructClick
        {
            background-color:#D3D3E7;
        }
        .StructunClick
        {
            background-color:White ;
        }
        
        .CssPage
{
     
    border-style:solid;           
    border-right-color :#6495ed;        
    border-top-color  :#87cefa;        
    border-bottom-color :#6495ed;   
    border-left-color :#87cefa;          
    background :#e7eeff;   
    border-width :2px
}

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../../App_Utility/Scripts/SHDate.js" type="text/javascript"></script>
    <asp:ScriptManager ID="ScriptManager1"  AsyncPostBackTimeout="40000000" runat="server">
    </asp:ScriptManager>
    <table style="width:100%">
        <tr>
            <td>
            
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table width=70% id="grdPerson">
                            <tr style="background-color:Blue">
                                <td>
                                    شماره پرسنلي
                                </td>
                                <td>
                                
                                </td>
                                <td>
                                    گروه مجوز
                                </td>
                                <td>
                                    نوع مجوز
                                </td>
                                <td>
                                
                                </td>
                            </tr>
                            <tr style="background-color:Yellow">
                                <td>
                                    <input type="text" />
                                </td>
                                <td>
                                
                                </td>
                                <td>
                                    <input type="text" style="width:80px" />
                                </td>
                                <td>
                                    <input type="text" style="width:80px" ondblclick="ShowCodes(this)" onkeyup=EnterCode(this) /><input type="text" style="width:80px" />
                                </td>
                                <td>
                                
                                </td>
                            </tr>
                            <tr style="background-color:Green">
                                <td>
                                    <input type="text" />
                                </td>
                                <td>
                                
                                </td>
                                <td>
                                    <input type="text" style="width:80px" />
                                </td>
                                <td>
                                    <input type="text" style="width:80px" ondblclick="ShowCodes(this)" onkeyup=EnterCode(this) /><input type="text" style="width:80px" />
                                </td>
                                <td>
                                
                                </td>
                            </tr>
                            <tr style="background-color:Yellow">
                                <td>
                                    <input type="text" />
                                </td>
                                <td>
                                
                                </td>
                                <td>
                                    <input type="text" style="width:80px" />
                                </td>
                                <td>
                                    <input type="text" style="width:80px" ondblclick="ShowCodes(this)" onkeyup=EnterCode(this) /><input type="text" style="width:80px" />
                                </td>
                                <td>
                                
                                </td>
                            </tr>
                            <tr style="background-color:Green">
                                <td>
                                    <input type="text" />
                                </td>
                                <td>
                                
                                </td>
                                <td>
                                    <input type="text" style="width:80px" />
                                </td>
                                <td>
                                    <input type="text" style="width:80px" ondblclick="ShowCodes(this)" onkeyup=EnterCode(this) /><input type="text" style="width:80px" />
                                </td>
                                <td>
                                
                                </td>
                            </tr>
                        </table>
                        <div style="display:none">
                            <input type="text" id="txtXmlPersonCode" name="txtXmlPersonCode" runat="server" />
                        </div>
                        
                        <div id="divCodePopup" style="height:400px;width:350px;display:none">
                            <TABLE class="CssPage" id="Table9" height="100%" cellSpacing="1" cellPadding="1" width="100%"
								border="0">
								<TR>
									<TD id="RowFrame" style="DISPLAY: inline" align="center">
										<DIV class="DivStyle" style="WIDTH: 100%; HEIGHT: 100%" align="right">
											<TABLE id="XTabTable_Header" style="WIDTH: 100%; HEIGHT: 35px">
												<THEAD style="DISPLAY: inline">
													<TR class="ShoperHeaderStyle">
														<TD class="Headerstyle" align="center" width="60">ShortKey</TD>
														<TD class="Headerstyle" align="center" width="100">CodeID</TD>
														<TD class="Headerstyle" align="center" width="190">CodeName</TD>
													</TR>
												</THEAD>
											</TABLE>
											<DIV class="DivStyle" style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; WIDTH: 100%; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 90%"
												align="center">
												<TABLE id="XTabTable" style="WIDTH: 100%; " borderColor="gainsboro" cellSpacing="0"
													cellPadding="0" bgColor="#fff2cb" border="1" ondblclick="XTabTableDblClick(this)" onclick="onclickGrd()" onkeydown="XTabTableOnkeyDown(this)">
													<THEAD style="DISPLAY: none">
														<TR>
															<TD align="center"></TD>
															<TD align="center"></TD>
															<TD align="center"></TD>
														</TR>
													</THEAD>
												</TABLE>
											</DIV>
										</DIV>
									</TD>
								</TR>
							</TABLE>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            
            </td>
        </tr>
    </table>
    
    
    
    
    
    
    <div style="display: none">
         
    </div>

    <script language="javascript" type="text/javascript">
       
        var gridRowIndex=null
        //alert(document.getElementById(MasterObj + "txtXmlPersonCode").value)
        var LastSelectedRow = ""
        
        var XTabTableRow=0
        
        
        function ShowCodes(obj) {
            var oRow = obj.parentElement.parentElement
            gridRowIndex = oRow.rowIndex

            //grdPerson.disabled = true
            
            Cleargrd(XTabTable)
            
            if (oRow.cells(0).firstChild.value == "") {
                alert("Empty PersonCode")
                return
            }
            else if (oRow.cells(2).firstChild.value == "") {
                alert("Empty GroupCode")
                return
            }

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false";
            oXmlDoc.loadXML($get(MasterObj + 'txtXmlPersonCode').value)

            if (obj.value=="")
                var XmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/PersonCodes[PersonCode=" + oRow.cells(0).firstChild.value + "][GroupCodeID=" + oRow.cells(2).firstChild.value + "]");
            else
                var XmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/PersonCodes[PersonCode=" + oRow.cells(0).firstChild.value + "][GroupCodeID=" + oRow.cells(2).firstChild.value + "][ShortKey=" + obj.value + "]");

            if (XmlNodes.length != 0) {
                for (var i = 0; i < XmlNodes.length; ++i) {
                    var oRowX = XTabTable.insertRow()
                    var oCell1 = oRowX.insertCell()
                    var oCell2 = oRowX.insertCell()
                    var oCell3 = oRowX.insertCell()

                    oCell1.innerText = XmlNodes.item(i).selectSingleNode('ShortKey').text
                    oCell2.innerText = XmlNodes.item(i).selectSingleNode('CodeID').text
                    oCell3.innerText = XmlNodes.item(i).selectSingleNode('CodeName').text

                    oRowX.align = "center"
                    oRowX.style.height="25px"
                    
                    oCell1.style.width = "60px"
                    oCell2.style.width = "100px"
                    oCell3.style.width = "190px"
                }
            }
            
            
            var Y = event.screenY
            var X = event.screenX
            
//            var oPopupBody = oPopup.document.body
//            oPopupBody.className = "CssPage"
//            oPopupBody.style.backgroundColor = "#e7eeff"
//            oPopupBody.dir = "rtl"
//            oPopup.document.body.innerHTML = divCodePopup.innerHTML
//            var heightPopUp = XmlNodes.length
//            heightPopUp = 400
//            
//            var Y = event.screenY
//            var X = event.screenX
//            oPopup.show(X/2, Y/2, 350, heightPopUp)

            divCodePopup.style.display = "inline"
            divCodePopup.style.position = "absolute"
            divCodePopup.style.top = Y / 2
            divCodePopup.style.right = X / 2
            
            
            SelectRow(XTabTableRow)

            

        }
        /////////////////////////////////////////////////////////////////////////////////////
        function XTabTableOnkeyDown(obj) {
            if (event.keyCode == 40) {
                if (XTabTableRow < XTabTable.rows.length - 1) {
                    XTabTableRow = XTabTableRow + 1
                    SelectRow(XTabTableRow)
                }
            }
            else if (event.keyCode == 38) {
                if (XTabTableRow > 0) {
                    XTabTableRow = XTabTableRow - 1
                    SelectRow(XTabTableRow)
                }
            }
            else if (event.keyCode == 13) {
                divCodePopup.style.display="none"
                divCodePopup.style.position = ""
                divCodePopup.style.top = ""
                divCodePopup.style.right = ""
                XTabTableRow=0
            }


        }
        /////////////////////////////////////////////////////////////////////////////////////
        function XTabTableDblClick(obj) {
            var oRow = event.srcElement.parentElement

            grdPerson.rows(gridRowIndex).cells(3).childNodes(0).value = oRow.cells(0).innerText
            grdPerson.rows(gridRowIndex).cells(3).childNodes(1).value = oRow.cells(1).innerText

            divCodePopup.style.display = "none"
            divCodePopup.style.position = ""
            divCodePopup.style.top = ""
            divCodePopup.style.right = ""
            XTabTableRow = 0
        }
        /////////////////////////////////////////////////////////////////////////////////////
        function SelectRow(RowNum) {

            
            var SelectedRow = XTabTable.rows(RowNum)

            XTabTable.focus()
            
            var obj;
            obj = XTabTable

            if (LastSelectedRow != "")
                if (parseInt(LastSelectedRow) < obj.rows.length) {
                if (parseInt(LastSelectedRow) % 2 == 0)
                    obj.rows(parseInt(LastSelectedRow)).className = ""
                else
                    obj.rows(parseInt(LastSelectedRow)).className = "";
                //obj.rows(parseInt(LastSelectedRow)).style.backgroundColor = '';
            }

            if (LastSelectedRow == "0")
                if (obj.rows.length > 0)
                obj.rows(parseInt(LastSelectedRow)).className = "";

            LastSelectedRow = SelectedRow.rowIndex;
            SelectedRow.className = "CssSelectedItemStyle";

            grdPerson.rows(gridRowIndex).cells(3).childNodes(0).value = SelectedRow.cells(0).innerText
            grdPerson.rows(gridRowIndex).cells(3).childNodes(1).value = SelectedRow.cells(1).innerText
        }
        
        /////////////////////////////////////////////////////////////////////////////////////
        function Cleargrd(obj) {
            var j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
            newrowindex = 0
        }
        /////////////////////////////////////////////////////////////////////////////////////
        function EnterCode(obj) {
            if (event.keyCode >= 48 && event.keyCode <= 57) {
                if (obj.value.length >= 2) {
                    ShowCodes(obj)
                }
            }
        }
        /////////////////////////////////////////////////////////////////////////////////////
        function onclickGrd() {
            //alert()
            //var oRow = event.srcElement.parentElement
            //gridRowIndex = oRow.rowIndex

            var SelectedRow = event.srcElement.parentElement

            XTabTableRow = SelectedRow.rowIndex
                
            var obj;
            obj = XTabTable

            if (LastSelectedRow != "")
                if (parseInt(LastSelectedRow) < obj.rows.length) {
                if (parseInt(LastSelectedRow) % 2 == 0)
                    obj.rows(parseInt(LastSelectedRow)).className = ""
                else
                    obj.rows(parseInt(LastSelectedRow)).className = "";
                //obj.rows(parseInt(LastSelectedRow)).style.backgroundColor = '';
            }

            if (LastSelectedRow == "0")
                if (obj.rows.length > 0)
                obj.rows(parseInt(LastSelectedRow)).className = "";

            LastSelectedRow = SelectedRow.rowIndex;
            SelectedRow.className = "CssSelectedItemStyle";

            grdPerson.rows(gridRowIndex).cells(3).childNodes(0).value = SelectedRow.cells(0).innerText
            grdPerson.rows(gridRowIndex).cells(3).childNodes(1).value = SelectedRow.cells(1).innerText
        }
        
  </script>  
</asp:Content>

