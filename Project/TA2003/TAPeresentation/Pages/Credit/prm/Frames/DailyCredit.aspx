<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DailyCredit.aspx.vb" validateRequest="false" Inherits="TA.DailyCredit" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../../../../Includes/Calendar/TextDate.ascx"   %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>DailyCredit</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../../../Includes/Styles/Paging.css" type="text/css" rel="stylesheet">
		<LINK href="../../../../../Includes/Styles/StyleforPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		var LastSelectedRow=null;
		var LastSelectedRowClass="bahar"
		var lastIndexSelected
		var strCreditXML=""
		var oRequst=new ActiveXObject("Microsoft.XMLHTTP")
		
		//«› œ « ›«ﬁ ê—Ìœ »— ò·Ìò Â‰ê«„ 
		function onclickgrdDaily(SelectedRow)
		{
			if(LastSelectedRow!=null)
			{
				LastSelectedRow.className=LastSelectedRowClass;
			}
			LastSelectedRowClass=SelectedRow.className;
			LastSelectedRow=SelectedRow;
			SelectedRow.className="CssSelectedItemStyle";
			//onClickGRD()
			
		}
		//______________________________________________________
			function ondblclickgrdClock(SelectedRow)
		{
		}
		
		////_______________________________________________________________________
		
		function onClickGRD()
		{	
			var xmlDoc = new ActiveXObject("MICROSOFT.XMLDOM")
			xmlDoc.loadXML(Form1.txtXML.value)
			var XmlNodes
			XmlNodes=xmlDoc.documentElement.selectNodes("/CreditEntity/GetDailyPermission[CreditID="+LastSelectedRow.CreditID+"]")
			
			Form1.txtPersonelNO.value=XmlNodes.item(0).selectSingleNode("PersonelNo").text
			/////////////////////////////////////////
			
			/////////////////////////////////////////
			var selName=document.all.item("selName")
			var selCredit=document.all.item("selCredit")
			var selTypeCredit=document.all.item("selTypeCredit")
			
			
					for(var j=1;j<selName.length;j++ )
					
					{
					
						if(XmlNodes.item(0).selectSingleNode("PersonelNo").text==selName.options(j).value)
						
						{
							selName.selectedIndex=selName.options(j).index
						}
					}
					//
					for(var i=1;i<selCredit.length;i++ )
					
					{
					
						if(LastSelectedRow.CreditType==selCredit.options(i).value)
						
						{
							selCredit.selectedIndex=selCredit.options(i).index
						}
					}
					////
					for(var j=1;j<selTypeCredit.length;j++ )
					
					{
					
						if(LastSelectedRow.Type==selTypeCredit.options(j).value)
						
						{
							selTypeCredit.selectedIndex=selTypeCredit.options(j).index
						}
					}
					//////////
					Form1.txtDesc.value=XmlNodes.item(0).selectSingleNode("Des").text
					var endDate=XmlNodes.item(0).selectSingleNode("EDate").text
					var endDate=XmlNodes.item(0).selectSingleNode("EDate").text
				var endDate=XmlNodes.item(0).selectSingleNode("EDate").text
			if(endDate!='')
			{
			      Form1.EndDate_txtYear.value=endDate.substr(6,4)
				  Form1.EndDate_txtMonth.value=endDate.substr(3,2)
			      Form1.EndDate_txtDay.value=endDate.substr(0,2)
			    }
					
						///////
						var startDate=XmlNodes.item(0).selectSingleNode("SDate").text
						if(startDate!='')
						{
			   			
						Form1.StartDate_txtYear.value=startDate.substr(6,4)
						Form1.StartDate_txtMonth.value=startDate.substr(3,2)
						Form1.StartDate_txtDay.value=startDate.substr(0,2)
						}
					    
			    }
			    
			   
		//_____________________________________________________________________
		//_________________________________________________________
		function tdInOutAjax(SD,ED,PersonelNo)
		{
			oRequst.open("post","DailyCredit.aspx?AjaxSend=Ajax &StartDate="+SD+" &EndDate="+ED+" &PersonelNO="+PersonelNo ,true)
			oRequst.onreadyStateChange=AjaxFunction
			oRequst.send(null)
		}
		
		//_____________________________________________________________________________
		function AjaxFunction()
		{
			
			
			if (oRequst.readyState==4)
			{
				if(oRequst.status==200)
				{  
					strCreditXML=oRequst.responseText 
					//********SelLoad********
				var xmlDoc = new ActiveXObject("Microsoft.XMLDOM")
			//	xmlDoc.async="false" 
				xmlDoc.loadXML(strCreditXML)

				var selCredit
				var GrpID
				//alert( document.all('selCredit').value)
				selCredit = document.all('selCredit').value
				GrpID = selCredit.substr(0,2)			
				var XmlNodes = xmlDoc.documentElement.selectNodes("/CreditEntity/GetTypePermissionAll [DT=602 and GrpID="+parseInt(GrpID)+"]")
				//**********************************
					document.all('selTypeCredit').innerHTML=""	
			
					var optionEl		
					optionEl=document.createElement("OPTION")
					document.all('selTypeCredit').options.add(optionEl)
					document.all('selTypeCredit').all(0).innerText="«‰ Œ«» ‰‘œÂ"
					document.all('selTypeCredit').all(0).value=0
					
					Form1.selTypeCredit.disabled=false
					if (XmlNodes.length != 0)
					{
						for (var i=0; i<XmlNodes.length; i++)
						{
							optionEl=document.createElement("OPTION")
							document.all('selTypeCredit').options.add(optionEl)
							document.all('selTypeCredit').all(i+1).innerText = XmlNodes.item(i).selectSingleNode('title').text
							document.all('selTypeCredit').all(i+1).value = XmlNodes.item(i).selectSingleNode('val').text
						}
					Form1.selTypeCredit.value = 0
					}
			    }
			}
		}
		//_____________________________________________________________________________
		function onChangeselCredit()
		{
			var selCredit=document.all.item("selCredit")
				var SD= Form1.StartDate_txtYear.value+"/"+Form1.StartDate_txtMonth.value+"/"+Form1.StartDate_txtDay.value
  				if (SD=="//")
				{
					SD=""	
			
				} 
				var ED= Form1.EndDate_txtYear.value+"/"+Form1.EndDate_txtMonth.value+"/"+Form1.EndDate_txtDay.value
  				if (ED=="//")
				{
					ED=""	
			
				}
				
				if(SD=="" || ED=="")
			{
				alert('·ÿ›«  «—ÌŒ —« Ê«—œ ò‰Ìœ')
				return
			}
			if(Form1.txtPersonelNO.value=="" )
			{
				alert('·ÿ›« ‰«„ Å—”‰· —« Ê«—œ ò‰Ìœ')
			}

			else if(selCredit.options(selCredit.selectedIndex).value==528)
				 
					{
					//alert(selCredit.options(selCredit.selectedIndex).value)
					document.all('selTypeCredit').innerHTML=""	
								
					////
					optionEl=document.createElement("OPTION")
					document.all('selTypeCredit').options.add(optionEl)
					document.all('selTypeCredit').all(0).innerText="·ÿ›« „‰ Ÿ— »„«‰Ìœ"
					document.all('selTypeCredit').all(0).value=0
					
					Form1.selTypeCredit.disabled=true
					
					
					//**************AJAX****************
					SD=SD.substr(2,8)
					ED=ED.substr(2,8)
					tdInOutAjax(SD,ED,Form1.txtPersonelNO.value)
				
				}
				else if(document.all('selCredit').selectedIndex==0)
				{
					document.all('selTypeCredit').innerHTML=""	
					var optionEl		
					optionEl=document.createElement("OPTION")
					document.all('selTypeCredit').options.add(optionEl)
					document.all('selTypeCredit').all(0).innerText="«‰ Œ«» ‰‘œÂ"
					document.all('selTypeCredit').all(0).value=0
					document.all('selTypeCredit').selectedIndex=0
				}
			
			
		}
		
		//______________________________________________________________________
		function onBlurtxtPersonelNO()
		{
			var mytxt=event.srcElement
			var mycmb
			if(mytxt.id=="txtPersonelNO")
			{
				mycmb=document.all.item("selName")
			}
			else if(mytxt.id=="txtReplaceNo")
			{
				mycmb=document.all.item("selReplaceName")
			}
			for(var j=0;j<mycmb.length;j++)
				if(mycmb.options(j).value==mytxt.value)
				{
					mycmb.selectedIndex=mycmb.options(j).index
					var flagFind=1
				}
			if(flagFind !=1)
			{
				//alert('ò«—»— „Ê—œ ‰Ÿ— ÊÃÊœ ‰œ«—œ')
				return
			}	
			
		}
		
	
		//_________________________________________________________________________________
		function onclickbtnNew()
		{
			Form1.StartDate_txtDay.value=""
			Form1.StartDate_txtMonth.value=""
			Form1.StartDate_txtYear.value=""
			Form1.EndDate_txtDay.value=""
			Form1.EndDate_txtMonth.value=""
			Form1.EndDate_txtYear.value=""
			document.all.item("txtPersonelNO").value=""
			document.all.item("txtDesc").value=""
			document.all.item("selName").selectedIndex =0
			document.all.item("selCredit").selectedIndex =0
			document.all.item("selTypeCredit").selectedIndex =0
			
			
		}
		////_____________________________________________________________________________________
		function onClickBtnSaveAndContinue()
		{
			var selCredit=document.all.item("selCredit")
			    var selTypeCredit=document.all.item("selTypeCredit")
				var selName=document.all.item("selName")
				
			    var StartDate=Form1.StartDate_txtDay.value+"/"+Form1.StartDate_txtMonth.value+"/"+Form1.StartDate_txtYear.value
  				if (StartDate=="//")
				{
					StartDate=""
					
			
				}
				 var EndDate=Form1.EndDate_txtDay.value+"/"+Form1.EndDate_txtMonth.value+"/"+Form1.EndDate_txtYear.value
  				if (EndDate=="//")
				{
					EndDate=""
					
			
				}
			if(EndDate=="" ||StartDate==""  ||Form1.txtPersonelNO.value==""
			|| selTypeCredit.options(selTypeCredit.selectedIndex).value==0 ||selCredit.options(selCredit.selectedIndex).value==0
			||selName.options(selName.selectedIndex).value==0)
			{
					alert('·ÿ›« «ÿ·«⁄«  —« ò«„· ò‰Ìœ')
			}
			else
			{
				var CreditTypeLen=selCredit.options(selCredit.selectedIndex).value.length
				var strType= selCredit.options(selCredit.selectedIndex).value.substr(2,CreditTypeLen)
			
  			 var str='<ReportsEntity><Credit>'
			 str+='<Type>'+strType+'</Type>'
			 str+='<StartDate>'+StartDate+'</StartDate>'
			 str+='<EndDate>'+EndDate+'</EndDate>'
			 str+='<CreditType>'+selTypeCredit.options(selTypeCredit.selectedIndex).value+'</CreditType>'
			 str+='<StartTime>00:00</StartTime>'
			 str+='<EndTime>00:00</EndTime>'
			 str+='<PersonID>'+Form1.txtPersonelNO.value+'</PersonID>'
			 str+='<Des>'+Form1.txtDesc.value+'</Des>'
			 str+='<Daily>1</Daily>'
			 str+='</Credit></ReportsEntity>'
			 Form1.txtSubmit.value="Modify"
			 Form1.txtXMLSave.value=str
			 Form1.submit()
			 }
		
		}
		////_____________________________________________________________________________________
		function onChangedSel()
		{
			var mytxt
			var mycmb=event.srcElement
			//alert(mycmb.id)
			if(mycmb.id=="selName")
			{
				mytxt=document.all.item("txtPersonelNO")
			}
			else if(mycmb.id=="selReplaceName")
			{
				mytxt=document.all.item("txtReplaceNo")
			}
			mytxt.value=mycmb.options( mycmb.selectedIndex).value
		}
		////__________________________________________________________________________________________
			
			function onclickbtnSave()
			{
				var selCredit=document.all.item("selCredit")
			    var selTypeCredit=document.all.item("selTypeCredit")
				var selName=document.all.item("selName")
				
			    var StartDate=Form1.StartDate_txtDay.value+"/"+Form1.StartDate_txtMonth.value+"/"+Form1.StartDate_txtYear.value
  				if (StartDate=="//")
				{
					StartDate=""
					
			
				}
				 var EndDate=Form1.EndDate_txtDay.value+"/"+Form1.EndDate_txtMonth.value+"/"+Form1.EndDate_txtYear.value
  				if (EndDate=="//")
				{
					EndDate=""
					
			
				}
			if(EndDate=="" ||StartDate==""  ||Form1.txtPersonelNO.value==""
			|| selTypeCredit.options(selTypeCredit.selectedIndex).value==0 ||selCredit.options(selCredit.selectedIndex).value==0
			||selName.options(selName.selectedIndex).value==0)
			{
					alert('·ÿ›« «ÿ·«⁄«  —« ò«„· ò‰Ìœ')
			}
			else
			{
			var CreditTypeLen=selCredit.options(selCredit.selectedIndex).value.length
			var strType= selCredit.options(selCredit.selectedIndex).value.substr(2,CreditTypeLen)
			
  			 var str='<ReportsEntity><Credit>'
			 str+='<Type>'+ strType+'</Type>'
			 str+='<StartDate>'+StartDate+'</StartDate>'
			 str+='<EndDate>'+EndDate+'</EndDate>'
			 str+='<CreditType>'+selTypeCredit.options(selTypeCredit.selectedIndex).value+'</CreditType>'
			 str+='<StartTime>00:00</StartTime>'
			 str+='<EndTime>00:00</EndTime>'
			 str+='<PersonID>'+Form1.txtPersonelNO.value+'</PersonID>'
			 str+='<Des>'+Form1.txtDesc.value+'</Des>'
			 str+='<Daily>1</Daily>'
			 str+='</Credit></ReportsEntity>'
			 Form1.txtSubmit.value="Modify"
			 Form1.txtXMLSave.value=str
			 onclickbtnNew()
			 Form1.submit()
			 }
			}
        //_________________________________________________
 	
		function onclickbtnDelete()
		{
			var a = confirm("¬Ì« »—«Ì Õ–› „ÿ„∆‰ Â” Ìœ");
			
			if(a==true)
			{
			Form1.txtCreditId.value=LastSelectedRow.CreditID
				Form1.txtSubmit.value = "Delete"
				Form1.submit()
			}
			
		}
		//______________________________________________________
         // «› œ „Ì « ›«ﬁ ’›ÕÂ ·Êœ Â‰ê«„
			 function pageLoad()
		    {
			
					if(Form1.txtAlert.value!='')
					{
						alert(Form1.txtAlert.value)	
						Form1.txtAlert.value=''
					}
					
			}
      //____________________________________________________

		</script>
	</HEAD>
	<body onload="pageLoad()" dir="rtl" style="MARGIN: 0px" bottomMargin="0" leftMargin="0"
		topMargin="0" rightMargin="0" MS_POSITIONING="GridLayout" scroll="no">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssFrame" id="Page" dir="rtl" height="100%" cellSpacing="1" cellPadding="1"
				width="100%" align="center" border="0">
				<TR id="TopRow">
					<TD vAlign="top" align="center" dir="rtl">
						<TABLE style="WIDTH: 100%; HEIGHT: 244px" cellspacing="0">
							<TR>
								<td dir="rtl" align="center" style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 263px" vAlign="top">
									<cc1:automationgrid id="grdDaily" dir="rtl" runat="server" Height="184px" UsingKeyBoard="False" ShowHeader="False"
										Scrolling="True" EnableClientPager="False" SendXML="DoNotSend" ClientSorting="False" AutoGenerateColumns="False"
										CreateClientSideScripts="False" ClientPageSize="0" HtcAddress=" " SelectRowOnClick="True" SelectRowOnMouseMove="False"
										name="grdNumResult" Width="753px">
										<ItemStyle Font-Size="8.5pt" Font-Names="tahoma" HorizontalAlign="Right" CssClass="CssItemStyle"></ItemStyle>
										<HeaderStyle Font-Size="8.5pt" Font-Names="tahoma" Font-Bold="True" HorizontalAlign="Right" CssClass="CssHeaderStyle"></HeaderStyle>
										<AlternatingItemStyle Font-Size="8.5pt" Font-Names="tahoma" HorizontalAlign="Right" CssClass="CssAlternatingItemStyle"></AlternatingItemStyle>
										<FooterStyle CssClass="CssEditItemStyle "></FooterStyle>
										<EditItemStyle Font-Size="8.5pt" Font-Names="tahoma"></EditItemStyle>
										<SelectedItemStyle Font-Size="8.5pt" Font-Names="tahoma" CssClass="CssSelectedItemStyle"></SelectedItemStyle>
										<Columns>
											<asp:BoundColumn Visible="False" DataField="CreditID" HeaderText="CreditID">
												<HeaderStyle HorizontalAlign="Center" Width="1px"></HeaderStyle>
												<ItemStyle Width="1px"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="Type" HeaderText="Type">
												<HeaderStyle HorizontalAlign="Center" Width="1px"></HeaderStyle>
												<ItemStyle Width="1px"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="CreditType" HeaderText="CreditType">
												<HeaderStyle HorizontalAlign="Center" Width="1px"></HeaderStyle>
												<ItemStyle Width="1px"></ItemStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="—Ê‰œ">
												<HeaderStyle HorizontalAlign="Center" Width="20px"></HeaderStyle>
												<ItemStyle Width="20px"></ItemStyle>
												<ItemTemplate>
													<IMG src="../../../Images/btnNodes.gif" align="middle" border="0">
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="PersonelNo" HeaderText="‘. Å—”‰·Ì">
												<HeaderStyle HorizontalAlign="Center" Width="80px" VerticalAlign="Middle"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" Width="80px"></ItemStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="‰«„ Ê ‰«„ Œ«‰Ê«œêÌ">
												<HeaderStyle Width="100px"></HeaderStyle>
												<ItemStyle Width="100px"></ItemStyle>
												<ItemTemplate>
													<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SPersonelName") %>' title='<%# DataBinder.Eval(Container, "DataItem.PersonelName") %>' ID="Label1" NAME="Label1">
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="TypeName" HeaderText="„ÃÊ“">
												<HeaderStyle HorizontalAlign="Center" Width="100px" VerticalAlign="Middle"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="CreditTypeName" HeaderText="‰Ê⁄ „ÃÊ“">
												<HeaderStyle HorizontalAlign="Right" Width="100px" VerticalAlign="Middle"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="SDate" HeaderText="«“  «—ÌŒ">
												<HeaderStyle HorizontalAlign="Right" Width="100px" VerticalAlign="Middle"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="EDate" HeaderText=" «  «—ˆÌŒ">
												<HeaderStyle HorizontalAlign="Right" Width="100px" VerticalAlign="Middle"></HeaderStyle>
												<ItemStyle Width="100px"></ItemStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText=" Ê÷ÌÕ«  ">
												<HeaderStyle Width="100px"></HeaderStyle>
												<ItemStyle Width="100px"></ItemStyle>
												<ItemTemplate>
													<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SDes") %>' title='<%# DataBinder.Eval(Container, "DataItem.Des") %>' ID="Label2" NAME="Label2">
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
										</Columns>
									</cc1:automationgrid></td>
							<TR>
								<td id="DOWN" dir="rtl" align="center" vAlign="bottom">
									<HR class="CssHorizontalLine" id="hh">
									<p></p>
									<TABLE id="mainTable" dir="rtl" style="BORDER-RIGHT: lightblue thin inset; BORDER-TOP: lightblue thin solid; BORDER-LEFT: lightblue thin outset; WIDTH: 511px; BORDER-BOTTOM: lightblue thin solid; HEIGHT: 232px"
										align="center" border="0" cellSpacing="1" cellPadding="2">
										<TR>
											<TD style="WIDTH: 85px; HEIGHT: 16px">«“  «—ÌŒ:</TD>
											<TD style="WIDTH: 159px; HEIGHT: 16px">
												<uc1:textdate id="StartDate" runat="server"></uc1:textdate></TD>
											<TD style="WIDTH: 97px; HEIGHT: 16px"> «  «—ÌŒ:</TD>
											<TD style="HEIGHT: 16px">
												<uc1:textdate id="EndDate" runat="server"></uc1:textdate></TD>
										</TR>
										<TR>
											<TD style="WIDTH: 85px; HEIGHT: 20px">‘.Å „ ﬁ«÷Ì:</TD>
											<TD style="WIDTH: 159px; HEIGHT: 20px"><INPUT class="TxtControls" id="txtPersonelNO" onblur="onBlurtxtPersonelNO()" style="WIDTH: 132px; HEIGHT: 21px"
													type="text" size="12" name="txtPersonelNO"></TD>
											<TD style="WIDTH: 97px; HEIGHT: 20px">‰«„ Ê ‰«„ Œ«‰Ê«œêÌ:</TD>
											<TD style="HEIGHT: 20px">
												<cc1:lcombo id="selName" runat="server" Width="132" onchange="onChangedSel()" DataValueField="val"
													DataTextField="title" ConnectionName="GenCnn" LookupName="PersonName" CssClass="TxtControls"></cc1:lcombo></TD>
										</TR>
										<TR>
											<TD style="WIDTH: 85px; HEIGHT: 29px">‘.Å Ã«‰‘Ì‰:</TD>
											<TD style="WIDTH: 159px; HEIGHT: 29px"><INPUT class="TxtControls" id="txtReplaceNo" onblur="onBlurtxtPersonelNO()" style="WIDTH: 132px; HEIGHT: 21px"
													type="text" size="12" name="Text1" runat="server"></TD>
											<TD style="WIDTH: 97px; HEIGHT: 29px">‰«„ Ê ‰«„ Œ«‰Ê«œêÌ:</TD>
											<TD style="HEIGHT: 29px">
												<cc1:lcombo id="selReplaceName" runat="server" Width="132" onchange="onChangedSel()" DataValueField="val"
													DataTextField="title" LookupName="PersonName" CssClass="TxtControls"></cc1:lcombo></TD>
										</TR>
										<TR>
											<TD style="WIDTH: 85px; HEIGHT: 29px">„ÃÊ“:</TD>
											<TD style="WIDTH: 159px; HEIGHT: 29px">
												<cc1:lcombo id="selCredit" runat="server" Width="132px" onchange="onChangeselCredit()" ConnectionName="GenCnn"
													CssClass="TxtControls"></cc1:lcombo></TD>
											<TD style="WIDTH: 97px; HEIGHT: 29px">‰Ê⁄ „ÃÊ“:</TD>
											<TD style="HEIGHT: 29px">
												<cc1:lcombo id="selTypeCredit" runat="server" Width="132px" ConnectionName="GenCnn" CssClass="TxtControls"></cc1:lcombo></TD>
										</TR>
										<TR>
											<TD style="WIDTH: 85px; HEIGHT: 27px"> Ê÷ÌÕ« :</TD>
											<TD style="HEIGHT: 27px" colSpan="3" dir="rtl" align="right">
												<asp:textbox id="txtDesc" tabIndex="8" runat="server" Width="395px" TextMode="MultiLine"></asp:textbox></TD>
										</TR>
										<TR>
											<TD vAlign="top" align="center" colSpan="4">
												<HR class="CssHorizontalLine">
												<TABLE id="Table2" style="WIDTH: 266px; HEIGHT: 40px" cellSpacing="1" cellPadding="1" align="center"
													border="0">
													<TR>
														<TD style="WIDTH: 66px"><INPUT class="CssBtnNew" id="Button4" onclick="onclickbtnNew()" type="button" name="Button4"></TD>
														<TD style="WIDTH: 110px"><INPUT class="CssBtnSave" id="Button3" style="HEIGHT: 32px" onclick="onclickbtnSave()"
																type="button" name="Button3"></TD>
														<TD style="WIDTH: 110px"><INPUT class="CssBtnSaveAndNew" id="BtnSaveAndContinue" style="WIDTH: 107px; HEIGHT: 32px"
																onclick="onClickBtnSaveAndContinue()" type="button" name="Button2"></TD>
														<TD><INPUT class="CssBtnDelete" id="Button1" onclick="onclickbtnDelete()" type="button" name="Button1"></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</td>
							</TR>
				</TR>
			</TABLE>
			</TD> </TR>
			<TR id="DownRow">
				<TD style="DISPLAY: none">
					<input id="txtCreditId" style="DISPLAY: none" type="text" name="txtCreditId" runat="server">
					<input id="txtAlert" style="DISPLAY: none" type="text" name="txtAlert " runat="server">
					<input id="txtXML" style="DISPLAY: none" type="text" name="txtXML " runat="server">
					<input id="txtSubmit" style="DISPLAY: none" type="text" name="txtSubmit" runat="server">
					<input id="txtAjaxInOut" style="DISPLAY: none" type="text" name="txtAjaxInOut" runat="server">
					<input id="txtXMLSave" style="DISPLAY: none" type="text" name="txtXMLSave" runat="server">
				</TD>
			</TR>
			</TABLE>
		</form>
	</body>
</HTML>
