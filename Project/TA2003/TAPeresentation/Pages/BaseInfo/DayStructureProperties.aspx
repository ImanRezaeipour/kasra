<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DayStructureProperties.aspx.vb" Inherits="TA.DayStructureProperties" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>----------خصوصيات-------------------------</title>
        <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8"  />
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="/Framework/Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		var LastSelectedRow=null
		var LastSelectedRowClass=""
		var lastIndexSelected
		//===================================================================
		function onclickCHK(obj)
		{
			if(obj.checked==false)
				return
			var oGrid=document.getElementById("grdDetailType")
			var ID=""
			var LID
			var Scount=0
			var oRow=obj.parentElement.parentElement
			for (var i = 0; i < oGrid.rows.length; i++) {
			    //------------------------------
			    if (oGrid.rows(i).cells(0).firstChild.checked == true) {
			        Scount++
			    }
			}
			if(Scount>2)
			{
				alert(' انتخاب امکان پذير نمي باشد!')
				obj.checked=false
				return
			}
			
			for(var i=0;i<oGrid.rows.length;i++)
			{
				if(oGrid.rows(i).cells(0).firstChild.checked==true && oGrid.rows(i).cells(0).firstChild!=obj)
				{
					ID=oRow.DetailTypeID
					//oGrid.rows(i).DetailTypeID.toString()
					LID=oGrid.rows(i).DetailTypeID
					switch(LID)
					{
						case '10':
						{
							if(ID==11)
							{
								alert('اين انتخاب امکان پذير نمي باشد!')
								obj.checked=false
								return
							}
							break
						}
						case '11':
						{
							if(ID==10)
							{
								alert('اين انتخاب امکان پذير نمي باشد!')
								obj.checked=false
								return
							}
							break
						}
						default:
						{
							if(ID==11 || ID==10)
							{
								return
							}
							else
							{
								alert('اين انتخاب امکان پذير نمي باشد!')
								obj.checked=false
								return
							}
						}
						
					}
					
				}
			}
		}
		//====================================================================
		function onclickbtnOK()
		{
			try
			{
				var oGrid=document.getElementById("grdDetailType")
				var strXML=""
				strXML+="<BaseInfoEntity>"
				for(var i=0;i<oGrid.rows.length;i++)
					if(oGrid.rows(i).cells(0).firstChild.checked==true)
					{
						strXML+="<GetDetailType><DetailTypeID>"+oGrid.rows(i).DetailTypeID+"</DetailTypeID>"
						strXML+="<Title>"+oGrid.rows(i).cells(1).innerText+"</Title></GetDetailType>"
					}
				strXML+="</BaseInfoEntity>"
				returnValue=strXML
				window.close()
			}
			catch(e)
			{
				
			}
		}
		//=======================================================================
		function onclickBtnCancel()
		{
			window.close()
		}
		//====================================================================
		function onClickgrdDetailType(SelectedRow)
		{
			if(LastSelectedRow!=null)
			{
				LastSelectedRow.className=LastSelectedRowClass;
			}
			LastSelectedRowClass=SelectedRow.className;
			LastSelectedRow=SelectedRow;
			SelectedRow.className="CssSelectedItemStyle";
		}
		//=====================================================================
		function ondblClickgrdDetailType(SelectedRow)
		{
			onclickbtnOK()
		}
		//===================================================================
		function checkGrid()
		{
			var strID=""
			strID=window.dialogArguments
			strID=strID.split(',')
			var oGrid=document.getElementById("grdDetailType")
			for(var i=0;i<oGrid.rows.length;i++)
			{
				for(var j=0;j<strID.length;j++)
				{
					if(oGrid.rows(i).DetailTypeID==strID[j])
					{
						oGrid.rows(i).cells(0).firstChild.checked=true
					}
				}
			}
			
		}
		//====================================================================
		function pageLoad()
		{
			window.name="DayStructureProperties"
			Form1.target=window.name
			checkGrid()
			
		}
		
		</script>
	</HEAD>
	<body dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" onload="pageLoad()" rightMargin="0"
		MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssPage" id="Layer2" height="100%" cellSpacing="0" cellPadding="0" width="100%"
				align="center" border="0">
				<TBODY>
					<TR>
						<TD vAlign="middle" align="center"><TABLE id="Page" style="WIDTH: 228px; HEIGHT: 469px" height="469" cellSpacing="1" cellPadding="1"
								width="228" align="center" border="0">
								<TR>
									<TD id="TopRow" dir="rtl" style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 360px"
										align="center"><cc1:automationgrid id="grdDetailType" dir="rtl" runat="server" Width="206px" name="grdNumResult" AutoGenerateColumns="False"
											ShowHeader="False" UsingKeyBoard="False" Scrolling="True" EnableClientPager="False" ClientSorting="False" CreateClientSideScripts="False"
											SendXML="DoNotSend" ClientPageSize="0" HtcAddress=" " SelectRowOnClick="True" SelectRowOnMouseMove="False" Height="322px">
											<ItemStyle Font-Size="8.5pt" Font-Names="tahoma" HorizontalAlign="Right" CssClass="CssItemStyle"></ItemStyle>
											<HeaderStyle Font-Size="8.5pt" Font-Names="tahoma" Font-Bold="True" HorizontalAlign="Right" CssClass="CssHeaderStyle"></HeaderStyle>
											<AlternatingItemStyle Font-Size="8.5pt" Font-Names="tahoma" HorizontalAlign="Right" CssClass="CssAlternatingItemStyle"></AlternatingItemStyle>
											<FooterStyle CssClass="CssEditItemStyle "></FooterStyle>
											<EditItemStyle Font-Size="8.5pt" Font-Names="tahoma"></EditItemStyle>
											<SelectedItemStyle Font-Size="8.5pt" Font-Names="tahoma" CssClass="CssSelectedItemStyle"></SelectedItemStyle>
											<Columns>
												<asp:BoundColumn Visible="False" DataField="DetailTypeID">
													<HeaderStyle Width="1px"></HeaderStyle>
													<ItemStyle Width="1px"></ItemStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="25px"></HeaderStyle>
													<ItemStyle Width="25px"></ItemStyle>
													<ItemTemplate>
														<input type="checkbox" onclick="onclickCHK(this)">
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="Title" HeaderText="نام">
													<HeaderStyle HorizontalAlign="Center" Width="180px" VerticalAlign="Middle"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center" Width="180px" VerticalAlign="Middle"></ItemStyle>
													<FooterStyle HorizontalAlign="Center" VerticalAlign="Middle"></FooterStyle>
												</asp:BoundColumn>
											</Columns>
										</cc1:automationgrid></TD>
								<TR>
									<TD align="center">
										<HR style="WIDTH: 86.3%; COLOR: black; HEIGHT: 1px" align="center" width="86.3%" SIZE="1">
										<TABLE id="Table1" style="WIDTH: 128px; HEIGHT: 32px" cellSpacing="3" cellPadding="2" width="128"
											border="0">
											<TR>
												<TD><INPUT class="CssBtnOk" id="btnOK" title="انصراف" type="button" name="btnOK" onclick="onclickbtnOK()"></TD>
												<TD><INPUT class="CssBtnCancel" id="btnCancel" title="انصراف" type="button" name="btnCancel"
														onclick="onclickBtnCancel()"></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
