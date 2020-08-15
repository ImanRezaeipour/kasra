<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemRename.aspx.cs" Inherits="FrmPresentation.App_Pages.Main.ItemRename" validateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
   <title>____________تفيير نام____________________</title>
    <script type="text/javascript" language="javascript">
    /*---------------------------------------------------------------------*/
    function btnSaveOnclick() {
        if (form1.txtItemName.value != '') 
        {
            MakeXmlRenameMenuItem()
            document.getElementById("txtSubmit").value = "Save"
            form1.submit();
        }
    }
    /*---------------------------------------------------------------------*/
    function MakeXmlRenameMenuItem() {
        var strxml = "<DesktopEntity><DesktopMenu>"
        strxml += "<MenuItemID>" + document.getElementById("txtMenuItemID").value + "</MenuItemID>"
        strxml += "<MenuTitle>" + document.getElementById("txtItemName").value + "</MenuTitle>"
        strxml += "</DesktopMenu></DesktopEntity>"
        form1.txtxmlRename.value = strxml
    }
    /*---------------------------------------------------------------------*/
    function OnClickBtnCancel() {
        if (document.getElementById("txtAlertSave").value == '')
            window.returnValue = ''
        else
            window.returnValue = document.getElementById("txtItemName").value
        window.close()
    }
    /*---------------------------------------------------------------------*/
    function onload()
    {
        window.name = "ItemRename"
        form1.target= window.name
    }
    /*---------------------------------------------------------------------*/
    </script>
</head>
<body onload="onload()" onunload="OnClickBtnCancel()">
    <form id="form1" runat="server">
    <div>
    
									<table  id="Page" dir="rtl" style="WIDTH: 235px; HEIGHT: 122px" 
										cellspacing="1" cellpadding="1" width="235" border="0">
										<tr valign="top">
											<td id="TopRow" style="DISPLAY: inline; HEIGHT: 52px"  align="right">
												<table id="Table1" style="WIDTH: 266px; HEIGHT: 32px" height="32" cellspacing="1" cellpadding="1"
													width="266" align="right" border="0">
													<tr>
														<td style="WIDTH: 64px" align="center">نام</td>
														<td>
														<input type="text" runat="server" id="txtItemName" Width="170px" CssClass="txtControls" />
														</td>
													</tr>
													<tr>
														<td vAlign="bottom" align="center" colSpan="2">
															<HR class="CssHorizontalLine" style="WIDTH: 76.99%; HEIGHT: 2px" SIZE="2">
															<table id="Table2" style="WIDTH: 158px; HEIGHT: 46px" cellspacing="2" cellpadding="2" width="158"
																border="0">
																<tr>
																	<td style="WIDTH: 65px"><input class="CssbtnSave" id="btnSave" onclick="btnSaveOnclick()" type="button" name="btnSave"
																			runat="server"></td>
																	<td>
																	<input class="CssBtnCancel" id="btnCancel" onclick="OnClickBtnCancel()" type="button" name="btnCancel"></TD>
																</tr>
															</table>
															&nbsp;</td>
													</tr>
												</table>
										
								
					</td>
				</tr>
				<tr>
					<td style="DISPLAY: none" align="right">
					<input id="txtxmlRename" type="text" name="txtxmlRename" runat="server">
						<input id="txtMenuItemID" type="text" name="txtMenuItemID" runat="server" /> 
						 <input id="txtAlertSave" type="text" name="txtAlertSave" runat="server" />
						 <input type="text" id="txtSubmit" runat="server" />
					</td>
				</tr>
			</table>
    </div>
    </form>
</body>
</html>
