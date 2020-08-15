<%@ Register TagPrefix="cc1" Namespace="WEBLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="AccessRole.aspx.vb" Inherits="FrameWork.AccessRole" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>AccessRole</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/TreeStyles.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		//////////////////////////////////////////////////////////////////////////////
		function ChangeColorcmbSubSys(MemberId,Type)
		{
			var tSubSysId=Form1.selSubSys.value
			var ttSubSysId=tSubSysId
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLMemberAccess.value);
						
			var xml1;
			var x;
			//and AccessId/10000=0
			xml1=xmlDoc.documentElement.selectNodes("/UserEntity/MemberAccess[MemberId="+MemberId+" and Type='"+Type+"' and AccessId>=10000]");
			var subSysId
			for(x=1;x<document.all('selSubSys').length;x++)
			{
				document.all('selSubSys').all(x).style.color='black'
			}
			for(x=0;x<xml1.length;x++)
			{
				subSysId=xml1.item(x).selectSingleNode('AccessId').text/10000
				Form1.selSubSys.value=subSysId
				document.all('selSubSys').all(parseInt(Form1.selSubSys.selectedIndex)).style.color='red'
				if(tSubSysId==subSysId)
				{
					if(tSubSysId==document.all('selSubSys').length-1)
						ttSubSysId=1
					else
						ttSubSysId=document.all('selSubSys').length-1
				}
				Form1.selSubSys.value=ttSubSysId
			}
			Form1.selSubSys.value=tSubSysId
		}
		//////////////////////////////////////////////////////////////////////////////////
			function onLoad()
			{
				document.all("Body").scroll="no"
				Form1.RoleId.value=window.parent.frames('FrameGridPersons').document.all.item('RoleId').value
				switch (Form1.txtSubmit.value)
				{
					case "SaveRole":
						ChangeColorcmbSubSys(Form1.RoleId.value,'R')
						LoadDataTreeRole(Form1.RoleId.value,'R')
						alert('Å”  ”«“„«‰Ì –ŒÌ—Â ‘œ')
						Form1.txtSubmit.value=""
						break;
						
					case "OnChangeSubSysId":
						LoadDataTreeRole(Form1.RoleId.value,'R')
						Form1.txtSubmit.value=""
						break
				}
			}
		//////////////////////////////////////////////////////////////////////////////////
		function LoadDataTreeRole(MemberId,Type)
		{
			//all false
			ClearXMLTreeRole(document.all("TreeAccess")(1).all	)
			
			//Deine xml variable
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLMemberAccess.value);
						
			var xml1;
			var x1;
			
			var xmlDocs = new ActiveXObject("Microsoft.XMLDOM");
			xmlDocs.async="false" ;
			xmlDocs.loadXML(Form1.XMLRole.value);
			
			var xmls1;
			
			//define TreeAccess variable
			var objCollection=document.all("TreeAccess")(1).all	
			var t;
			
			xml1=xmlDoc.documentElement.selectNodes("/UserEntity/MemberAccess[MemberId="+MemberId+" and Type='"+Type+"']");
			var c
			c=0
			
				for(t=0;t<objCollection.length;++t)
				{
					if (objCollection.item(t).tagName=="INPUT")
					{
						objCollection.item(t).checked=false
						objCollection.item(t).style.backgroundColor=''
						for(x1=0;x1<xml1.length;++x1)
						{
							if (objCollection.item(t).accID==xml1.item(x1).childNodes(0).text )
							{
								xmls1=xmlDocs.documentElement.selectSingleNode("/UserEntity/RoleBranch[SelfId="+xml1.item(x1).childNodes(0).text+" and Type='S']");
								xmls1.childNodes(3).text=xml1.item(x1).childNodes(3).text
								xmls1.childNodes(5).text=xml1.item(x1).childNodes(4).text
								
								switch (xml1.item(x1).childNodes(3).text)
								{
									case "1":
										objCollection.item(t).checked=true
										objCollection.item(t).style.backgroundColor='#dcdcdc'
										break;
									case "2":
										objCollection.item(t).checked=true
										objCollection.item(t).style.backgroundColor=''
										break;
									default:
										objCollection.item(t).checked=false
										objCollection.item(t).style.backgroundColor=''
										xmls1.childNodes(3).text=0
										xmls1.childNodes(5).text=0
								}
								break;
							}
						}
					}
				}
			Form1.XMLRole.value=xmlDocs.xml
			
		}
		///////////////////////////////////////////mode click tree Role///////////////////////////////////
		function ManageCheckChild1(Chk)
		{
			//Deine xml variable
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLRole.value);
						
			var xml1;
			var x1;
			
			//define TreeAccess variable
			var objCollection=document.all("TreeAccess")(1).all	
			var t;
				
			xml1=xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[SelfId="+Chk.accID+" and Type!='P']");
			for(x1=0;x1<xml1.length;++x1)
			{
				for(t=objCollection.length-1;t>0;--t)
				{
					if (objCollection.item(t).tagName=="INPUT")
					{
						if (objCollection.item(t).accID==xml1.item(x1).childNodes(1).text )
						{
							objCollection.item(t).checked=true
							objCollection.item(t).style.backgroundColor=''
							break
						}
					}
				}
			}	
		}
		////////////////////////////////////////////
		function WriteCurCntChildForChilds(Chk)
		{
			//Deine xml variable
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLRole.value);
						
			var xml1;
			var x1;
			
			var xmls1;
					
			//define TreeAccess variable
			var objCollection=document.all("TreeAccess")(1).all	
			var t;
				
				
			xml1=xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[SelfId="+Chk.accID+" and Type!='P']");
			for(x1=0;x1<xml1.length;++x1)
			{
				for(t=objCollection.length-1;t>0;--t)
				{
					if (objCollection.item(t).tagName=="INPUT")
					{
						if (objCollection.item(t).accID==xml1.item(x1).childNodes(1).text)
						{
							xmls1=xmlDoc.documentElement.selectSingleNode("/UserEntity/RoleBranch[SelfId="+xml1.item(x1).childNodes(1).text+" and Type='S']");
							xmls1.childNodes(5).text=parseInt(xmls1.childNodes(4).text)+1
							xmls1.childNodes(3).text=2
							break
						}
					}
				}
			}	
			Form1.XMLRole.value=xmlDoc.xml	
		}
		////////////////////////////////////////////
		function ManageCheckChild0(Chk)
		{
			//Deine xml variable
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLRole.value);
						
			var xml1;
			var x1;
			
			var xmls1;
					
			//define TreeAccess variable
			var objCollection=document.all("TreeAccess")(1).all	
			var t;
				
				
			xml1=xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[SelfId="+Chk.accID+" and Type!='P']");
			for(x1=0;x1<xml1.length;++x1)
			{
				for(t=objCollection.length-1;t>0;--t)
				{
					if (objCollection.item(t).tagName=="INPUT")
					{
						if (objCollection.item(t).accID==xml1.item(x1).childNodes(1).text)
						{
							objCollection.item(t).checked=false
							objCollection.item(t).style.backgroundColor=''
							xmls1=xmlDoc.documentElement.selectSingleNode("/UserEntity/RoleBranch[SelfId="+xml1.item(x1).childNodes(1).text+" and Type='S']");
							xmls1.childNodes(5).text=0
							xmls1.childNodes(3).text=0
							break
						}
					}
				}
			}
			Form1.XMLRole.value=xmlDoc.xml	
		}
		////////////////////////////////////////////
		function WriteCurCntChildForParents(Chk)
		{
			//Deine xml variable
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLRole.value);
						
			var xml1;
			var x1;
			
			var xml2;
			var x2;
			
			var xmls1;
			
			var xmls2;
			
			//define TreeAccess variable
			var objCollection=document.all("TreeAccess")(1).all	
			var t;
				
			//define cnt variable
			var cnt
			cnt=0
			
			var levelx1
			levelx1=0
				
			xml1=xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[SelfId="+Chk.accID+" and Type='P']");
			for(x1=0;x1<xml1.length;++x1)
			{
				levelx1=parseInt(xml1.item(x1).childNodes(6).text)+1
				xml2=xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[SelfId="+xml1.item(x1).childNodes(1).text+" and Type='C' and CurLevel="+levelx1+"]");
				for(x2=0;x2<xml2.length;++x2)
				{
					xmls1=xmlDoc.documentElement.selectSingleNode("/UserEntity/RoleBranch[SelfId="+xml2.item(x2).childNodes(1).text+" and Type='S']");
					if (xmls1.childNodes(5).text!=0)
						cnt=cnt+parseInt(xmls1.childNodes(5).text)
					if (cnt==xmls1.childNodes(4).text & xmls1.childNodes(5).text!=0)
					{
						cnt=cnt+1
					}
				}
				xmls2=xmlDoc.documentElement.selectSingleNode("/UserEntity/RoleBranch[SelfId='"+xml1.item(x1).childNodes(1).text+"' and Type='S']");
				xmls2.childNodes(5).text=cnt

				if (cnt>=xmls2.childNodes(4).text)
				{
					ManageColorParent(xmls2.childNodes(1).text,2)//checked=true and backcolor=gray
					xmls2.childNodes(3).text=2
				}
				
				if (cnt<xmls2.childNodes(4).text & cnt!=0)
				{
					ManageColorParent(xmls2.childNodes(1).text,1)//checked=true and backcolor=gray
					xmls2.childNodes(3).text=1
				}
				
				if (cnt==0)
				{
					ManageColorParent(xmls2.childNodes(1).text,0)//checked=false and backcolor=''
					xmls2.childNodes(3).text=0
				}
				cnt=0				
			}
			Form1.XMLRole.value=xmlDoc.xml	
		}
		////////////////////////////////////////////
		function ManageColorParent(RoleId,flag)
		{
			//define TreeAccess variable
			var objCollection=document.all("TreeAccess")(1).all	
			var t;
			
			switch (flag)
			{
				case 2:
					for(t=objCollection.length-1;t>0;--t)
					{
						if (objCollection.item(t).tagName=="INPUT")
						{
							if (objCollection.item(t).accID==RoleId)
							{
								objCollection.item(t).checked=true
								objCollection.item(t).style.backgroundColor=''
								break
							}
						}
					}
					break;
				case 1:
					for(t=objCollection.length-1;t>0;--t)
					{
						if (objCollection.item(t).tagName=="INPUT")
						{
							if (objCollection.item(t).accID==RoleId)
							{
								objCollection.item(t).checked=true
								objCollection.item(t).style.backgroundColor='#dcdcdc'
								break
							}
						}
					}
					break;
				case 0:
					for(t=objCollection.length-1;t>0;--t)
					{
						if (objCollection.item(t).tagName=="INPUT")
						{
							if (objCollection.item(t).accID==RoleId)
							{
								objCollection.item(t).checked=false
								objCollection.item(t).style.backgroundColor=''
								break
							}
						}
					}
					break;
			}
		}
		////////////////////////////////////////////
		function ManageCheck(Chk)
		{
			
			if (Chk.checked==true)
			{
				ManageCheckChild1(Chk)
				WriteCurCntChildForChilds(Chk)
				WriteCurCntChildForParents(Chk)
			}
			else
			{
				ManageCheckChild0(Chk)
				WriteCurCntChildForParents(Chk)
			}
		}
		//////////////////////////////////////////mode save////////////////////////////////////
		function onclickbtnSave()
		{
			Form1.RoleId.value=window.parent.frames('FrameGridPersons').document.all.item('RoleId').value
			if (Form1.RoleId.value=="")
				alert("»«Ìœ Ìò ¬Ì „ «“ ê—Ìœ «‰ Œ«» ‘Êœ")
			else
			{
				MakeXMLAccessRole()
				Form1.txtSubmit.value="SaveRole"
				Form1.submit()
			}
			
		}
		////////////////////////////////////////
		function MakeXMLAccessRole()
		{
			//Deine xml variable
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLRole.value);
						
			var xml1;
			var x1;
			var strXMLAccessRole=""
			
			xml1=xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[Type='S' and Checked!=0]");
			for(x1=0;x1<xml1.length;++x1)
			{
				strXMLAccessRole +="<MemberAccess>"
				strXMLAccessRole +="<AccessId>"+xml1.item(x1).childNodes(1).text+ "</AccessId>";
				strXMLAccessRole +="<FlagChecked>" + xml1.item(x1).childNodes(3).text + "</FlagChecked>";			  
				strXMLAccessRole +="<CurCntChild>" + xml1.item(x1).childNodes(5).text + "</CurCntChild>";			  
				strXMLAccessRole +="</MemberAccess>"; 
			}
			if (strXMLAccessRole!="")
				Form1.XMLAccessRole.value = "<UserEntity>" +strXMLAccessRole+ "</UserEntity>"
			else
				Form1.XMLAccessRole.value=""
		}
		////////////////////////////////////////////mode click buttons///////////////////////
		function ClearXMLTreeRole(objCollection)
		{
			//Deine xml variable
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLRole.value);
						
			var xml1;
			var x1;
			
			var xmls1;
			
			var t;
			
			xml1=xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[Type='S']");
			
			for(x1=0;x1<xml1.length;++x1)
			{
				xmls1=xmlDoc.documentElement.selectSingleNode("/UserEntity/RoleBranch[SelfId="+xml1.item(x1).childNodes(0).text+" and Type='S']");
				xmls1.childNodes(3).text=0
				xmls1.childNodes(5).text=0
			}
			Form1.XMLRole.value=xmlDoc.xml
			}
		/////////////////////////////////////////
		function ClearCheckTreeRole(objCollection)
		{
			//Deine xml variable
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLRole.value);
						
			var xml1;
			var x1;
			
			var xmls1;
			
			var t;
			
			xml1=xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[Type='S']");
			
			for(t=objCollection.length-1;t>0;--t)
				if (objCollection.item(t).tagName=="INPUT")
					for(x1=0;x1<xml1.length;++x1)
						if (objCollection.item(t).accID==xml1.item(x1).childNodes(0).text )
						{
							xmls1=xmlDoc.documentElement.selectSingleNode("/UserEntity/RoleBranch[SelfId="+xml1.item(x1).childNodes(0).text+" and Type='S']");
							xmls1.childNodes(3).text=0
							xmls1.childNodes(5).text=0
							objCollection.item(t).checked=false
							objCollection.item(t).style.backgroundColor=''
							break
						}
			Form1.XMLRole.value=xmlDoc.xml
			}
			////////////////////////////////////////////////////////////////////////////////////////////
		</script>
	</HEAD>
	<body id="Body" dir="rtl" bottomMargin="0" bgColor="#e7eeff" leftMargin="0" topMargin="0"
		scroll="no" onload="onLoad()" rightMargin="0">
		<P>
			<form id="Form1" method="post" runat="server">
				<TABLE id="Table4" style="WIDTH: 191px; HEIGHT: 524px" cellSpacing="1" cellPadding="1"
					width="191" align="right" border="0">
					<TR>
						<TD>
							<TABLE id="Table5" style="HEIGHT: 36px" cellSpacing="1" cellPadding="1" width="100%" align="right"
								border="0">
								<TR>
									<TD style="WIDTH: 68px" vAlign="middle">‰«„ ”Ì” „
									</TD>
									<TD style="WIDTH: 146px" vAlign="middle"><cc1:lcombo id="selSubSys" runat="server" LookupName="SubSys" CssClass="TxtControls" Width="135px"></cc1:lcombo></TD>
									<TD vAlign="top"><INPUT class="CssBtnLimitSerach" id="BtnLimitSubSys" dir="rtl" title="‰„«Ì‘ „ÕœÊœ" style="WIDTH: 35px; HEIGHT: 32px"
											type="button" name="BtnLimitSubSys" runat="server"></TD>
									<TD vAlign="top"><INPUT class="CssBtnShow" id="BtnShowSubSys" dir="rtl" title="‰„«Ì‘" style="WIDTH: 35px; HEIGHT: 32px"
											type="button" name="BtnShowSubSys" runat="server"></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD vAlign="top">
							<DIV style="OVERFLOW: auto; WIDTH: 289px; HEIGHT: 460px" align="right"><cc1:tree id="TreeAccess" runat="server" Width="197px" Height="364px"></cc1:tree></DIV>
						</TD>
					</TR>
					<tr>
						<TD style="DISPLAY: none"><INPUT id="parent" style="WIDTH: 1px" type="hidden" name="parent">
							<INPUT id="BeforePrevStyle" style="WIDTH: 1px" type="hidden" size="1" name="BeforePrevStyle">
							<INPUT id="PrevrecID" style="WIDTH: 1px" type="hidden" size="1" name="PrevrecID">
							<INPUT id="recID" style="WIDTH: 1px" type="hidden" size="1" name="recID"> <INPUT id="PageName" style="WIDTH: 1px" type="hidden" size="1" value="AccessRole" name="PageName">
							<asp:textbox id="XMLRole" style="DISPLAY: none" runat="server" Width="200px"></asp:textbox><asp:textbox id="XMLAccessRole" style="DISPLAY: none" runat="server" Width="1px"></asp:textbox><INPUT id="RoleId" type="text" name="RoleId" runat="server">
							<INPUT id="txtSubmit" style="DISPLAY: none; WIDTH: 1px" type="text" name="txtSubmit" runat="server">
							<asp:textbox id="XMLMemberAccess" style="DISPLAY: none" runat="server"></asp:textbox></TD>
					</tr>
				</TABLE>
			</form>
		</P>
	</body>
</HTML>
