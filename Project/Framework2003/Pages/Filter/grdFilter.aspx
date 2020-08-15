<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../Calendar/TextDate.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="grdFilter.aspx.vb" Inherits="FrameWork.grdFilter"%>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>فيلتر</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<LINK href="../../Person/XTab.css" type="text/css" rel="stylesheet">
		<LINK href="../../Person/XSelectionStyle.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="../Person/General.js"></script>
		<script language="javascript">
			/////////////////////////////////////////////////////////////////
			function LoadForm()
			{
				window.name='grdFilter'
				Form1.target=window.name
				
				if(Form1.XMLMapFilter.value=='')
				{
					window.close()
					return
				}
				
				var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
				xmlDoc.async="false" ;
				xmlDoc.loadXML(document.all.item('XMLMapFilter').value)
				
				var xmlMap=xmlDoc.documentElement.selectNodes("/NewDataSet/MapFilter");
				for(var x=0;x<xmlMap.length;x++)
				{
					Addrow(XTabTable,xmlMap.item(x).selectSingleNode('ColName').text,xmlMap.item(x).selectSingleNode('ColTitle').text,xmlMap.item(x).selectSingleNode('TypeData').text,xmlMap.item(x).selectSingleNode('TypeFilter').text,xmlMap.item(x).selectSingleNode('RetLookup').text,xmlMap.item(x).selectSingleNode('Value1').text,xmlMap.item(x).selectSingleNode('Value2').text,xmlMap.item(x).selectSingleNode('Selected').text)
				}
			}
			/////////////////////////////////////////////////////////////////
			function Addrow(oGrid,ColName,ColTitle,TypeData,TypeFilter,RetLookup,Value1,Value2,Selected)
			{
				var newrowindex=oGrid.rows.length
				oGrid.insertRow()
				//oGrid.rows(newrowindex).className="CssItemStyle"
				oGrid.rows(newrowindex).style.backgroundcolor="#e7eeff"
				//check box
				oGrid.rows(newrowindex).insertCell()
				if(Selected=='1')
					oGrid.rows(newrowindex).cells(0).innerHTML="<input checked type='checkbox' />"
				else
					oGrid.rows(newrowindex).cells(0).innerHTML="<input type='checkbox' />"
				//setAttribute ColName
				oGrid.rows(newrowindex).setAttribute("ColName" ,ColName)
				//ColTitle
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(1).innerText=ColTitle
				oGrid.rows(newrowindex).cells(1).style.width="105px"
				//SelType
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(2).innerHTML=GetInnerHTMLSelType(TypeData)
				oGrid.rows(newrowindex).cells(2).style.width="105px"
				//TypeData
				oGrid.rows(newrowindex).insertCell()
				var Lcombox='Lcombo'+newrowindex
				var ValLcombox=''
				if(RetLookup=='0')
					ValLcombox='this.value'				
				else
					ValLcombox='this(this.selectedIndex).innerText'					
					
				if(TypeFilter==2)
					switch(TypeData)//int;Float;String;Lookup;Date;Time
					{
						case "int":
								oGrid.rows(newrowindex).cells(3).innerHTML=" <input value='"+Value1+"' onkeydown='OnKeyDownInt(this.value)' onblur='onclickChk("+newrowindex+")' class='txtControls' type='text' style='width:140px' > و <input value='"+Value2+"' onblur='onclickChk(this.value,2,"+newrowindex+")' class='txtControls' type='text' style='width:140px' >"
								break								
						case "Float":
								oGrid.rows(newrowindex).cells(3).innerHTML=" <input value='"+Value1+"' onkeydown='OnKeyDownFloat(this.value)' onblur='onclickChk(this.value,1,"+newrowindex+")' class='txtControls' type='text' style='width:140px' > و <input value='"+Value2+"' onblur='onclickChk(this.value,2,"+newrowindex+")' class='txtControls' type='text' style='width:140px' >"
								break
						case "String":
								oGrid.rows(newrowindex).cells(3).innerHTML=" <input value='"+Value1+"' onblur='onclickChk(this.value,1,"+newrowindex+")' class='txtControls' type='text' style='width:140px' > و <input value='"+Value2+"' onblur='onclickChk(this.value,2,"+newrowindex+")' class='txtControls' type='text' style='width:140px' >"
								break
						case "Lookup":
								oGrid.rows(newrowindex).cells(3).innerHTML="<select id="+'sel1'+newrowindex+" onchange='onclickChk("+ValLcombox+",1,"+newrowindex+")' class='txtControls'  style='width:305px' >"+document.all.item(Lcombox).innerHTML+"</select>"
								if(RetLookup=='0')
									document.all.item('sel1'+newrowindex).value=Value1				
								else
									document.all.item('sel1'+newrowindex)(document.all.item('sel1'+newrowindex).selecttedIndex).innerText=Value1		
								//oGrid.rows(newrowindex).cells(2).innerHTML="از <select onfocus='onclickChk("+newrowindex+")' class='txtControls' style='width:140px' >"+document.all.item(Lcombox).innerHTML+"</select> تا <select onfocus='onclickChk("+newrowindex+")' class='txtControls'  style='width:140px' >"+document.all.item(Lcombox).innerHTML+"</select>"
								break
						case "Date":
								oGrid.rows(newrowindex).cells(3).innerHTML=" <input value='"+Value1+"'  onkeydown='OnKeyDownDate(this.value)' onblur='datechk();onclickChk(this.value,1,"+newrowindex+")' class='txtControls'  type='text' style='width:140px' > و <input value='"+Value2+"' onkeydown='OnKeyDownDate(this.value)' onblur='datechk();onclickChk(this.value,2,"+newrowindex+")' class='txtControls'  type='text' style='width:140px' >"
								break
						case "Time":
								oGrid.rows(newrowindex).cells(3).innerHTML=" <input value='"+Value1+"' onkeydown='OnKeyDownTime(this.value)'  onblur='Timechk();onclickChk(this.value,1,"+newrowindex+")' class='txtControls' type='text' style='width:140px' > و <input value='"+Value2+"' onkeydown='OnKeyDownTime(this.value)'  onblur='Timechk();onclickChk(this.value,2,"+newrowindex+")' class='txtControls' type='text' style='width:140px' >"
								break
						case "Check":
								var check=false
								if (Value1=='1')
									check=true
								oGrid.rows(newrowindex).cells(3).innerHTML="<input  style='BACKGROUND-COLOR: transparent'  checked="+check+"  onblur='onclickChk(this.value,1,"+newrowindex+")' class='txtControls' type='checkbox'  > "
								break					
					}
				else
					switch(TypeData)
					{
						case "int":
								oGrid.rows(newrowindex).cells(3).innerHTML="<input value='"+Value1+"' onkeydown='OnKeyDownInt(this.value)' onblur='onclickChk(this.value,1,"+newrowindex+")' class='txtControls' type='text' style='width:305px' >"
								break
						case "Float":
								oGrid.rows(newrowindex).cells(3).innerHTML="<input value='"+Value1+"' onkeydown='OnKeyDownFloat(this.value)' onblur='onclickChk(this.value,1,"+newrowindex+")' class='txtControls' type='text' style='width:305px' >"
								break
						case "String":
								oGrid.rows(newrowindex).cells(3).innerHTML="<input value='"+Value1+"' onblur='onclickChk(this.value,1,"+newrowindex+")' class='txtControls' type='text' style='width:305px' >"
								break
						case "Lookup":
								oGrid.rows(newrowindex).cells(3).innerHTML="<select id="+'sel1'+newrowindex+" onchange='onclickChk("+ValLcombox+",1,"+newrowindex+")' class='txtControls'  style='width:305px' >"+document.all.item(Lcombox).innerHTML+"</select>"
								if(RetLookup=='0')
									document.all.item('sel1'+newrowindex).value=Value1				
								else
									document.all.item('sel1'+newrowindex)(document.all.item('sel1'+newrowindex).selecttedIndex).innerText=Value1		
								
								break
						case "Date":
								oGrid.rows(newrowindex).cells(3).innerHTML="<input value='"+Value1+"' onkeydown='OnKeyDownDate(this.value)' onblur='datechk();onclickChk(this.value,1,"+newrowindex+")' class='txtControls' type='text' style='width:305px' >"
								break
						case "Time":
								oGrid.rows(newrowindex).cells(3).innerHTML="<input value='"+Value1+"' onkeydown='OnKeyDownTime(this.value)' onblur='Timechk();onclickChk(this.value,1,"+newrowindex+")'  class='txtControls' type='text' style='width:305px' >"
								break
						case "Check":
								var check=false
								if (Value1==1)
									check=true
								oGrid.rows(newrowindex).cells(3).innerHTML="<input style='BACKGROUND-COLOR: transparent' checked="+check+"  onblur='onclickChk(this.value,1,"+newrowindex+")' class='txtControls' type='checkbox'  > "
								break
					}
				
			}
			//////////////////////////////////////////////////////////////////////////////////
			function GetInnerHTMLSelType(TypeData)
			{
				switch(TypeData)
				{
					case "int":
						return('<SELECT style="WIDTH: 100px" class="txtControls">'+Form1.SearchTypeInt.innerHTML+'<SELECT>')
						break
					case "Float":
						return('<SELECT style="WIDTH: 100px" class="txtControls">'+Form1.SearchTypeInt.innerHTML+'<SELECT>')
						break
					case "String":
						return('<SELECT style="WIDTH: 100px" class="txtControls">'+Form1.SearchTypeString.innerHTML+'<SELECT>')
						break
					case "Lookup":
						return('<SELECT style="WIDTH: 100px" class="txtControls">'+Form1.SearchTypeLookup.innerHTML+'<SELECT>')
						break
					case "Date":
						return('<SELECT style="WIDTH: 100px" class="txtControls">'+Form1.SearchTypeDate.innerHTML+'<SELECT>')
						break
					case "Time":
						return('<SELECT style="WIDTH: 100px" class="txtControls">'+Form1.SearchTypeDate.innerHTML+'<SELECT>')
						break
					case "Check":
						return('')
						break
				}
			}
			//////////////////////////////////////////////////////////////////////////////////
			function onclickChk(val,cell,SelectedRowIndex)
			{
				
				var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
				xmlDoc.async="false" ;
				xmlDoc.loadXML(document.all.item('XMLMapFilter').value)
				
				var xmlMap=xmlDoc.documentElement.selectNodes("/NewDataSet/MapFilter");
				var fld=''
				fld='Value'+cell
				
				var oGrid=XTabTable
				if(oGrid.rows(SelectedRowIndex).cells(3).all.item(0).value=='')
				{
					oGrid.rows(SelectedRowIndex).cells(0).firstChild.checked=false
					xmlMap.item(SelectedRowIndex).selectSingleNode('Selected').text=0
					xmlMap.item(SelectedRowIndex).selectSingleNode(fld).text=val
				}
				else
				{
					oGrid.rows(SelectedRowIndex).cells(0).firstChild.checked=true
					xmlMap.item(SelectedRowIndex).selectSingleNode('Selected').text=1
					xmlMap.item(SelectedRowIndex).selectSingleNode(fld).text=val
				}
				document.all.item('XMLMapFilter').value=xmlDoc.xml
			}
			//////////////////////////////////////////////////////////////////////////////////
			function MakeStrFilter()
			{
				var StrFilter=''
				var StrTitleFilter=''
				
				var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
				xmlDoc.async="false" ;
				xmlDoc.loadXML(document.all.item('XMLMapFilter').value)
				
				var xmlMap=xmlDoc.documentElement.selectNodes("/NewDataSet/MapFilter[Selected=1]");
				for(var x=0;x<xmlMap.length;x++)
				{
					if (StrFilter!='')
					{
						StrFilter+=' and '
						StrTitleFilter+=' و '
					}
					if(xmlMap.item(x).selectSingleNode('Value2').text=='')
					{
						StrFilter+=xmlMap.item(x).selectSingleNode('ColName').text+" like '%"+xmlMap.item(x).selectSingleNode('Value1').text+"%'"
						StrTitleFilter+=xmlMap.item(x).selectSingleNode('ColTitle').text+" داراي '"+xmlMap.item(x).selectSingleNode('Value1').text+"'"
					}
					else
					{
						StrFilter+=xmlMap.item(x).selectSingleNode('ColName').text+" >= '"+xmlMap.item(x).selectSingleNode('Value1').text+"' and "+xmlMap.item(x).selectSingleNode('ColName').text+" <= '"+xmlMap.item(x).selectSingleNode('Value2').text+"'"
						StrTitleFilter+=xmlMap.item(x).selectSingleNode('ColTitle').text+" بين '"+xmlMap.item(x).selectSingleNode('Value1').text+"' تا '"+xmlMap.item(x).selectSingleNode('Value2').text+"'"
					}
				}
				return(StrFilter+'#'+StrTitleFilter)
				
			}
			//////////////////////////////////////////////////////////////////////////////////
			function onClickBtnOK()
			{
				window.returnValue=MakeStrFilter()
				if(Form1.chkSave.checked==true)
					Form1.submit()
				else
					window.close()
			}
			//////////////////////////////////////////////////////////////////////////////////
			function onClickBtnCancel()
			{
				window.returnValue='0'
				window.close()
			}
			//////////////////////////////////////////////////////////////////////////////////
		</script>
		<script language="vbscript" src="../../Includes/Shdate.inc"></script>
		<script language="vbscript" src="../../Includes/MyTime.inc"></script>
	</HEAD>
	<body id="body" bottomMargin="0" bgColor="#e7eeff" leftMargin="0" topMargin="0" scroll="no"
		onload="LoadForm()" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssPage" id="Table1" height="100%" cellSpacing="1" cellPadding="1" width="100%"
				align="right" border="0">
				<TR>
					<TD vAlign="top" align="center" style="HEIGHT: 182px">
						<DIV class="DivStyle" style="DISPLAY: none; WIDTH: 100%; HEIGHT: 29px">
							<TABLE id="XTabTable_Header" cellSpacing="1" cellPadding="1" align="right" border="0">
								<THEAD style="DISPLAY: inline" align="right">
									<TR class="ShoperHeaderStyle">
										<TD class="CssHeaderStyle" style="BORDER-RIGHT: lightsteelblue 2px groove; BORDER-TOP: lightsteelblue 2px groove; BORDER-LEFT: lightsteelblue 2px groove; BORDER-BOTTOM: lightsteelblue 2px groove"
											align="center" width="20">&nbsp;</TD>
										<TD class="CssHeaderStyle" style="BORDER-RIGHT: lightsteelblue 2px groove; BORDER-TOP: lightsteelblue 2px groove; BORDER-LEFT: lightsteelblue 2px groove; BORDER-BOTTOM: lightsteelblue 2px groove"
											align="center" width="100">نام آيتم</TD>
										<TD class="CssHeaderStyle" style="BORDER-RIGHT: lightsteelblue 2px groove; BORDER-TOP: lightsteelblue 2px groove; BORDER-LEFT: lightsteelblue 2px groove; BORDER-BOTTOM: lightsteelblue 2px groove"
											align="center" width="100">نوع آيتم</TD>
										<TD class="CssHeaderStyle" style="BORDER-RIGHT: lightsteelblue 2px groove; BORDER-TOP: lightsteelblue 2px groove; BORDER-LEFT: lightsteelblue 2px groove; BORDER-BOTTOM: lightsteelblue 2px groove"
											align="center" width="300">مقدار</TD>
									</TR>
								</THEAD>
							</TABLE>
						</DIV>
						<DIV class="DivStyle" style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; WIDTH: 100%; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 100%"
							align="right">
							<TABLE id="XTabTable" cellSpacing="3" cellPadding="3">
								<THEAD style="DISPLAY: none">
								</THEAD>
							</TABLE>
						</DIV>
					</TD>
				</TR>
				<TR>
					<TD style="DISPLAY: none; HEIGHT: 10px" vAlign="top" align="right"><input id="XMLMapFilter" type="text" name="XMLMapFilter" runat="server">
						<SELECT class="XTabSel" id="SearchTypeString" style="WIDTH: 100px" tabIndex="1" name="SearchTypeString">
							<OPTION value="like '%<!--SearchVal-->'" selected>شروع شود با</OPTION>
							<OPTION value="='<!--SearchVal-->'">برابر</OPTION>
							<OPTION value="!='<!--SearchVal-->'">مخالف</OPTION>
							<OPTION value="like '%<!--SearchVal-->%'">داراي</OPTION>
							<OPTION value="not like '%<!--SearchVal-->%'">بدون</OPTION>
						</SELECT>
						<SELECT class="XTabSel" id="SearchTypeInt" style="WIDTH: 100px" tabIndex="1" name="SearchTypeInt">
							<OPTION value="like '%<!--SearchVal-->'">شروع شود با</OPTION>
							<OPTION value="=<!--SearchVal-->" selected>برابر</OPTION>
							<OPTION value="!=<!--SearchVal-->">مخالف</OPTION>
							<OPTION value="><!--SearchVal-->">بزرگتر</OPTION>
							<OPTION value=">=<!--SearchVal-->">بزرگتر و مساوي</OPTION>
							<OPTION value="<<!--SearchVal-->">کوچکتر</OPTION>
							<OPTION value="<=<!--SearchVal-->">کوچکتر و مساوي</OPTION>
							<OPTION value="like '%<!--SearchVal-->%'">داراي</OPTION>
							<OPTION value="not like '%<!--SearchVal-->%'">بدون</OPTION>
						</SELECT>
						<SELECT class="XTabSel" id="SearchTypeDate" style="WIDTH: 100px" tabIndex="1" name="SearchTypeDate">
							<OPTION value="=<!--SearchVal-->">برابر</OPTION>
							<OPTION value="!=<!--SearchVal-->">مخالف</OPTION>
							<OPTION value="><!--SearchVal-->">بزرگتر</OPTION>
							<OPTION value=">=<!--SearchVal-->">بزرگتر و مساوي</OPTION>
							<OPTION value="<<!--SearchVal-->">کوچکتر</OPTION>
							<OPTION value="<=<!--SearchVal-->">کوچکتر و مساوي</OPTION>
							<OPTION selected value="like '%<!--SearchVal-->%'">ما بين</OPTION>
						</SELECT>
						<SELECT class="XTabSel" id="SearchTypeLookup" style="WIDTH: 100px" tabIndex="1" name="SearchTypeLookup">
							<OPTION value="=<!--SearchVal-->" selected>برابر</OPTION>
							<OPTION value="!=<!--SearchVal-->">مخالف</OPTION>
						</SELECT>
					</TD>
				</TR>
				<tr>
					<td style="HEIGHT: 39px" vAlign="top" align="center">
						<HR class="CssHorizontalLine" width="100%" SIZE="1">
						<INPUT id="chkSave" type="checkbox" CHECKED name="chkSave" runat="server">ذخيره 
						فيلتر <INPUT class="CssbtnOK" id="Button1" style="WIDTH: 69px; HEIGHT: 35px" onclick="onClickBtnOK()"
							type="button" name="btnDown">&nbsp;<INPUT class="CssbtnCancel" id="btnDown" style="WIDTH: 69px; HEIGHT: 35px" onclick="onClickBtnCancel()"
							type="button" name="btnDown">
						<cc1:MySecurity id="OnLineUser" runat="server"></cc1:MySecurity></td>
				</tr>
			</TABLE>
		</form>
	</body>
</HTML>
