<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="InOutCard.aspx.vb" Inherits="TA.InOutCard" validateRequest="false" %>
<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../../../../Includes/Calendar/TextDate.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>InOutCard</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../../../Includes/Styles/Paging.css" type="text/css" rel="stylesheet">
		<LINK href="../../../../../Includes/Styles/StyleforPages.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="../../../../../Includes/Script/General.js"></script>
		<script language="javascript">
		var LastSelectedRow=null
		var LastSelectedRowClass=""
		var lastIndexSelected
		var oRequst=new ActiveXObject("Microsoft.XMLHTTP")
		//«› œ « ›«ﬁ ê—Ìœ »— ò·Ìò Â‰ê«„ 
		function onclickgrdInOut(SelectedRow)
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
		////_______________________________________________________________________
		function ondblclickgrdClock(SelectedRow)
		{
		}	
		////_______________________________________________________________________
		
			function onClickGRD()
				{	
			
			var xmlDoc = new ActiveXObject("MICROSOFT.XMLDOM")
			xmlDoc.loadXML(Form1.txtXML.value)
			var XmlNodes
			XmlNodes = xmlDoc.documentElement.selectNodes("/CreditEntity/GetInsertMissCard[CreditID="+LastSelectedRow.CreditID+"]")
			Form1.txtPersonelNO.value=XmlNodes.item(0).selectSingleNode("PersonID").text
			
			var selName=document.all.item("selName")
			var selCuase=document.all.item("selCuase")
		

                       for(var j=0;j<selName.length-1;j++ )
					
					   {
					  
					
						if(XmlNodes.item(0).selectSingleNode("PersonID").text==selName.options(j).value)
						
						{
							selName.selectedIndex=selName.options(j).index
						}
					}
						//
					for(var i=0;i<selCuase.length-1;i++ )
					
					{	
					
				
						if(LastSelectedRow.CreditReasonID==selCuase.options(i).value)
						
						{
					
							selCuase.selectedIndex=selCuase.options(i).index
						}
					}
					////
					
			Form1.txtInOutTime.value=XmlNodes.item(0).selectSingleNode("InOutTime").text
			Form1.txtDesc.value=XmlNodes.item(0).selectSingleNode("Descr").text
			var endDate=XmlNodes.item(0).selectSingleNode("Date").text
		
			if(endDate!='')
			{
			    Form1.CreditDate_txtYear.value="13"+endDate.substring(0,2)
				Form1.CreditDate_txtMonth.value=endDate.substring(3,5)
			   Form1.CreditDate_txtDay.value=endDate.substring(6,8)
			    }
			 var strDate= Form1.CreditDate_txtYear.value+"/"+Form1.CreditDate_txtMonth.value+"/"+Form1.CreditDate_txtDay.value
  				if (strDate=="//")
				{
					strDate=""
					
			
				} 
				strDate=strDate.substr(2,8)
				 tdInOutAjax(strDate,XmlNodes.item(0).selectSingleNode("PersonID").text)
		}
		//______________________________________________________________________________
		
		function tdInOutAjax(strDate,PersonID)
		{
			oRequst.open("post","InOutCard.aspx?AjaxSend=Ajax &StartDate="+strDate+" &EndDate="+strDate+" &PersonID="+PersonID ,true)
			oRequst.onreadyStateChange=AjaxFunction
			oRequst.send(null)
		}
		//_____________________________________________________________________________
		function AjaxFunction()
		{
			var strInOut=new String()
			var strcomp=new String()
			var strnew=new String()
			var oIndex		
			
					
			if (oRequst.readyState==4)
			{
				if(oRequst.status==200)
				{
				    strInOut=oRequst.responseText
					oIndex=strInOut.indexOf('*',0)
				strcomp=strInOut.substr(oIndex+1,strInOut.length-1)
					
					
					document.all.item("tdInOut").innerText=strInOut.substr(0,oIndex-1)	
				
				
				for(var j=2;j<strcomp.length ;j=j+8)
					
					{
					strnew+=strcomp.substr(j,6)
				
					}
					document.all.item("tdInOut").title=strnew 
					
				}
			}
		}
		//_____________________________________________________________________
	
		function onBlurtxtPersonelNO()
		{
			var mytxt=document.all.item("txtPersonelNO")
			var mycmb=document.all.item("selName")
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
			var strDate= Form1.CreditDate_txtYear.value+"/"+Form1.CreditDate_txtMonth.value+"/"+Form1.CreditDate_txtDay.value
  				if (strDate=="//")
				{
					strDate=""
				}    	
			if(strDate!="")
			{
				strDate=strDate.substr(2,8)
				tdInOutAjax(strDate,Form1.txtPersonelNO.value)
			}
			
		}
		////_____________________________________________________________________________________
			function ondblclickgrdClock(SelectedRow)
		{
		}
		
		////_______________________________________________________________________
		function onClickBtnSaveAndContinue()
		{
				var selName=document.all.item("selName")
				var selCuase=document.all.item("selCuase")
				
			    var strDate=Form1.CreditDate_txtDay.value+"/"+Form1.CreditDate_txtMonth.value+"/"+Form1.CreditDate_txtYear.value
  				if (strDate=="//")
				{
					strDate=""
					
			
				}
				if(strDate=="" ||Form1.txtInOutTime.value==""||Form1.txtPersonelNO.value==""
				 
				||selName.options(selName.selectedIndex).value==0)
				{
					alert('·ÿ›« «ÿ·«⁄«  —« ò«„· ò‰Ìœ')
				}
				else
				{
  					var str='<ReportsEntity><Credit>'
					str+='<Type>0</Type>'
					str+='<StartDate>'+strDate+'</StartDate>'
					str+='<EndDate>'+strDate+'</EndDate>'
					str+='<CreditType>0</CreditType>'
					str+='<StartTime>'+Form1.txtInOutTime.value+'</StartTime>'
					str+='<EndTime>00:00</EndTime>'
					str+='<PersonID>'+Form1.txtPersonelNO.value+'</PersonID>'
					str+='<Des>'+Form1.txtDesc.value+'</Des>'
					str+='<Daily>2</Daily>'
					str+='</Credit></ReportsEntity>'
					Form1.txtSubmit.value="Modify"
					Form1.txtXMLSave.value=str
					Form1.submit()
			 }
		}
		//______________________________________________________________________________
		
			function onclickbtnSave()
			{
				
				var selName=document.all.item("selName")
				var selCuase=document.all.item("selCuase")
				
			    var strDate=Form1.CreditDate_txtDay.value+"/"+Form1.CreditDate_txtMonth.value+"/"+Form1.CreditDate_txtYear.value
  				if (strDate=="//")
				{
					strDate=""
					
			
				}
				
				if(strDate=="" ||Form1.txtInOutTime.value==""||Form1.txtPersonelNO.value==""
				 
				||selName.options(selName.selectedIndex).value==0)
				{
					alert('·ÿ›« «ÿ·«⁄«  —« ò«„· ò‰Ìœ')
				}
				else
				{
  					var str='<ReportsEntity><Credit>'
					str+='<Type>0</Type>'
					str+='<StartDate>'+strDate+'</StartDate>'
					str+='<EndDate>'+strDate+'</EndDate>'
					str+='<CreditType>0</CreditType>'
					str+='<StartTime>'+Form1.txtInOutTime.value+'</StartTime>'
					str+='<EndTime>00:00</EndTime>'
					str+='<PersonID>'+Form1.txtPersonelNO.value+'</PersonID>'
					str+='<Des>'+Form1.txtDesc.value+'</Des>'
					str+='<Daily>2</Daily>'
					str+='</Credit></ReportsEntity>'
					Form1.txtSubmit.value="Modify"
					Form1.txtXMLSave.value=str
					onclickbtnNew()
					Form1.submit()
			 }
}
////__________________________________________________________________________________________
		function onChangedselName()
		{
			var mycmb=document.all.item("selName")
		
			document.all.item("txtPersonelNO").value=mycmb.options( mycmb.selectedIndex).value
		}
		////__________________________________________________________________________________________	
		
		function onclickbtnNew()
		{
			Form1.CreditDate_txtDay.value=""
			Form1.CreditDate_txtMonth.value=""
			Form1.CreditDate_txtYear.value=""
			document.all.item("txtPersonelNO").value=""
			document.all.item("txtDesc").value=""
			document.all.item("selName").selectedIndex =0
			document.all.item("txtInOutTime").value=""
			document.all.item("selCuase").selectedIndex =0
		}
		////__________________________________________________________________________________________
			function Timechk(obj)
			{
				var val=""
				val=ReplaceAll(obj.value," ","")
				
				
				if (( val!="") && (IsvalidTime(val)==false))
				{
 					var strQuestion;
 					var intReturn;
 					
					strQuestion="  ! ·ÿ›« œ—«Ì‰ ﬁ”„  ”«⁄  ’ÕÌÕ Ê«—œ ﬂ‰Ìœ"
					strQuestion=alert(strQuestion, 0, "”«⁄  «‘ »«Â ")
					obj.focus()
					
					//window.event.returnvalue=false
				}
				if ((val!="") && (IsvalidTime(val)==true))
				{
					var arr
					arr=val.split(":")
					
					var str1=arr[0]
					var str2;
					
					if (getCntChar(':',val)==0)
					{
						//alert(str1.substr(0,2))
						str2=""
						val=str1.substr(0,2)+":00"
					}
					else
					{
						//alert(arr[1])
						str2=arr[1]
						if (str2=="")
						{
							val=str1.substr(0,2)+":00"
						}
						else
						{
							val=str1.substr(0,2)+":"+str2.substr(0,2)
						}
						
					}
									
					//val=right("0" & arr(0),2) & ":" & right("0" & arr(1),2) 
					obj.value=val
				}
			}
			////__________________________________________________________________________________________	
			function IsvalidTime(txt)
			{
				var t1;
				var t2;
				var Hour;
				var Min;
				var arr
				
				//alert(getCntChar(':',txt))
				
				if (getCntChar(':',txt)==0)
				{
					//alert("111")
					if (txt.length==1 || txt.length==2)
					{
						return(true)
					}
					else if (txt.length>2)
					{
						return(false)
					}
				}
				else
				{
					//alert("222")
					arr=txt.split(":")
					
					Hour=parseInt(arr[0])
   					Min=parseInt(arr[1])
					        
					if (Hour>24 && Min>60)
					{
						return(false)
					}
					else
					{
						return(true)
					}
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
	<body dir="rtl" onload="pageLoad()" bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0"
		scroll="no" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssFrame" id="Page" dir="rtl" height="100%" cellSpacing="1" cellPadding="1"
				width="100%" align="center" border="0">
				<TR id="TopRow">
					<TD vAlign="top" align="center" style="HEIGHT:289px">
						<TABLE style="WIDTH: 100%; HEIGHT: 264px">
							<TR>
								<td vAlign="top" style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 263px" align="center"><cc1:automationgrid id="grdInOut" dir="rtl" runat="server" Height="184px" UsingKeyBoard="False" ShowHeader="False"
										Scrolling="True" EnableClientPager="False" SendXML="DoNotSend" ClientSorting="False" AutoGenerateColumns="False" CreateClientSideScripts="False"
										ClientPageSize="0" HtcAddress=" " SelectRowOnClick="True" SelectRowOnMouseMove="False" name="grdNumResult" Width="602px">
										<ItemStyle Font-Size="8.5pt" Font-Names="tahoma" HorizontalAlign="Right" CssClass="CssItemStyle"></ItemStyle>
										<HeaderStyle Font-Size="8.5pt" Font-Names="tahoma" Font-Bold="True" HorizontalAlign="Right" CssClass="CssHeaderStyle"></HeaderStyle>
										<AlternatingItemStyle Font-Size="8.5pt" Font-Names="tahoma" HorizontalAlign="Right" CssClass="CssAlternatingItemStyle"></AlternatingItemStyle>
										<FooterStyle CssClass="CssEditItemStyle "></FooterStyle>
										<EditItemStyle Font-Size="8.5pt" Font-Names="tahoma"></EditItemStyle>
										<SelectedItemStyle Font-Size="8.5pt" Font-Names="tahoma" CssClass="CssSelectedItemStyle"></SelectedItemStyle>
										<Columns>
											<asp:BoundColumn Visible="False" DataField="CreditID" HeaderText="CreditID">
												<HeaderStyle Width="1px"></HeaderStyle>
												<ItemStyle Width="1px"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="CreditReasonID" HeaderText="CreditReasonID">
												<HeaderStyle Width="1px"></HeaderStyle>
												<ItemStyle Width="1px"></ItemStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="—Ê‰œ">
												<HeaderStyle HorizontalAlign="Center" Width="20px"></HeaderStyle>
												<ItemStyle Width="20px"></ItemStyle>
												<ItemTemplate>
													<IMG src="../../../Images/btnNodes.gif" align="middle" border="0">
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="PersonID" HeaderText="‘. Å—”‰·Ì">
												<HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" Width="80px"></ItemStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="‰«„ Ê ‰«„ Œ«‰Ê«œêÌ">
												<HeaderStyle Width="100px"></HeaderStyle>
												<ItemStyle Width="100px"></ItemStyle>
												<ItemTemplate>
													<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SPersonelName") %>' title='<%# DataBinder.Eval(Container, "DataItem.PersonName") %>' ID="Label1" NAME="Label1">
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="Date" HeaderText=" «—ˆÌŒ">
												<HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="InOutTime" HeaderText="”«⁄ ">
												<HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText=" Ê ÷ÌÕ«  ">
												<HeaderStyle Width="100px"></HeaderStyle>
												<ItemStyle Width="100px"></ItemStyle>
												<ItemTemplate>
													<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SDes") %>' title='<%# DataBinder.Eval(Container, "DataItem.Descr") %>' ID="Label2" NAME="Label2">
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="CreditReason" HeaderText="⁄·  „ÃÊ“">
												<HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
									</cc1:automationgrid></td>
							</TR>
						</TABLE>
					</TD>
				</TR>
				<tr>
					<td vAlign="top">
						<HR class="CssHorizontalLine" id="hh">
						<p></p>
						<table id="mainTable" dir="rtl" width="481" align="center" border="0" style="BORDER-RIGHT: lightblue thin inset; BORDER-TOP: lightblue thin solid; BORDER-LEFT: lightblue thin outset; WIDTH: 481px; BORDER-BOTTOM: lightblue thin solid; HEIGHT: 160px"
							cellSpacing="1" cellPadding="2">
							<tr>
								<td style="WIDTH: 143px; HEIGHT: 16px"> «—ÌŒ:</td>
								<td style="WIDTH: 150px; HEIGHT: 16px"><uc1:textdate id="CreditDate" runat="server"></uc1:textdate></td>
								<td style="WIDTH: 131px; HEIGHT: 16px">”«⁄«   —œœ:</td>
								<td id="tdInOut" style="HEIGHT: 16px" runat="server"></td>
							</tr>
							<tr>
								<td style="WIDTH: 143px; HEIGHT: 25px">‘.Å „ ﬁ«÷Ì:</td>
								<td style="WIDTH: 150px; HEIGHT: 25px"><INPUT class="TxtControls" id="txtPersonelNO" onblur="onBlurtxtPersonelNO()" style="WIDTH: 132px; HEIGHT: 21px"
										type="text" size="12" name="txtPersonelNO"></td>
								<td style="WIDTH: 131px; HEIGHT: 25px">‰«„ Ê ‰«„ Œ«‰Ê«œêÌ:</td>
								<td style="HEIGHT: 25px"><cc1:lcombo id="selName" runat="server" Width="132" CssClass="TxtControls" onchange="onChangedselName()"
										LookupName="PersonName" DataTextField="title" DataValueField="val" ConnectionName="GenCnn"></cc1:lcombo></td>
							</tr>
							<tr>
								<td style="WIDTH: 143px; HEIGHT: 28px">”«⁄  Ê—Êœ/Œ—ÊÃ:</td>
								<td style="WIDTH: 150px; HEIGHT: 28px"><INPUT class="TxtControls" id="txtInOutTime" onkeydown="OnKeyDownTime(this.value)" onblur="Timechk(this)"
										style="WIDTH: 132px; HEIGHT: 21px" type="text" size="12" name="Text1"></td>
								<td style="WIDTH: 131px; HEIGHT: 28px">⁄·  „ÃÊ“:</td>
								<td style="HEIGHT: 28px"><cc1:lcombo id="selCuase" runat="server" Width="132" CssClass="TxtControls" LookupName="CauseCredit"
										DataTextField="title" DataValueField="val" ConnectionName="GenCnn"></cc1:lcombo></td>
							</tr>
							<tr>
								<td style="WIDTH: 143px; HEIGHT: 31px"> Ê÷ÌÕ« :</td>
								<td colSpan="3" style="HEIGHT: 31px">
									<asp:textbox id="txtDesc" tabIndex="8" runat="server" Width="371px" TextMode="MultiLine"></asp:textbox></td>
							</tr>
							<TR>
								<TD vAlign="top" align="center" width="100%" colSpan="4">
									<HR class="CssHorizontalLine">
									<TABLE id="Table2" style="WIDTH: 266px; HEIGHT: 40px" cellSpacing="1" cellPadding="1" align="center"
										border="0">
										<TR>
											<TD style="WIDTH: 66px"><INPUT class="CssBtnNew" id="Button4" onclick="onclickbtnNew()" type="button" name="Button4"></TD>
											<TD style="WIDTH: 110px"><INPUT class="CssBtnSave" id="Button3" style="HEIGHT: 32px" onclick="onclickbtnSave()"
													type="button" name="Button3"></TD>
											<TD style="WIDTH: 74px"><INPUT class="CssBtnSaveAndNew" id="BtnSaveAndContinue" style="WIDTH: 107px; HEIGHT: 32px"
													onclick="onClickBtnSaveAndContinue()" type="button" name="Button2"></TD>
											<TD><INPUT class="CssBtnDelete" id="Button1" onclick="onclickbtnDelete()" type="button" name="Button1"></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</table>
					</td>
				</tr>
				<TR id="DownRow">
					<TD style="DISPLAY: none"><input id="txtCreditId" style="DISPLAY: none" type="text" name="txtCreditId" runat="server">
						<input id="txtSubmit" style="DISPLAY: none" type="text" name="txtSubmit" runat="server">
						<input id="txtAlert" style="DISPLAY: none" type="text" name="txtAlert " runat="server">
						<input id="txtXML" style="DISPLAY: none" type="text" name="txtXML " runat="server">
						<input id="txtAjaxInOut" style="DISPLAY: none" type="text" name="txtAjaxInOut" runat="server">
						<input id="txtXMLSave" style="DISPLAY: none" type="text" name="txtXMLSave" runat="server">
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
