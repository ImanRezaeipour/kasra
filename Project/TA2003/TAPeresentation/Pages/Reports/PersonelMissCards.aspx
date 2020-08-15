<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../../Includes/Calendar/TextDate.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="PersonelMissCards.aspx.vb" Inherits="TA.PersonelMissCards" validateRequest="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>-------------------------------------------------------------------------------------------------------------------------------------------------------------------</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Includes/Styles/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/XTab.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/XSelectionStyle.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/Paging.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script src="../../../Includes/Script/General.js"></script>
		<script src="../../../Includes/Script/WaitShow.js"></script>
		<script language="javascript">
			var newrowindex=0 
			var root=''
			function OnClickBtnSave(){
			var SaveXml='<ReportsEntity>'
			var i=0
			var GridDate=''
			var GD=''
			var tempType
				for(i=0;i<XTabTable.rows.length;i++){
					if (XTabTable.rows(i).cells(3).firstChild.value!=""){
						var InOutKind;
						if (XTabTable.rows(i).cells(6).firstChild.checked==true)
							InOutKind=1
						else if (XTabTable.rows(i).cells(7).firstChild.checked==true)
							InOutKind=2
						GD=XTabTable.rows(i).cells(1).innerText
						GridDate=GD.substr(0,2)+"/"+GD.substr(3,2)+"/13"+GD.substr(6,4)
						SaveXml+="<Credit>"
						SaveXml+="<Type>0</Type>"
						SaveXml+="<StartDate>"+GridDate+"</StartDate>"
						SaveXml+="<EndDate>"+GridDate+"</EndDate>"
						SaveXml+="<CreditType>11500</CreditType>"
						SaveXml+="<StartTime>"+XTabTable.rows(i).cells(3).firstChild.value+"</StartTime>"
						SaveXml+="<EndTime>00:00</EndTime>"
						SaveXml+="<PersonID>"+Form1.txtPersonID.value+"</PersonID>"
						SaveXml+="<Des>"+XTabTable.rows(i).cells(4).firstChild.value+"</Des>"
						SaveXml+="<UserPersonelID>"+Form1.txtOnlineUser.value+"</UserPersonelID>"
						SaveXml+="<Daily>2</Daily>"
						if (Form1.txtSetting.value==0)
							SaveXml+="<InoutKind>"+InOutKind+"</InoutKind>"
						SaveXml+="</Credit>"}}
				SaveXml+="</ReportsEntity>"
				if(SaveXml=='<ReportsEntity></ReportsEntity>'){
					alert('ÂÌç ”«⁄   —œœÌ »—«Ì –ŒÌ—Â Ê«—œ ‰‘œÂ «” ')
					return}
				fnStartInterval()
				document.all.item("TdMsg").style.display="inline"
				Form1.txtSaveXml.value=SaveXml
				Form1.txtSubmit.value="Save"
				Form1.submit()}
			function OnClickBtnCancel(){
				window.returnValue=0
				window.close()}
			function Cleargrd(obj){
				var j=obj.rows.length-1
				for(;j>=0;--j)
					obj.deleteRow(j)
				newrowindex=0}
			function FillTabTable(){
				root='/CreditEntity/GetPersonelMissCards'
				var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
				if (Form1.txtXml.value=="")
					Form1.txtXml.value="<CreditEntity></CreditEntity>"
				xmlDoc.loadXML(Form1.txtXml.value);
				xmlDoc.setProperty("SelectionLanguage", "XPath");
				var xmlNodes=xmlDoc.documentElement.selectNodes(root)							
				var x=0
				if (xmlNodes.length!=0){
					for(;x<xmlNodes.length;++x){
						Param='"'+xmlNodes.item(x).selectSingleNode('Date').text+'"#'
						AddRow(XTabTable,xmlNodes.item(x).selectSingleNode('ExtendedCards').text,xmlNodes.item(x).selectSingleNode('JInOut').text,xmlNodes.item(x).selectSingleNode('JInOutComplet').text,xmlNodes.item(x).selectSingleNode('IsCover').text,x+1,Param)}}}
			function AddRow(oGrid,ExtendedCards,InOut,InOutComplet,IsCover,cntRow,Param)
			{
				oGrid.insertRow()
				var IsCoverSrc
				var IsCoverTitle											
				var cell
				cell=0
				oGrid.rows(newrowindex).insertCell()
				if (IsCover==0)
					oGrid.rows(newrowindex).cells(cell).innerHTML="<Img align=left src='../../../Includes/Images/Icons/Cross.gif' title='»œÊ‰ „ÃÊ“'>"
				else if (IsCover==1)
					oGrid.rows(newrowindex).cells(cell).innerHTML="<Img align=left src='../../../Includes/Images/Icons/BlueTick.gif' title='ÅÊ‘‘ ò«„·  Ê”ÿ „ÃÊ“'>"
				else if (IsCover==2)
					oGrid.rows(newrowindex).cells(cell).innerHTML="<Img align=left src='../../../Includes/Images/Icons/GreenTik.gif' title='⁄œ„ ÅÊ‘‘ ò«„·  Ê”ÿ „ÃÊ“'>"
				cell=cell+1	
				var p=new String
				var x=0
				while (x<getCntChar('#',Param)){
					p=getArray(Param,x,'#')
					oGrid.rows(newrowindex).insertCell()
					oGrid.rows(newrowindex).cells(cell).innerText=""				
					var subTitle=''
					oGrid.rows(newrowindex).cells(cell).innerText=p.substring(1,p.length-1)		
					//<DIV Width='50px' title='"+subTitle+"'><font size='2px' color="+color+"> "+subStr+"</font></DIV>			
					cell=cell+1	
					x=x+1
					if (cell==2){
					oGrid.rows(newrowindex).insertCell()
					if (InOutComplet.length>20){
						oGrid.rows(newrowindex).cells(cell).innerText=InOutComplet.substring(0,20)
						oGrid.rows(newrowindex).cells(cell).title=InOutComplet}
					else
						oGrid.rows(newrowindex).cells(cell).innerText=InOutComplet
					cell=cell+1}
					/*if (cell==2){
						var Cnt
						if (InOutComplet!="")
							Cnt=parseInt(getCntChar(';',InOutComplet)+1)
						var h=0
						var S
						var Complete
						var C
						var InOutType
						var TempInOutComplet=InOutComplet
						var ColorInOut=''
						var color=''
						var subTitle=''
						for(;h<Cnt;++h){
							S=TempInOutComplet.search(';')
							if (S=='-1')
								S=TempInOutComplet.length
							Complete=TempInOutComplet.substring(0,S)
							C=Complete.search(',')
							if (C=='-1')
								C=Complete.length
							InOutType=Complete.substring(0,C)
							subStr=Complete.substring(parseInt(C)+1,Complete.length)
							if (parseInt(InOutType)==1){
								color='#009900'
								subTitle='Ê—Êœ  Ê”ÿ ò«—  “‰'}
							if (parseInt(InOutType)==2){
								color='ff33ff'
								subTitle='Ê—Êœ  Ê”ÿ „œÌ— ”Ì” „'}
							if (parseInt(InOutType)==3){
								color='#ff6600'
								subTitle='Ê—Êœ  Ê”ÿ ò«—»—'}	
							if (InOut.length>23)
								ColorInOut+="<TD><DIV onclick='onClickInOutLink(this)' Width='50px' title='"+subTitle+"'><font size='2px' style='CURSOR: hand; TEXT-DECORATION: underline' color="+color+"> "+subStr+"</font></DIV></TD> "
							else
								ColorInOut+="<TD><DIV Width='50px' title='"+subTitle+"'><font size='2px' color="+color+"> "+subStr+"</font></DIV></TD> "
							TempInOutComplet=TempInOutComplet.substring(parseInt(S)+1,TempInOutComplet.length)}		
						oGrid.rows(newrowindex).insertCell()
						oGrid.rows(newrowindex).cells(cell).innerHTML="<TABLE width='100%' title='"+InOut+"'><TR>"+ColorInOut+"</TR></TABLE>"
						cell=cell+1}
					*/
					if (cell==3){
						oGrid.rows(newrowindex).insertCell()
						oGrid.rows(newrowindex).cells(cell).innerHTML="<input type='text' style='WIDTH: 70px' onkeydown='OnKeyDownTime(this.value)' onblur='Timechk(this)' class='txtControls'>"
						cell=cell+1}
					if (cell==4){
						oGrid.rows(newrowindex).insertCell()
						oGrid.rows(newrowindex).cells(cell).innerHTML="<input type='text' style='WIDTH: 160px' class='txtControls'>"
						cell=cell+1}		
					if (cell==5){
						var Cnt2
						var h2=0
						var S2
						var Complete2
						var C2
						var DivInOut=''
						var TempExtendedCards=ExtendedCards
						var textExtendedCards=''
						var titleExtendedCards=''
						if (ExtendedCards!="")
							Cnt2=parseInt(getCntChar(';',TempExtendedCards)+1)
						for(;h2<Cnt2;++h2){
							S2=TempExtendedCards.search(';')
							if (S2=='-1')
								S2=TempExtendedCards.length
							Complete2=TempExtendedCards.substring(0,S2)
							C2=Complete2.search(',')
							if (C2=='-1')
								C2=Complete2.length
							textExtendedCards=Complete2.substring(0,C2)
							titleExtendedCards=Complete2.substring(parseInt(C2)+1,Complete2.length)
							DivInOut+="<TD><DIV Width='50px' title='"+titleExtendedCards+"'>"+textExtendedCards+"</DIV></TD> "
							TempExtendedCards=TempExtendedCards.substring(parseInt(S2)+1,TempExtendedCards.length)}
						oGrid.rows(newrowindex).insertCell()
						oGrid.rows(newrowindex).cells(cell).innerHTML="<TABLE width='100%' title='"+InOut+"'><TR>"+DivInOut+"</TR></TABLE>"
						cell=cell+1	
						if (cell==6){
							oGrid.rows(newrowindex).insertCell()
							oGrid.rows(newrowindex).insertCell()
							oGrid.rows(newrowindex).cells(6).innerHTML="<input type='radio' checked name='"+newrowindex+"'>"
							oGrid.rows(newrowindex).cells(7).innerHTML="<input type='radio' name='"+newrowindex+"'>"
							if (Form1.txtSetting.value!=0){
								oGrid.rows(newrowindex).cells(6).firstChild.disabled=true
								oGrid.rows(newrowindex).cells(7).firstChild.disabled=true}}}}
				oGrid.rows(newrowindex).cells(1).innerText=Trim(oGrid.rows(newrowindex).cells(1).innerText)
				Form1.txtDayDate.value=Trim(Form1.txtDayDate.value)
				if(oGrid.rows(newrowindex).cells(1).innerText==Form1.txtDayDate.value)
					oGrid.rows(newrowindex).className = "CssSelectedItemStyle"
				else		
					oGrid.rows(newrowindex).className = "XItemStyle"
				oGrid.rows(newrowindex).align="center"
				oGrid.rows(newrowindex).cells(0).style.width="18px"
				oGrid.rows(newrowindex).cells(1).style.width="80px"
				oGrid.rows(newrowindex).cells(2).style.width="370px"
				oGrid.rows(newrowindex).cells(3).style.width="90px"
				oGrid.rows(newrowindex).cells(4).style.width="165px"
				oGrid.rows(newrowindex).cells(5).style.width="130px"
				oGrid.rows(newrowindex).cells(6).style.width="30px"
				oGrid.rows(newrowindex).cells(7).style.width="30px"												
				newrowindex=newrowindex+1}
			function Trim(str){
				j=str.length-1 
				while(str.substr(j,1)==" "){
					str=str.substr(0,str.length-1)
					j=str.length-1}
				j=0
				while(str.substr(j,1)==" "){
					str=str.substr(1,str.length)
					l=str.length}
				return str
			}
			function pageLoad(){
				fnStopInterval()
				document.all.item("TdMsg").style.display="none"
				window.name="PersonelMissCards.aspx"
				Form1.target=window.name
				if (Form1.txtSaveAlert.value!=""){
					alert(Form1.txtSaveAlert.value)
					Form1.txtSaveAlert.value=""
					window.returnValue = Form1.txtRetValue.value;
					try {
					    var oWinParent = window.dialogArguments
					    if (oWinParent.RefreshThisRow)
					        oWinParent.RefreshThisRow()
					}
					catch (e) { }
					window.close()}
				FillTabTable()}
		</script>
	</HEAD>
	<body dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="pageLoad()"
		rightMargin="0" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="center" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" height="100%" cellSpacing="0" cellPadding="0" width="100%"
							border="0">
							<tr>
								<td vAlign="middle" align="center">
									<TABLE class="CssPage" id="Page" style="WIDTH: 933px; HEIGHT: 496px" height="496" cellSpacing="1"
										cellPadding="1" width="933" border="0">
										<TR>
											<TD id="TopRow" style="DISPLAY: inline; HEIGHT: 402px" vAlign="top" align="center">
												<TABLE id="Table1" style="BORDER-RIGHT: lightblue thin inset; BORDER-TOP: lightblue thin solid; BORDER-LEFT: lightblue thin outset; WIDTH: 401px; BORDER-BOTTOM: lightblue thin solid; HEIGHT: 29px"
													cellSpacing="1" cellPadding="1" width="401" border="0">
													<TR>
														<TD style="WIDTH: 107px">‘„«—Â Å—”‰·Ì&nbsp; &nbsp;:</TD>
														<TD id="PersonIDTD" style="WIDTH: 70px; COLOR: #ff0000" runat="server"></TD>
														<TD style="WIDTH: 73px">‰«„ Å—”‰·</TD>
														<TD id="NameTD" style="COLOR: #ff0000" runat="server"></TD>
													</TR>
												</TABLE>
												<TABLE id="XTabTable_Header" style="BORDER-RIGHT: #6666cc thin inset; BORDER-TOP: #6666cc thin solid; BORDER-LEFT: #6666cc thin outset; WIDTH: 99.51%; BORDER-BOTTOM: #6666cc thin solid; HEIGHT: 29px"
													cellSpacing="1" cellPadding="1" width="918" border="0">
													<TR>
														<TD style="WIDTH: 28px; BACKGROUND-COLOR: #83afe5"></TD>
														<TD style="BORDER-RIGHT: #6666cc thin inset; WIDTH: 74px; BACKGROUND-COLOR: #83afe5"
															align="center"> «—ÌŒ</TD>
														<TD style="BORDER-RIGHT: #6666cc thin inset; WIDTH: 364px; BACKGROUND-COLOR: #83afe5"
															align="center"> —œœÂ«</TD>
														<TD style="BORDER-RIGHT: #6666cc thin inset; WIDTH: 83px; BACKGROUND-COLOR: #83afe5"
															align="center">”«⁄ </TD>
														<TD style="BORDER-RIGHT: #6666cc thin inset; WIDTH: 165px; BACKGROUND-COLOR: #83afe5"
															align="center">‘—Õ</TD>
														<TD style="BORDER-RIGHT: #6666cc thin inset; WIDTH: 130px; BACKGROUND-COLOR: #83afe5"
															align="center">ò«— Â«Ì œ— Ã—Ì«‰</TD>
														<TD style="BORDER-RIGHT: #6666cc thin inset; WIDTH: 30px; BACKGROUND-COLOR: #83afe5"
															align="center">Ê—Êœ</TD>
														<TD style="BORDER-RIGHT: #6666cc thin inset; WIDTH: 30px; BACKGROUND-COLOR: #83afe5"
															align="center">Œ—ÊÃ</TD>
													</TR>
												</TABLE>
												<DIV style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; WIDTH: 99.51%; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 78.05%">
													<TABLE id="XTabTable">
														<THEAD style="DISPLAY: none">
														</THEAD>
													</TABLE>
												</DIV>
											</TD>
										</TR>
										<TR>
											<TD style="DISPLAY: inline; HEIGHT: 47px" vAlign="top" align="center">
												<HR class="CssHorizontalLine" style="WIDTH: 51.51%; HEIGHT: 2px" SIZE="2">
												<TABLE id="Table2" style="WIDTH: 24px; HEIGHT: 42px" cellSpacing="3" cellPadding="2" width="24"
													border="0">
													<TR>
														<TD style="WIDTH: 90px"><INPUT class="CssBtnSave" id="BtnSave" title="–ŒÌ—Â" style="WIDTH: 67px; HEIGHT: 32px"
																onclick="OnClickBtnSave()" type="button" name="BtnSave"></TD>
														<TD style="WIDTH: 90px"><INPUT class="BtnCancel" id="BtnCancel" title="«‰’—«›" style="WIDTH: 67px; HEIGHT: 32px"
																onclick="OnClickBtnCancel()" type="button" name="BtnCancel"></TD>
													</TR>
												</TABLE>
												<TABLE id="Table3" cellSpacing="1" cellPadding="1" width="1" border="0" style="WIDTH: 1px; HEIGHT: 30px">
													<TR>
														<TD id="TdMsg" style="WIDTH: 57px">
															<TABLE id="Table5" style="WIDTH: 141px; HEIGHT: 20px" cellSpacing="0" borderColorDark="#003366"
																cellPadding="0" width="141" align="left" borderColorLight="#6699cc" border="1">
																<TR>
																	<TD id="Td1" bgColor="#ffffff"></TD>
																	<TD id="Td2" bgColor="#ffffff"></TD>
																	<TD id="Td3" bgColor="#ffffff"></TD>
																	<TD id="Td4" bgColor="#ffffff"></TD>
																	<TD id="Td5" style="WIDTH: 22px" bgColor="#ffffff"></TD>
																	<TD id="Td6" bgColor="#ffffff"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<TR>
					</TD></TR>
				<TR>
					<TD style="DISPLAY: none"><input id="txtXml" type="text" name="txtXml" runat="server">
						<input id="txtOnlineUser" type="text" name="txtOnlineUser" runat="server"> <input id="txtPersonID" type="text" name="txtPersonID" runat="server">
						<input id="txtDayDate" type="text" name="txtDayDate" runat="server"> <input id="txtSDate" type="text" name="txtSDate" runat="server">
						<input id="txtEDate" type="text" name="txtEDate" runat="server"> <input id="txtSubmit" type="text" name="txtSubmit" runat="server">
						<input id="txtSaveAlert" type="text" name="txtSaveAlert" runat="server"> <input id="txtSaveXml" type="text" name="txtSaveXml" runat="server"><input type="text" id="txtSetting" runat="server">
						<input type="text" id="txtRetValue" runat="server" NAME="txtRetValue">
						<cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity></TD>
				</TR>
			</table>
		</form>
	</body>
</HTML>
