<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ClockCredit.aspx.vb" validateRequest="false" Inherits="TA.ClockCredit" %>
<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../../../../Includes/Calendar/TextDate.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>ClockCredit</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../../../Includes/Styles/Paging.css" type="text/css" rel="stylesheet">
		<LINK href="../../../../../Includes/Styles/StyleforPages.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="../../../../../Includes/Script/General.js"></script>
		<script language="javascript">
		var LastSelectedRow=null;
		var LastSelectedRowClass=""
		var lastIndexSelected;
		var flag=0
		var oRequst=new ActiveXObject("Microsoft.XMLHTTP")
		
		//«› œ « ›«ﬁ ê—Ìœ »— ò·Ìò Â‰ê«„ 
		function onclickgrdClock(SelectedRow)
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
		//________________________________________________________________________
		function ondblclickgrdClock(SelectedRow)
		{
		}
		
		
		////_______________________________________________________________________
		
			function onClickGRD()
				{	
			
			var xmlDoc = new ActiveXObject("MICROSOFT.XMLDOM")
			xmlDoc.loadXML(Form1.txtXML.value)
			var XmlNodes
			XmlNodes = xmlDoc.documentElement.selectNodes("/CreditEntity/GetHourPermission[CreditID="+LastSelectedRow.CreditID+"]")
			Form1.txtPersonelNO.value=XmlNodes.item(0).selectSingleNode("PersonelNo").text
			/////////////////////////////////////////
		
			var selName=document.all.item("selName")
			var selCredit=document.all.item("selCredit")
			var selTypeCredit=document.all.item("selTypeCredit")
			
			var endDate=XmlNodes.item(0).selectSingleNode("EDate").text
			if(endDate!='')
			{
			      Form1.CreditDate_txtYear.value=endDate.substr(6,4)
				  Form1.CreditDate_txtMonth.value=endDate.substr(3,2)
			      Form1.CreditDate_txtDay.value=endDate.substr(0,2)
			    }
			 var strDate= Form1.CreditDate_txtYear.value+"/"+Form1.CreditDate_txtMonth.value+"/"+Form1.CreditDate_txtDay.value
  				if (strDate=="//")
				{
					strDate=""
					
			
				}    	
			
			
			 
			 for(var i=0;i<selCredit.length;i++ )
					
					{	
					
						if("52"+LastSelectedRow.Type==selCredit.options(i).value)
						
						{
							
							selCredit.selectedIndex=selCredit.options(i).index
							//onChangeselCredit()
							
						}
					}
					//////////
			
					for(var j=1;j<selName.length;j++ )
					
					{
					
						if(XmlNodes.item(0).selectSingleNode("PersonelNo").text==selName.options(j).value)
						
						{
							selName.selectedIndex=selName.options(j).index
						}
					}
					//
					
					
			Form1.txtStartTime.value=XmlNodes.item(0).selectSingleNode("StartTime").text
			Form1.txtEndTime.value=XmlNodes.item(0).selectSingleNode("EndTime").text
			Form1.txtDesc.value=XmlNodes.item(0).selectSingleNode("Des").text
			
			strDate=strDate.substr(2,8)
			tdInOutAjax(strDate,XmlNodes.item(0).selectSingleNode("PersonelNo").text)
		}
		//_________________________________________________________
		function tdInOutAjax(strDate,PersonelNo)
		{
			oRequst.open("post","ClockCredit.aspx?AjaxSend=Ajax &StartDate="+strDate+" &EndDate="+strDate+" &PersonelNO="+PersonelNo ,true)
			oRequst.onreadyStateChange=AjaxFunction
			oRequst.send(null)
		}
		
		//_____________________________________________________________________________
		function AjaxFunction()
		{
			var strAjax=new String()
			var strcomp=new String()
			var strnew=new String()
			var oIndex=0		
			if (oRequst.readyState==4)
			{
				//alert(oRequst.status)
				if(oRequst.status==200)
				{
				   
				    strAjax=oRequst.responseText
				    
				    oIndex=strAjax.indexOf('#',0)
				   
				    var strCreditXML=strAjax.substr(0,oIndex)
				   //************************************* 
				    var strInOut=strAjax.substr(oIndex+1,strAjax.length-oIndex)
					//alert(strInOut)
					oIndex=strInOut.indexOf('*',0)
					if(oIndex!=-1)
					{
					document.all.item("tdInOut").innerText=strInOut.substr(0,oIndex)	
					strcomp=strInOut.substr(oIndex+1,strInOut.length)
					//alert(strcomp)
					for(var j=2;j<strcomp.length ;j=j+8)
						{
						strnew+=strcomp.substr(j,6)	
						}
					document.all.item("tdInOut").title=strnew
					
					}
					if(flag==1)
					{
						AjaxLoadSelFunction(strCreditXML)
					}
				//****************************************
				}
				
				
			}
		}
		//______________________________________________________________________
		function onChangeselCredit()
		{
			var strDate= Form1.CreditDate_txtYear.value+"/"+Form1.CreditDate_txtMonth.value+"/"+Form1.CreditDate_txtDay.value
  				if (strDate=="//")
				{
					strDate=""	
			
				}    	
			if(strDate=="")
			{
				alert('·ÿ›«  «—ÌŒ —« Ê«—œ ò‰Ìœ')
				return
			}
			if(Form1.txtPersonelNO.value=="" )
			{
				alert('·ÿ›« ‰«„ Å—”‰· —« Ê«—œ ò‰Ìœ')
			}
			else
			{
		
			var selCredit=document.all.item("selCredit")
			//alert(selCredit.options(selCredit.selectedIndex).value)
			if(selCredit.options(selCredit.selectedIndex).value==528)
			{
				
				document.all('selTypeCredit').innerHTML=""	
							
				////
				optionEl=document.createElement("OPTION")
				document.all('selTypeCredit').options.add(optionEl)
				document.all('selTypeCredit').all(0).innerText="·ÿ›« „‰ Ÿ— »„«‰Ìœ"
				document.all('selTypeCredit').all(0).value=0
				
				Form1.selTypeCredit.disabled=true
				//*******************************
				flag=1
				strDate=strDate.substr(2,8)
				tdInOutAjax(strDate,document.all('txtPersonelNO').value)
				
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
				
				
		}
		

		//_____________________________________________________________________
		function AjaxLoadSelFunction(strCreditXML)
		{
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM")
			xmlDoc.async="false" 
			xmlDoc.loadXML(strCreditXML)

			var selCredit
			var GrpID
			//alert( document.all('selCredit').value)
			selCredit = document.all('selCredit').value
			GrpID = selCredit.substr(0,2)			
					
			var XmlNodes = xmlDoc.documentElement.selectNodes("/CreditEntity/GetTypePermissionAll [DT=603 and GrpID="+parseInt(GrpID)+"]")
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
		//______________________________________________________________________
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
				flag=0
				strDate=strDate.substr(2,8)
				tdInOutAjax(strDate,document.all('txtPersonelNO').value )
			}
			
		}
		
		//_________________________________________________________________________________
		function onclickbtnNew()
		{
			Form1.CreditDate_txtDay.value=""
			Form1.CreditDate_txtMonth.value=""
			Form1.CreditDate_txtYear.value=""
			document.all.item("txtPersonelNO").value=""
			document.all.item("txtDesc").value=""
			document.all.item("selName").selectedIndex =0
			document.all.item("txtStartTime").value=""
			document.all.item("txtEndTime").value=""
			document.all.item("selCredit").selectedIndex =0
			document.all.item("selTypeCredit").selectedIndex =0
			
			
		}
		////_____________________________________________________________________________________
		function onChangedselName()
		{
			var mycmb=document.all.item("selName")
		
			document.all.item("txtPersonelNO").value=mycmb.options( mycmb.selectedIndex).value
			 var strDate=Form1.CreditDate_txtDay.value+"/"+Form1.CreditDate_txtMonth.value+"/"+Form1.CreditDate_txtYear.value
  				if (strDate=="//")
				{
					strDate=""
					
			
				}
			/*if(strDate!="")
			{
			onChangeselCredit()
			}*/
		}
		////__________________________________________________________________________________________
		function onClickBtnSaveAndContinue()
		{
			var selCredit=document.all.item("selCredit")
			    var selTypeCredit=document.all.item("selTypeCredit")
				var selName=document.all.item("selName")
				
			    var strDate=Form1.CreditDate_txtDay.value+"/"+Form1.CreditDate_txtMonth.value+"/"+Form1.CreditDate_txtYear.value
  				if (strDate=="//")
				{
					strDate=""
					
			
				}
				if(strDate=="" ||Form1.txtEndTime.value==""||Form1.txtStartTime.value=="" ||Form1.txtPersonelNO.value==""
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
					str+='<StartDate>'+strDate+'</StartDate>'
					str+='<EndDate>'+strDate+'</EndDate>'
					str+='<CreditType>'+selTypeCredit.options(selTypeCredit.selectedIndex).value+'</CreditType>'
					str+='<StartTime>'+Form1.txtStartTime.value+'</StartTime>'
					str+='<EndTime>'+Form1.txtEndTime.value+'</EndTime>'
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
				 
				var selCredit=document.all.item("selCredit")
			    var selTypeCredit=document.all.item("selTypeCredit")
				var selName=document.all.item("selName")
				
			    var strDate=Form1.CreditDate_txtDay.value+"/"+Form1.CreditDate_txtMonth.value+"/"+Form1.CreditDate_txtYear.value
  				if (strDate=="//")
				{
					strDate=""
					
			
				}
				if(strDate=="" ||Form1.txtEndTime.value==""||Form1.txtStartTime.value=="" ||Form1.txtPersonelNO.value==""
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
					str+='<StartDate>'+strDate+'</StartDate>'
					str+='<EndDate>'+strDate+'</EndDate>'
					str+='<CreditType>'+selTypeCredit.options(selTypeCredit.selectedIndex).value+'</CreditType>'
					str+='<StartTime>'+Form1.txtStartTime.value+'</StartTime>'
					str+='<EndTime>'+Form1.txtEndTime.value+'</EndTime>'
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
			////_____________________________________________________________________________________
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
		////_____________________________________________________________________________________
		
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
	<body dir="ltr" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload=" pageLoad()"
		rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssFrame" id="Page" dir="rtl" height="100%" cellSpacing="1" cellPadding="1"
				width="100%" align="center" border="0">
				<TR id="TopRow">
					<TD vAlign="top" align="center">
						<TABLE style="WIDTH: 100%; HEIGHT: 184px">
							<TR>
								<TD style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 263px"
									vAlign="top" align="center"><cc1:automationgrid id="grdClock" dir="rtl" runat="server" Width="763px" name="grdNumResult" SelectRowOnMouseMove="False"
										SelectRowOnClick="True" HtcAddress=" " ClientPageSize="0" CreateClientSideScripts="False" AutoGenerateColumns="False" ClientSorting="False"
										SendXML="DoNotSend" EnableClientPager="False" Scrolling="True" ShowHeader="False" UsingKeyBoard="False" Height="168px">
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
													<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SPersonelName") %>' title='<%# DataBinder.Eval(Container, "DataItem.PersonelName") %>'>
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="TypeName" HeaderText="„ÃÊ“">
												<HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="CreditTypeName" HeaderText="‰Ê⁄ „ÃÊ“">
												<HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="SDate" HeaderText=" «—ÌŒ">
												<HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="StartTime" HeaderText="«“ ”«⁄ ">
												<HeaderStyle Width="80px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" Width="80px"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="EndTime" HeaderText=" « ”«⁄ ">
												<HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" Width="80px"></ItemStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText=" Ê÷ÌÕ«  ">
												<HeaderStyle Width="100px"></HeaderStyle>
												<ItemStyle Width="100px"></ItemStyle>
												<ItemTemplate>
													<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SDes") %>' title='<%# DataBinder.Eval(Container, "DataItem.Des") %>'>
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
										</Columns>
									</cc1:automationgrid></TD>
							</TR>
							<tr>
								<td vAlign="top" align="center">
									<HR class="CssHorizontalLine" id="hh">
									<p></p>
									<table id="mainTable" dir="rtl" style="BORDER-RIGHT: lightblue thin inset; BORDER-TOP: lightblue thin solid; BORDER-LEFT: lightblue thin outset; WIDTH: 486px; BORDER-BOTTOM: lightblue thin solid; HEIGHT: 254px"
										cellSpacing="1" cellPadding="2" align="center" border="0">
										<tr>
											<td style="WIDTH: 80px; HEIGHT: 16px"> «—ÌŒ:</td>
											<td style="WIDTH: 154px; HEIGHT: 16px"><uc1:textdate id="CreditDate" runat="server"></uc1:textdate></td>
											<td style="WIDTH: 90px; HEIGHT: 16px">”«⁄«   —œœ:</td>
											<td id="tdInOut" style="HEIGHT: 16px" tabIndex="1" runat="server"></td>
										</tr>
										<tr>
											<td style="WIDTH: 80px; HEIGHT: 46px">‘.Å „ ﬁ«÷Ì:</td>
											<td style="WIDTH: 154px; HEIGHT: 46px"><INPUT class="TxtControls" id="txtPersonelNO" onblur="onBlurtxtPersonelNO()" style="WIDTH: 132px; HEIGHT: 21px"
													tabIndex="2" type="text" size="15" name="txtPersonelNO"></td>
											<td style="WIDTH: 90px; HEIGHT: 46px">‰«„ Ê ‰«„ Œ«‰Ê«œêÌ:</td>
											<td style="HEIGHT: 46px"><cc1:lcombo id="selName" tabIndex="3" runat="server" Width="132px" onchange="onChangedselName()"
													DataValueField="Val" DataTextField="title" LookupName="PersonName" ConnectionName="GenCnn" CssClass="TxtControls"></cc1:lcombo></td>
										</tr>
										<tr>
											<td style="WIDTH: 80px; HEIGHT: 25px">«“ ”«⁄ :</td>
											<td style="WIDTH: 154px; HEIGHT: 25px"><INPUT class="TxtControls" id="txtStartTime" onkeydown="OnKeyDownTime(this.value)" onblur="Timechk(this)"
													style="WIDTH: 132px; HEIGHT: 21px" tabIndex="4" type="text" size="15" name="Text1" runat="server"></td>
											<td style="WIDTH: 90px; HEIGHT: 25px"> « ”«⁄ :</td>
											<td style="HEIGHT: 25px"><INPUT class="TxtControls" id="txtEndTime" onkeydown="OnKeyDownTime(this.value)" onblur="Timechk(this)"
													style="WIDTH: 132px; HEIGHT: 21px" tabIndex="5" type="text" size="12" name="Text2" runat="server"></td>
										</tr>
										<tr>
											<td style="WIDTH: 80px; HEIGHT: 31px">„ÃÊ“:</td>
											<td style="WIDTH: 154px; HEIGHT: 31px"><cc1:lcombo id="selCredit" tabIndex="6" runat="server" Width="132px" onchange="onChangeselCredit()"
													ConnectionName="GenCnn" CssClass="TxtControls"></cc1:lcombo></td>
											<td style="WIDTH: 90px; HEIGHT: 31px">‰Ê⁄ „ÃÊ“:</td>
											<td style="HEIGHT: 31px"><cc1:lcombo id="selTypeCredit" tabIndex="7" runat="server" Width="132px" DataValueField="val"
													DataTextField="title" LookupName="CreditType" ConnectionName="GenCnn" CssClass="TxtControls"></cc1:lcombo></td>
										</tr>
										<tr>
											<td style="WIDTH: 80px; HEIGHT: 27px"> Ê÷ÌÕ« :</td>
											<td style="HEIGHT: 27px" colSpan="3"><asp:textbox id="txtDesc" tabIndex="8" runat="server" Width="385px" TextMode="MultiLine"></asp:textbox></td>
										</tr>
										<TR>
											<TD vAlign="bottom" align="center" colSpan="4">
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
									</table>
								</td>
							</tr>
						</TABLE>
					</TD>
				</TR>
				<TR id="DownRow">
					<TD style="DISPLAY: none"><input id="txtCreditId" style="DISPLAY: none" type="text" name="txtCreditId" runat="server">
						<input id="txtSubmit" style="DISPLAY: none" type="text" name="txtSubmit" runat="server">
						<input id="txtAlert" style="DISPLAY: none" type="text" name="txtAlert " runat="server">
						<input id="txtXML" style="DISPLAY: none" type="text" name="txtXML " runat="server">
						<input id="txtXMLSave" style="DISPLAY: none" type="text" name="txtXMLSave" runat="server">
						<input id="txtAjaxInOut" style="DISPLAY: none" type="text" name="txtAjaxInOut" runat="server">
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
