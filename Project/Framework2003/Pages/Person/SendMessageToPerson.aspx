<%@ Page Language="vb" AutoEventWireup="false" Codebehind="SendMessageToPerson.aspx.vb" Inherits="FrameWork.SendMessageToPerson" validateRequest="false" %>
<%@ Register TagPrefix="cc2" Namespace="GlobalLibrary" Assembly="GlobalLibrary" %>
<%@ Register TagPrefix="cc1" Namespace="WEBLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SendMessageToPerson</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="General.js"></script>
		<script src="../../Includes/Scripts/KeySorting.js"></script>
		<script language="javascript">
		/////////////////////////////////////////////////////////////////////////////////////////////
		function onchangecmbFamilyGrd()
		{
		
			Form1.PersonIdGrd.value=Form1.cmbFamilyGrd.value
			
		}
		/////////////////////////////////////////////////////////////////////////////////////////////
		
		function onBlurPersonIdGrd()
		{
		
			if (Form1.PersonIdGrd.value=="")
				Form1.PersonIdGrd.value=0	
				
			Form1.cmbFamilyGrd.value=Form1.PersonIdGrd.value
			
		}
		////////////////////////////////////////////////////////////////////////////////////////////
		function onChangeCmbSearch()
		{
		
			Form1.txtPersonId.value=Form1.CmbPersonName.value
			
		}
		////////////////////////////////////////////////////////////////////////////////////////////
		function onBlurtxtPersonId()
		{
					
			if (Form1.txtPersonId.value=="")
				Form1.txtPersonId.value=0	
			
			Form1.CmbPersonName.value=Form1.txtPersonId.value

		}
		////////////////////////////////////////mode click Grids////////////////////////////
		function onclickgrdMsg(SelectedRow)
		{
			var obj
			obj=grdMsg
			if(Form1.LastSelectedRowgrdMsg.value!='')
				obj.rows(parseInt(Form1.LastSelectedRowgrdMsg.value)).style.backgroundColor=''
			Form1.LastSelectedRowgrdMsg.value=SelectedRow.rowIndex
			SelectedRow.style.backgroundColor='#FFD599'
			Form1.ShowMessageID.value=SelectedRow.ShowMessageID
			
		}
		/////////////////////////////////////////
		function onclickbtnEdit1()
		{
			LoadData()
			ViewEdit()
		}
		///////////////////////////////////////////////////////////////////////
		function ondblclickgrdMsg()
		{
			LoadData()
			ViewEdit()
			
		}
		///////////////////////////////////////////////////////////////////////
		function onclickbtnCancel()
		{
			ViewGrid()
		}
		///////////////////////////////////////Load Data //////////////////////////////////
		function LoadData()
		{
			
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLdsMessage.value);
									
			var xml1;	
			xml1=xmlDoc.documentElement.selectNodes("/UserEntity/Message[ShowMessageID='"+Form1.ShowMessageID.value+"']");
			if (xml1.length>0)
			{
				Form1.txtPersonId.value=xml1.item(0).selectSingleNode('ToPersonID').text
				Form1.CmbPersonName.value=xml1.item(0).selectSingleNode('ToPersonID').text
				Form1.Descr.value=xml1.item(0).selectSingleNode('Desc').text
				
				if (xml1.item(0).selectSingleNode('Show').text=="1")
					Form1.ShowMsg.checked=true
				else
					Form1.ShowMsg.checked=false
					
				window.status=""
			}
		}
		/////////////////////////////////////////
		function onclickbtnNew()
		{
			Form1.ShowMessageID.value=""
			Form1.txtPersonId.value=""
			Form1.CmbPersonName.value=0
			Form1.Descr.value=""
			Form1.ShowMsg.checked=false
		}
		/////////////////////////////////////////
		function onclickbtnDelete1()
		{
			
			if (Form1.ShowMessageID.value!="")
			{
				if (confirm("¬Ì« „ÿ„∆‰Ìœ ø"))
				{
					Form1.txtSubmit.value="Delete"
					Form1.submit()
				}
			}						
			else
				alert("»«Ìœ Ìò ¬Ì „ «“ ê—Ìœ «‰ Œ«» ‘Êœ")
		}
		//////////////////////////////////////////mode save////////////////////////////////////
		function onclickbtnSave()
		{
			
			//if (Form1.txtPersonId.value=="" || Form1.txtPersonId.value==0 || Form1.Descr.value=="")
			if (Form1.Descr.value=="")
				alert("·ÿ›« «ÿ·«⁄«  —«  ò„Ì· ‰„«ÌÌœ.")
			else
			{
				Form1.txtSubmit.value="Save"
				Form1.submit()
								
			}
			
		}
		///////////////////////////////////////////////////////////////////////
		function ViewEdit() 
		{
			document.all.item("TopRow").style.display="none"  	
			document.all.item("DownRow").style.display="inline" 
					
		}
		/////////////////////////////////////////page/////////////////////////////
		function ViewGrid() 
		{
			document.all.item("TopRow").style.display="inline"  	
			document.all.item("DownRow").style.display="none" 
		}
		///////////////////////////////////////////////////////////////////////
		function onclickbtnNew1()
		{
			onclickbtnNew()
			ViewEdit()
		}
		
        ///////////////////////////////////////////////////////////////////////
        	function LoadForm()
			{	
				
				if (Form1.txtAlert.value!="")
				{ 
					alert(Form1.txtAlert.value) 
					Form1.txtAlert.value="" 				
				}				
			}
        ///////////////////////////////////////////////////////////////////////
		</script>
	</HEAD>
	<body id="body" dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="LoadForm()"
		rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssLayer1" id="Table1" height="100%" cellSpacing="1" cellPadding="1" width="100%"
				align="center" border="0">
				<TR>
					<TD>
						<TABLE class="CssLayer2" id="Table2" height="98%" cellSpacing="1" cellPadding="1" width="98%"
							align="center" border="0">
							<TR>
								<TD vAlign="middle" align="center">
									<TABLE class="CssPage" id="Page" style="WIDTH: 681px; HEIGHT: 185px" height="185" cellSpacing="0"
										cellPadding="0" width="681" align="center" border="2">
										<TR>
											<TD id="TopRow" style="DISPLAY: inline" vAlign="top" align="center" height="352">
												<TABLE id="Table16" style="WIDTH: 672px; HEIGHT: 304px" height="304" cellSpacing="1" cellPadding="1"
													width="672" align="right" border="0">
													<TR>
														<TD style="DISPLAY: inline; HEIGHT: 1px" vAlign="top" align="right">
															<TABLE id="Table19" style="WIDTH: 583px; HEIGHT: 40px" cellSpacing="1" cellPadding="1"
																width="583" align="right" border="0">
																<TR>
																	<TD style="WIDTH: 468px" vAlign="middle">
																		<TABLE id="Table20" style="WIDTH: 451px; HEIGHT: 32px" cellSpacing="1" cellPadding="1"
																			width="451" align="right" border="0">
																			<TR>
																				<TD style="WIDTH: 72px" vAlign="top">òœ Å—”‰·Ì</TD>
																				<TD style="WIDTH: 99px"><INPUT class="TxtControls" id="PersonIdGrd" onblur="onBlurPersonIdGrd()" style="WIDTH: 74px; HEIGHT: 20px"
																						type="text" size="7" name="PersonIdGrd" runat="server"></TD>
																				<TD style="WIDTH: 117px">‰«„ Œ«‰Ê«œêÌ Ê ‰«„</TD>
																				<TD align="left"><cc1:lcombo id="cmbFamilyGrd" runat="server" onchange="onchangecmbFamilyGrd()" LookupName="Personel1"
																						Width="200px" CssClass="TxtControls"></cc1:lcombo></TD>
																			</TR>
																		</TABLE>
																	</TD>
																	<TD vAlign="middle" align="right" colSpan="1">&nbsp;<INPUT class="CssBtnLimitSerach" id="btnSearch" dir="rtl" style="WIDTH: 99px; HEIGHT: 32px"
																			type="button" name="btnSearch" runat="server">&nbsp;&nbsp;<INPUT class="CssBtnShow" id="btnShow" dir="rtl" style="WIDTH: 70px; HEIGHT: 32px" type="button"
																			name="btnSearch" runat="server"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD id="RowGridGroup" style="DISPLAY: inline; HEIGHT: 230px" vAlign="top" align="center"><cc1:automationgrid id="grdMsg" runat="server" Width="611px" CssClass="CssbackColor" SelectRowOnClick="False"
																AutoGenerateColumns="False" SendXML="DoNotSend" ClientPageSize="0" Scrolling="True" EnableClientPager="False" ShowHeader="False" SelectRowOnMouseMove="False" UsingKeyBoard="False" CreateClientSideScripts="False"
																ClientSorting="False" HtcAddress=" " Height="346px">
																<ItemStyle CssClass="CssItemStyle"></ItemStyle>
																<HeaderStyle HorizontalAlign="Center" CssClass="CssHeaderStyle" VerticalAlign="Middle"></HeaderStyle>
																<AlternatingItemStyle CssClass="CssAlternatingItemStyle"></AlternatingItemStyle>
																<FooterStyle CssClass="CssEditItemStyle "></FooterStyle>
																<SelectedItemStyle CssClass="CssSelectedItemStyle"></SelectedItemStyle>
																<Columns>
																	<asp:BoundColumn DataField="ToPersonID" HeaderText="‘„«—Â Å—”‰·Ì">
																		<HeaderStyle HorizontalAlign="Right" Width="130px"></HeaderStyle>
																		<ItemStyle HorizontalAlign="Center" Width="130px"></ItemStyle>
																	</asp:BoundColumn>
																	<asp:BoundColumn DataField="Name" HeaderText="‰«„ Ê ‰«„ Œ«‰Ê«œêÌ">
																		<HeaderStyle HorizontalAlign="Right" Width="200px"></HeaderStyle>
																		<ItemStyle Width="200px"></ItemStyle>
																	</asp:BoundColumn>
																	<asp:TemplateColumn HeaderText="ÅÌ«„ «—”«·Ì">
																		<HeaderStyle Width="250px"></HeaderStyle>
																		<ItemStyle Width="250px"></ItemStyle>
																		<ItemTemplate>
																			<asp:Label runat="Server" Text='<%# DataBinder.Eval(Container, "DataItem.DESC1") %>' title='<%# DataBinder.Eval(Container, "DataItem.DESC") %>' ID="Label4">
																			</asp:Label>
																		</ItemTemplate>
																	</asp:TemplateColumn>
																	<asp:TemplateColumn>
																		<HeaderStyle Width="30px"></HeaderStyle>
																		<ItemStyle Width="30px"></ItemStyle>
																		<ItemTemplate>
																			<IMG id=Show alt="" style="HEIGHT: 10px" src='<%#AutoImage(DataBinder.Eval(Container.DataItem,"Show"))%>'>
																		</ItemTemplate>
																	</asp:TemplateColumn>
																	<asp:BoundColumn Visible="False" DataField="ShowMessageID">
																		<HeaderStyle Width="1px"></HeaderStyle>
																		<ItemStyle Width="1px"></ItemStyle>
																	</asp:BoundColumn>
																</Columns>
															</cc1:automationgrid></TD>
													</TR>
													<TR>
														<TD style="DISPLAY: inline" vAlign="top" align="center">
															<HR class="CssHorizontalLine" style="WIDTH: 591px; HEIGHT: 2px" SIZE="2">
															<TABLE id="Table17" style="WIDTH: 137px; HEIGHT: 36px" cellSpacing="1" cellPadding="1"
																width="137" border="0">
																<TR>
																	<TD><INPUT class="CssBtnNew" id="btnNew1" onclick="onclickbtnNew1()" type="button" name="btnNew1"></TD>
																	<TD><INPUT class="CssBtnEdit" id="btnEdit1" onclick="onclickbtnEdit1()" type="button" name="btnEdit1"></TD>
																	<TD><INPUT class="CssBtnDelete" id="btnDelete1" onclick="onclickbtnDelete1()" type="button"
																			name="btnDelete1"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD id="DownRow" style="DISPLAY: none" vAlign="top" align="center">
												<TABLE id="Table3" style="WIDTH: 674px; HEIGHT: 309px" height="309" cellSpacing="1" cellPadding="1"
													width="674" align="right" border="0">
													<TR>
														<TD style="HEIGHT: 18px" vAlign="top" colSpan="2">
															<TABLE id="Table13" style="WIDTH: 615px; HEIGHT: 46px" cellSpacing="1" cellPadding="1"
																width="615" border="0">
																<TR>
																	<TD style="WIDTH: 92px">‘„«—Â Å—”‰·Ì</TD>
																	<TD style="WIDTH: 42px"><INPUT class="txtControls" id="txtPersonId" onblur="onBlurtxtPersonId()" style="WIDTH: 131px; HEIGHT: 21px"
																			type="text" size="16" name="txtPersonId" runat="server"></TD>
																	<TD style="WIDTH: 109px">‰«„ Ê ‰«„ Œ«‰Ê«œêÌ</TD>
																	<TD><cc1:lcombo onkeypress="return KeySort(this,false)" id="CmbPersonName" runat="server" LookupName="Personel1"
																			Width="193px" CssClass="txtControls" onChange="onChangeCmbSearch()"></cc1:lcombo></TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 92px"></TD>
																	<TD style="WIDTH: 42px"><INPUT id="ShowMsg" type="checkbox" name="ShowMsg" runat="server">›⁄«·</TD>
																	<TD style="WIDTH: 109px"></TD>
																	<TD></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD style="WIDTH: 94px; HEIGHT: 18px" vAlign="top">ÅÌ«„ «—”«·Ì:</TD>
														<TD style="HEIGHT: 18px" align="right"><asp:textbox id="Descr" runat="server" Width="512px" CssClass="TxtControls" Height="82px" TextMode="MultiLine"></asp:textbox></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 41px" vAlign="top" colSpan="2">
															<HR class="CssHorizontalLine" style="WIDTH: 591px; HEIGHT: 2px" SIZE="2">
															&nbsp;
															<TABLE id="Table5" style="WIDTH: 3px; HEIGHT: 38px" align="center" border="0">
																<TR>
																	<TD width="33%"><INPUT class="CssbtnNew" id="btnNew" onclick="onclickbtnNew()" type="button" name="btnNew"></TD>
																	<TD width="33%"><asp:button id="hbtnSave" style="DISPLAY: none" runat="server" Width="1px" CssClass="CssbtnSave"></asp:button><INPUT class="CssbtnSave" id="btnSave" onclick="onclickbtnSave()" type="button" name="btnSave"></TD>
																	<TD width="33%"><INPUT class="CssbtnCancel" id="btnCancel" onclick="onclickbtnCancel()" type="button" name="btnCancel"></TD>
																	<TD style="DISPLAY: none"><INPUT id="txtAlert" style="DISPLAY: none; WIDTH: 1px" name="txtAlert" runat="server">
																		<INPUT id="parent" style="WIDTH: 1px" type="hidden" name="parent"> <INPUT id="BeforePrevStyle" style="WIDTH: 1px" type="hidden" size="1" name="BeforePrevStyle">
																		<INPUT id="PrevrecID" style="WIDTH: 1px" type="hidden" size="1" name="PrevrecID">
																		<INPUT id="PageName" style="WIDTH: 1px" type="hidden" size="1" value="Group" name="PageName">
																		<cc1:mysecurity id="onlineuser" runat="server"></cc1:mysecurity><asp:textbox id="XMLRole" style="DISPLAY: none" runat="server" Width="200px"></asp:textbox><asp:textbox id="XMLAccessRole" style="DISPLAY: none" runat="server" Width="1px"></asp:textbox><INPUT id="Active" style="DISPLAY: none; WIDTH: 1px" type="text" name="Active" runat="server">
																		<INPUT id="ShowMessageID" style="DISPLAY: none; WIDTH: 1px" type="text" name="ShowMessageID"
																			runat="server"> <INPUT id="XMLGroup" style="DISPLAY: none; WIDTH: 1px" type="text" name="XMLGroup" runat="server">
																		<INPUT id="ModeSave" style="DISPLAY: none; WIDTH: 1px" type="text" name="ModeSave" runat="server">
																		<INPUT id="txtSubmit" style="DISPLAY: none; WIDTH: 1px" type="text" name="txtSubmit" runat="server">
																		<INPUT id="ModeDelete" style="DISPLAY: none; WIDTH: 1px" type="text" name="ModeDelete"
																			runat="server">
																		<asp:textbox id="XMLdsMessage" style="DISPLAY: none" runat="server"></asp:textbox><INPUT id="CntRGroup" style="DISPLAY: none; WIDTH: 1px" type="text" name="CntRGroup" runat="server"><INPUT id="CntUGroup" style="DISPLAY: none; WIDTH: 1px" type="text" name="CntUGroup" runat="server">
																		<INPUT id="XMLGroupTitle" style="DISPLAY: none; WIDTH: 1px" type="text" name="XMLGroupTitle"
																			runat="server"> <INPUT id="LastSelectedRowgrdMsg" style="DISPLAY: none; WIDTH: 1px" type="text" name="LastSelectedRowgrdMsg"
																			runat="server"> <INPUT id="SelectedMamber" type="text" name="SelectedMamber" runat="server">
																		<INPUT id="tSelectedMamber" type="text" name="tSelectedMamber" runat="server"> <INPUT id="txtXmlSearch" type="text" name="txtXmlSearch" runat="server"><INPUT id="txtXmlcreateCmbSearch" type="text" name="txtXmlcreateCmbSearch" runat="server">
																	</TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
