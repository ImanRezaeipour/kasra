<%@ Register TagPrefix="cc1" Namespace="WEBLib" Assembly="WEBLib" %>
<%@ Register TagPrefix="cc2" Namespace="GlobalLibrary" Assembly="GlobalLibrary" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="user.aspx.vb" Inherits="FrameWork.user" validateRequest="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>user</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR" />
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE" />
		<meta content="JavaScript" name="vs_defaultClientScript" />
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
		<LINK href="<%=commonLib.StyleLibURL%>" type=text/css rel=stylesheet />
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet" />
		<LINK href="../../Includes/TreeStyles.css" type="text/css" rel="stylesheet" />
		<script src="../../Includes/General.js"></script>
		<script src="../../Includes/Scripts/KeySorting.js"></script>
		<script language="javascript">
		////////////////////////////////////global variable//////////////////////////
		////////////////////////////////////for grid user///////
		    var LastSelectedRowClassgrdUser = "";
		    var LastUserName, LastPassword;	   
		////////////////////////////////////for tree group
		var CurCntUGroup=0
		var oRequst = new ActiveXObject("Microsoft.XMLHTTP")

		var RealPass
		var TempPersonCodeFirst="";var TempPersonCode=""
		var flag=true;
		
		//////////////////////////////////////////////////////////////////////////////
		function SaveItems()
		{
					Form1.txtPersonIdTemp.value=Form1.txtPersonId.value
					Form1.txtcmbPersonTemp.value=Form1.txtSearchPersonName.value					
					Form1.txtUserNameTemp.value=Form1.UserName.value
					Form1.txtUserIDTemp.value=Form1.UserID.value 
					//Form1.txtSexTemp.value=Form1.Sex.value 
					//Form1.txtDepartmentIDTemp.value=Form1.DepartmentID.value 
					//Form1.txtRoleTemp.value=Form1.Role.value
					Form1.txtPasswordTemp.value=Trim(Form1.Password.value);					
		}
		
		//////////////////////////////////////////////////////////////////////////////
		function onClickImgRefresh()
		{		
				if(Form1.txtPersonId.value!=TempPersonCode)
				{
						var pid=Form1.txtPersonId.value==""?"0":Form1.txtPersonId.value;		     
						if(Form1.txtPersonId.value!="")
						{		TempPersonCode=Form1.txtPersonId.value;	
								oRequst.open("post","user.aspx?AjaxSend=Ajax &PersonID="+Form1.txtPersonId.value,true)
												
								oRequst.onreadyStateChange=AjaxFunction				
								oRequst.send(null)
								
								var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
								xmlDoc.async="false" ;
								xmlDoc.loadXML(Form1.XMLAllUser.value);						
								var xmls1;						
								xmls1=xmlDoc.documentElement.selectNodes("/UserEntity/GridUser[PersonId="+pid+"]");											
								if(xmls1.length!=0)
								{
								Form1.UserID.value =xmls1.item(0).selectSingleNode("UserId").text
														
								//Form1.DepartmentID.value =xmls1.item(0).selectSingleNode("DepartmentId").text 
								//Form1.Role.value =xmls1.item(0).selectSingleNode("RoleId").text 
								//Form1.Sex.value =xmls1.item(0).selectSingleNode("Sex").text
												
								Form1.UserName.value=xmls1.item(0).selectSingleNode("UserName").text 
												
								Form1.Password.value=xmls1.item(0).selectSingleNode("PassWord").text 				
								Form1.confpass.value=xmls1.item(0).selectSingleNode("PassWord").text 					
								RealPass=Form1.Password.value			    
								LoadDataTreeRole(pid,'U')				
								
								LoadDataTreeGroup(pid,'U')
								
								ChangeColorcmbSubSys(pid,'U')			
						
								}
								else
								{
								Form1.txtSearchPersonName.value=""
								//Form1.DepartmentID.value="0";
								//Form1.Role.value="0";
								//Form1.Sex.value="0";
								Form1.UserName.value="";
								Form1.Password.value="";
								Form1.confpass.value="";
								RealPass=Form1.Password.value;			 
								}
					
								
							}
							else 
								{TempPersonCode="";
								Form1.txtSearchPersonName.value=""
								//Form1.DepartmentID.value="0";
								//Form1.Role.value="0";
								//Form1.Sex.value="0";
								Form1.UserName.value="";
								Form1.Password.value="";
								Form1.confpass.value="";
								RealPass=Form1.Password.value;	
								}
								
			}
						
		}
		//////////////////////////////////////////////////////////////////////////////
		function AjaxFunction(){		       
				if (oRequst.readyState==4)
				{	
					if(oRequst.status==200)															
					   Form1.txtSearchPersonName.value=oRequst.responseText
					if(Form1.txtSearchPersonName.value=="")
						{	
						alert("شماره پرسنلي نامعتبر است.")
						flag=false;							
						}	
					else 
						flag=true;
				}
							
					
													
		}
		//////////////////////////////////////////////////////////////////////////////	
		function AjaxFunc()
		{
		if (oRequst.readyState==4)	
					if(oRequst.status==200)					
					Form1.txtPname.value=oRequst.responseText	
		
		}
		
		//////////////////////////////////////////////////////////////////////////////	
		function onclickBtnLimitSubSys()
		{
		  SaveItems();
		  Form1.txtSubmit.value="BtnLimitSubSys";
		  Form1.Active.value="OnChangeSubSysId";
		  Form1.submit();		  
		}	
		//////////////////////////////////////////////////////////////////////////////
		function onclickBtnShowSubSys()
		{
		 SaveItems();
		 Form1.txtSubmit.value="BtnShowSubSys";
		 Form1.Active.value="OnChangeSubSysId";
		 Form1.submit();
		}	
		//////////////////////////////////////////////////////////////////////////////
		function ChangeColorcmbSubSys(MemberId,Type)
		{
		
		if(MemberId!=" ")
		{
			var tSubSysId=Form1.selSubSys.value
			var ttSubSysId=tSubSysId
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLMemberAccess.value);
					
			var xml1;
			var x;
			//alert("/UserEntity/MemberAccess[MemberId=" + MemberId+ " and Type='" + Type + "' and AccessId>=10000]")
			//and AccessId/10000=0k
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
				if(Form1.selSubSys.value!="")
					{					
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
			}
			
			Form1.selSubSys.value=tSubSysId
			}
		}
		
				
		//////////////////////////////////////////////////////////////////////////////
		function onLoad()
		{	
			document.all("Body").scroll="no"
			//alert(	"UserFrame.aspx&SessionID="+Form1.txtSessionID.value)	
//			alert(Form1.txtSessionID.value)
			window.frames("MainFrame").src = "UserFrame.aspx?SessionID=" + Form1.txtSessionID.value;
//			alert(Form1.txtSessionID.value)
//			alert(window.frames("MainFrame").src)
			
			switch (Form1.Active.value)
			{
				case "":
					ViewGrid()
					break;
				case "Grid":
					ViewGrid()
					break;
				case "Edit":
					ViewEdit()
					break;
				case "OnChangeSubSysId":	
										 							
					LoadDataUser();	
					ViewEdit();
					break
			}
			
			switch (Form1.ActiveTabLeft.value)
			{
				case "TreeGroup":
					onclickTdTreeGroup()
					break;
				case "TreeRole":
					onclickTdTreeRole()
					break;
			}
			//////////////////should edit
			
			if (Form1.ModeDelete.value=="DeleteUser")
			{
				Form1.ModeDelete.value=""
				ViewGrid()
				Form1.PersonIdGrd.value=""
				Form1.txtPname.value="";
				alert('کاربر جاري حذف شد')
				Form1.ModeDelete.value=""
				return
			}
			if (Form1.ModeSave.value=="SaveUser")
			{ 
				Form1.ModeSave.value=""			
				LoadDataUser()
//				alert(Form1.txtAlert.value)
				Form1.ModeSave.value=""
				return
			}					
		}
		/////////////////////////////////////////page/////////////////////////////
		function ViewGrid() 
		{		    	
			document.all.item("TopRow").style.display="inline"  	
			document.all.item("DownRow").style.display="none"
			Form1.Active.value="Grid"			
		}
		/////////////////////////////////////////
		function ViewEdit() 
		{
			document.all.item("TopRow").style.display="none" 						 	
			document.all.item("DownRow").style.display="inline"						
			Form1.Active.value="Edit"
			//Form1.txtPersonId.select();
			//Form1.txtPersonId.focus();
		}
		//////////////////////////////////////////Tab Left///////////////////////////////
		function onclickTdTreeRole()
		{
			/*document.all("TdTreeRole").className="VertGradient1"
			document.all("TdTreeGroup").className="VertGradientBlue1"
			
			document.all("RowRole").style.display="inline"
			document.all("RowGroup").style.display="none"
			Form1.ActiveTabLeft.value="TreeRole"*/
		}
		/////////////////////////////////////////
		function onclickTdTreeGroup()
		{
			/*document.all("TdTreeRole").className="VertGradientBlue1"
			document.all("TdTreeGroup").className="VertGradient1"
			
			document.all("RowRole").style.display="none"
			document.all("RowGroup").style.display="inline"*/
			
		}
		
		///////////////////////////////////////Load Data //////////////////////////////////
		function SetSelectedRowgrdUser()
		{
			obj=grdUser
			if(Form1.LastSelectedRowgrdUser.value!='')
				obj.rows(parseInt(Form1.LastSelectedRowgrdUser.value)).style.backgroundColor='#FFD599'
		}
		//////////////////////////////////////
		function LoadDataUser()
		{	Form1.txtPersonId.value=Form1.txtPersonIdTemp.value;
			Form1.PersonId.value = Form1.txtPersonIdTemp.value;
			Form1.txtSearchPersonName.value=Form1.txtcmbPersonTemp.value;			
			Form1.UserName.value=Form1.txtUserNameTemp.value;
			Form1.UserID.value = Form1.txtUserIDTemp.value;
            //Form1.Sex.value =Form1.txtSexTemp.value;
            //Form1.DepartmentID.value =Form1.txtDepartmentIDTemp.value;
            //Form1.Role.value = Form1.txtRoleTemp.value;
            Form1.Password.value=Form1.txtPasswordTemp.value;
            Form1.confpass.value=Form1.txtPasswordTemp.value;              
            RealPass=Form1.Password.value
            Form1.txtSearchPersonName.disabled = true
            //document.all.item("btnSearchPerson").disabled=true
          
            
            //Form1.ImgRefresh.disabled = true
            //Form1.Sex.disabled = true
            //Form1.DepartmentID.disabled = true
            //Form1.Role.disabled = true
            Form1.txtPersonId.disabled=true
           if(Form1.PersonId.value!="")
           {
            LoadDataTreeGroup(Form1.PersonId.value,'U')
           
            LoadDataTreeRole(Form1.PersonId.value,'U')
            }	
			  Form1.btnSearchPerson.disabled=true;	 
		}
		//////////////////////////////////////
		function LoadDataTreeGroup(MemberId,Type)
		{
		if(MemberId!=" ")
		{
			//Deine xml variable
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLGroupMember.value);
						
			var xml1;
			var x1;
			
			var oGrid;
			var j;
			
			//define tree2 variable
			var objCollection=document.all("TreeGroup")(1).all	
			var t;
			var GrpParent
			
			//if (Type=='R')
			//	GrpParent="10000"
			//else
				GrpParent="20000"
			
			//all false
			ClearCheckTreeGroup(objCollection,Type)
								
			//check child
			xml1=xmlDoc.documentElement.selectNodes("/UserEntity/GroupMember[MemberId="+MemberId+" ]");
			
			for(t=0;t<objCollection.length-1;++t)
				if (objCollection.item(t).tagName=="INPUT")
					for(x1=0;x1<xml1.length;++x1)
						if (objCollection.item(t).GrpId==xml1.item(x1).childNodes(0).text )
							{
								objCollection.item(t).checked=true
								CurCntUGroup +=1
								break;
							}
			
			//check and modify color parent	
			for(t=0;t<objCollection.length-1;++t)
				if (objCollection.item(t).tagName=="INPUT")
					if (objCollection.item(t).GrpId==GrpParent)
						{
							objCollection.item(t).checked=true
							if (CurCntUGroup>=Form1.CntUGroup.value)
								objCollection.item(t).style.backgroundColor=''
							else
							{
								if (CurCntUGroup==0)
								{
									objCollection.item(t).style.backgroundColor=''
									objCollection.item(t).checked=false
								}
								else
									objCollection.item(t).style.backgroundColor='#dcdcdc'
									
							}
							break;
							
						}
			}
		}
		//////////////////////////////////////
		function LoadDataTreeRole(MemberId,Type)
		{
		
		if(MemberId!=" ")
		{
			//all false
			ClearXMLTreeRole(document.all("Tree2")(1).all	)
			
			//Deine xml variable
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLMemberAccess.value);
				
			
			var x1;
		
			var xmlDocs = new ActiveXObject("Microsoft.XMLDOM");
			xmlDocs.async="false" ;
			xmlDocs.loadXML(Form1.XMLRole.value);
			//alert(Form1.XMLRole.value)
			
			var xmls1;
			
			//define tree2 variable
			var objCollection=document.all("Tree2")(1).all				
			var t;
			var xml1 = xmlDoc.documentElement.selectNodes("/UserEntity/MemberAccess[MemberId=" + MemberId + " and Type='" + Type + "']");			
			
			var c
			c=0
			
			  ChangeColorcmbSubSys(Form1.txtPersonId.value,'U')
			 
				for(t=0;t<objCollection.length;++t)
				{
					if (objCollection.item(t).tagName=="INPUT")
					{	
						objCollection.item(t).checked=false
						objCollection.item(t).style.backgroundColor=''
						
						for(x1=0;x1<xml1.length;++x1) {

						    if (objCollection.item(t).accID == xml1.item(x1).childNodes(0).text) {
						       						
							    xmls1 = xmlDocs.documentElement.selectNodes("/UserEntity/RoleBranch[SelfId=" + xml1.item(x1).childNodes(0).text + " and Type='S']");
							    if (xmls1.length > 0) {
								    xmls1.item(0).childNodes(3).text = xml1.item(x1).childNodes(3).text
								    xmls1.item(0).childNodes(5).text = xml1.item(x1).childNodes(4).text

								    switch (xml1.item(x1).childNodes(3).text) {
								        case "1":
								            objCollection.item(t).checked = true
								            objCollection.item(t).style.backgroundColor = '#dcdcdc'
								            break;
								        case "2":
								            objCollection.item(t).checked = true
								            objCollection.item(t).style.backgroundColor = ''
								            break;
								        default:
								            objCollection.item(t).checked = false
								            objCollection.item(t).style.backgroundColor = ''
								            xmls1.item(0).childNodes(3).text = 0
								            xmls1.item(0).childNodes(5).text = 0
								    }
								}
								else {
								    objCollection.item(t).checked = false
								    objCollection.item(t).style.backgroundColor = ''
								}
								break;
							}
						}
					}
				}
			Form1.XMLRole.value=xmlDocs.xml
			}
			
		}
		///////////////////////////////////////////mode click tree Group///////////////////////////////////
		function ManageCheckGroup(Chk)
		{
			//define tree2 variable
			var objCollection=document.all("TreeGroup")(1).all	
			var t;
			
			var GrpParent
			GrpParent="20000"
			
			if (Chk.GrpId==GrpParent)
			{
				for(t=objCollection.length-1;t>0;--t)
					if (objCollection.item(t).tagName=="INPUT")
					{
						if (objCollection.item(t).TypeGroup==Chk.TypeGroup)
						{
							objCollection.item(t).checked=Chk.checked
							objCollection.item(t).style.backgroundColor=''
						}
					}
					CurCntUGroup=Form1.CntUGroup.value
			}
			else
			{
				if (Chk.checked==true)
					CurCntUGroup +=1
				else
					CurCntUGroup -=1

				for(t=objCollection.length-1;t>0;--t)
					if (objCollection.item(t).tagName=="INPUT")
						if (objCollection.item(t).GrpId==GrpParent)
						{
							objCollection.item(t).checked=true
							if (CurCntUGroup>=Form1.CntUGroup.value)
								objCollection.item(t).style.backgroundColor=''
							else
							{
								if (CurCntUGroup==0)
								{
									objCollection.item(t).style.backgroundColor=''
									objCollection.item(t).checked=false
								}
								else
									objCollection.item(t).style.backgroundColor='#dcdcdc'
							}
							
						}
			}
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
			
			//define tree2 variable
			var objCollection=document.all("Tree2")(1).all	
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
					
			//define tree2 variable
			var objCollection=document.all("Tree2")(1).all	
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
						    xmls1 = xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[SelfId=" + xml1.item(x1).childNodes(1).text + " and Type='S']");
						    if (xmls1.length > 0) {
						        xmls1.item(0).childNodes(5).text = parseInt(xmls1.item(0).childNodes(4).text) + 1
						        xmls1.item(0).childNodes(3).text = 2
						    }
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
					
			//define tree2 variable
			var objCollection=document.all("Tree2")(1).all	
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
							xmls1 = xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[SelfId=" + xml1.item(x1).childNodes(1).text + " and Type='S']");
							if (xmls1.length > 0) {
							    xmls1.item(0).childNodes(5).text = 0
							    xmls1.item(0).childNodes(3).text = 0
							}
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
			
			//define tree2 variable
			var objCollection=document.all("Tree2")(1).all	
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
					if(xmls1!=null)
					{
						
						if (xmls1.childNodes(5).text!=0)
							cnt=cnt+parseInt(xmls1.childNodes(5).text)							
						
						if (cnt==xmls1.childNodes(4).text && xmls1.childNodes(5).text!=0)
						{
							cnt=cnt+1
						}
					}
				}
				
				xmls2=xmlDoc.documentElement.selectSingleNode("/UserEntity/RoleBranch[SelfId="+xml1.item(x1).childNodes(1).text+" and Type='S']");
				if(xmls2!=null)
				{
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
							ManageColorParent(xmls2.childNodes(1).text,0)
							xmls2.childNodes(3).text=0
						}
				}
				cnt=0
								
			}
			
			Form1.XMLRole.value=xmlDoc.xml	
		}
		////////////////////////////////////////////
		
		function onclickbtnSearchPerson(flag){
				var url="../../../TA/TAPeresentation/Pages/Person/PersonTab.aspx?flag="+"Report"+"&TypeAccess="+1+"&MenuItemID="+6+'&SessionID='+Form1.txtSessionID.value 
				var StrReturn="";
				StrReturn=window.showModalDialog(url,"","dialogWidth:800px;dialogHeight:750px;center: Yes;help: no;status:no")
			  
				if (StrReturn!=""){
				document.all.item("txtXMLPersonTab").value=StrReturn;	
				var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
				xmlDoc.loadXML(Form1.txtXMLPersonTab.value)
					
				xmlDoc.setProperty("SelectionLanguage", "XPath");
				var xmlNodes=xmlDoc.documentElement.selectNodes("/UserEntity/Person");
				if(flag)
				{
					
					var PId=xmlNodes.item(0).selectSingleNode('PersonID').text
					Form1.PersonIdGrd.value=PId	
					TempPersonCodeFirst=Form1.PersonIdGrd.value;			
					Form1.txtPname.value=xmlNodes.item(0).selectSingleNode('Family').text						
				}
				else
				{
						var PId=xmlNodes.item(0).selectSingleNode('PersonID').text
						Form1.txtPersonId.value=PId
						Form1.txtSearchPersonName.value=xmlNodes.item(0).selectSingleNode('Family').text									
					   	
						//Form1.DepartmentID.disabled=true
						//Form1.Role.disabled=true
						//Form1.Sex.disabled=true
						
						//Deine xml variable
						var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
						xmlDoc.async="false" ;
						xmlDoc.loadXML(Form1.XMLAllUser.value);
						
						var xmls1;
						
						xmls1=xmlDoc.documentElement.selectNodes("/UserEntity/GridUser[PersonId="+PId+"]");											
					
						Form1.UserID.value =xmls1.item(0).selectSingleNode("UserId").text
												
						//Form1.DepartmentID.value =xmls1.item(0).selectSingleNode("DepartmentId").text 
						//Form1.Role.value =xmls1.item(0).selectSingleNode("RoleId").text 
						//Form1.Sex.value =xmls1.item(0).selectSingleNode("Sex").text
										
						Form1.UserName.value=xmls1.item(0).selectSingleNode("UserName").text 
										
						Form1.Password.value=xmls1.item(0).selectSingleNode("PassWord").text 				
						Form1.confpass.value=xmls1.item(0).selectSingleNode("PassWord").text 					
						RealPass=Form1.Password.value
						LastPassword = Form1.Password.value;
						LastUserName = Form1.UserName.value;
						
				var pid=Form1.txtPersonId.value
			    
				LoadDataTreeRole(pid,'U')				
				
				LoadDataTreeGroup(pid,'U')
				
				ChangeColorcmbSubSys(pid,'U')
					}
				}
					
			}
	//============================================================================	
		function ManageColorParent(RoleId,flag)
		{
			//define tree2 variable
			var objCollection=document.all("Tree2")(1).all	
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
			SaveItems();
			if(!flag) alert("شماره پرسنلي نا معتبر است.")
			else
			{
				if (Form1.txtUserNameTemp.value=="" || Form1.txtPersonIdTemp.value=="" )
					alert("لطفا اطلاعات را تکميل نماييد.")
				else
				{
					if (Form1.txtPasswordTemp.value!=Form1.confpass.value || Form1.txtPasswordTemp.value=="")
					    alert("کلمه عبور صحيح نميباشد.")
					else if (Form1.txtPasswordTemp.value.length < 6)
					    alert("طول کلمه عبور نباید کمتر از ۶ حرف باشد!");
					else {
					    if (LastPassword == Form1.txtPasswordTemp.value && LastUserName == Form1.txtUserNameTemp.value)
					        Form1.XMLUser.value = "";
					    else
					        MakeXMLUser()

					    MakeXMLMemberGroup('U')
					    MakeXMLAccessRole()
					    Form1.ModeDelete.value = ""
					    Form1.ModeSave.value = "SaveUser"

					    Form1.submit()

					}
				}
			}
		}
		/////////////////////////////////////
		function MakeXMLUser()
		{
		if(Form1.txtSearchPersonName.value!="")
		{
			//Deine xml variable
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLAllUser.value);
						
			var xmls1;
			
			var strXMLUser=""
			//update XMLAllUser
			xmls1=xmlDoc.documentElement.selectNodes("/UserEntity/GridUser[PersonId="+Form1.txtPersonId.value+"]");
			if (xmls1.length > 0) {
			    xmls1.item(0).childNodes(6).text = Form1.UserName.value
			    xmls1.item(0).childNodes(7).text = Form1.Password.value
			}			
			Form1.XMLAllUser.value=xmlDoc.xml
			
			//Create XMLUser
			
			strXMLUser +="<User>";
			strXMLUser +="<UserID>"+Form1.txtUserIDTemp.value+"</UserID>";
			strXMLUser +="<PersonId>"+Form1.txtPersonIdTemp.value+ "</PersonId>";
			strXMLUser +="<UserName>"+Form1.txtUserNameTemp.value+ "</UserName>";
			strXMLUser +="<PassWord>"+Form1.txtPasswordTemp.value+ "</PassWord>";
			if(RealPass!=Form1.Password.value)
				strXMLUser +="<validPass>"+1+ "</validPass>";
			else strXMLUser +="<validPass>"+0+ "</validPass>";	
			strXMLUser +="</User>";
			
			Form1.XMLUser.value = "<UserEntity>" +strXMLUser+ "</UserEntity>"
			
			
			}
		}
		/////////////////////////////////////
		function MakeXMLMemberGroup(Type)
		{
			var strXMLMemberGroup=""
					
			//define tree2 variable
			var objCollection=document.all("TreeGroup")(1).all	
			
			var t;
			
			var GrpParent
			GrpParent="20000"
			
			for(t=objCollection.length-1;t>0;--t)
				if (objCollection.item(t).tagName=="INPUT")
					if (objCollection.item(t).checked==true & objCollection.item(t).GrpId!=GrpParent)
					{
						strXMLMemberGroup +="<MemberGroup>"
						strXMLMemberGroup +="<GroupId>"+objCollection.item(t).GrpId+ "</GroupId>";
						strXMLMemberGroup +="</MemberGroup>"; 
					}
			if (strXMLMemberGroup!="")
				Form1.XMLGroupMember.value = "<UserEntity>" +strXMLMemberGroup+ "</UserEntity>"
			else
				Form1.XMLGroupMember.value=""
		}
		
		/////////////////////////////////////
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
			if (strXMLAccessRole != "")
			    Form1.XMLAccessRole.value = "<UserEntity>" + strXMLAccessRole + "</UserEntity>";
			else
			    Form1.XMLAccessRole.value = "<UserEntity></UserEntity>";
		}
		////////////////////////////////////////////mode click buttons///////////////////////
		function onClickImgRefreshFirst()		
		{	
		  if(TempPersonCodeFirst!=Form1.PersonIdGrd.value)
				{
						
		    		var pid=Form1.PersonIdGrd.value==""?"0":Form1.PersonIdGrd.value;		     
					if(pid!="0")
					{				 
					oRequst.open("post","user.aspx?AjaxSend=Ajax &PersonID="+pid,true)
									
					oRequst.onreadyStateChange=AjaxFunc		
					oRequst.send(null)	
					}
					else {
					TempPersonCodeFirst="";
					Form1.txtPname.value="";
					}
					
					TempPersonCodeFirst=Form1.PersonIdGrd.value;
				}		
			
		}
		/////////////////////////////////////////
		
		/////////////////////////////////////////
//		function onclickbtnNew1()
//		{
////			NewUser()
//			ViewEdit()
//		}
//		
		/////////////////////////////////////////
//		function NewUser() {	
//       
//			flag=true;
//			var obj
//			obj=window.frames("MainFrame").document.all.item('grduser')
//			if(window.frames("MainFrame").document.all.item("LastSelectedRowgrdUser").value!='')
//				obj.rows(parseInt(window.frames("MainFrame").document.all.item("LastSelectedRowgrdUser").value)).style.backgroundColor=''
//			//alert(0)	
//			window.frames("MainFrame").document.all.item("LastSelectedRowgrdUser").value=''
//			Form1.txtSearchPersonName.disabled=false
//			//Form1.ImgRefresh.disabled=false
//			Form1.btnSearchPerson.disabled=false
//			Form1.txtPersonId.disabled=false
//			//Form1.DepartmentID.disabled=true
//			//Form1.Role.disabled=true
//			//Form1.Sex.disabled=true			
//			
//			Form1.txtSearchPersonName.value=""
//			Form1.PersonId.value = ""
//			Form1.txtPersonId.value=""
//			Form1.UserID.value = ""
//			
//			//Form1.DepartmentID.value = 0
//			//Form1.Role.value =0
//			//Form1.Sex.value = 0
//			TempPersonCode=""			
//			Form1.UserName.value=""
//			Form1.Password.value=""					
//			Form1.confpass.value=""
//			RealPass=Form1.Password.value
//			ClearCheckTreeGroup(document.all("TreeGroup")(1).all,'U')
//			ClearCheckTreeRole(document.all("Tree2")(1).all	)
//		}
		/////////////////////////////////////////
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
			    xmls1 = xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[SelfId=" + xml1.item(x1).childNodes(0).text + " and Type='S']");
			    if (xmls1.length > 0) {
			        xmls1.item(0).childNodes(3).text = 0
			        xmls1.item(0).childNodes(5).text = 0
			    }
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
						    xmls1 = xmlDoc.documentElement.selectNodes("/UserEntity/RoleBranch[SelfId=" + xml1.item(x1).childNodes(0).text + " and Type='S']");
						    if (xmls1.length > 0) {
						        xmls1.item(0).childNodes(3).text = 0
						        xmls1.item(0).childNodes(5).text = 0
						    }
							objCollection.item(t).checked=false
							objCollection.item(t).style.backgroundColor=''
							break
						}
			Form1.XMLRole.value=xmlDoc.xml
		}
		/////////////////////////////////////////
		function ClearCheckTreeGroup(objCollection,Type)
		{  
		
			CurCntRGroup=0
			CurCntUGroup=0
			
			var t;
			for(t=objCollection.length-1;t>0;--t)
				if (objCollection.item(t).tagName=="INPUT")
				{
					objCollection.item(t).checked=false
					objCollection.item(t).style.backgroundColor=''
				}
			}
		/////////////////////////////////////////
		function onclickbtnEdit1() {
		    LastPassword = "";
		    LastUserName = "";
			if(window.frames("MainFrame").document.all.item("LastSelectedRowgrdUser").value!="")
			{
			ViewEdit()
				var obj
				obj=window.frames("MainFrame").document.all.item('grduser')
				var SelectedRow			
				SelectedRow=obj.rows(parseInt(window.frames("MainFrame").document.all.item("LastSelectedRowgrdUser").value))
				  		Form1.txtPersonIdTemp.value=SelectedRow.cells(0).innerText
						Form1.txtcmbPersonTemp.value=SelectedRow.cells(1).innerText			
						Form1.txtUserNameTemp.value=SelectedRow.cells(2).innerText
						Form1.txtUserIDTemp.value=SelectedRow.UserID
						//Form1.txtSexTemp.value=SelectedRow.Sex
						//Form1.txtDepartmentIDTemp.value=SelectedRow.DepartmentId
						//Form1.txtRoleTemp.value=SelectedRow.RoleId
						Form1.txtPasswordTemp.value=SelectedRow.Password

						LastPassword = SelectedRow.Password;
						LastUserName = SelectedRow.cells(2).innerText;
									
				LoadDataUser()
			}
			else alert("ابتدا يک سطر را انتخاب کنيد.")
		//alert(Form1.btnSearchPerson.disabled)	
		}
		/////////////////////////////////////////
		function onclickbtnDelete1()
		{
			if(window.frames("MainFrame").document.all.item("LastSelectedRowgrdUser").value!="")
			{
				if (confirm("آيا مطمئنيد ؟"))
				{
					Form1.ModeDelete.value="DeleteUser"
					Form1.ModeSave.value=""
					Form1.submit()
				}
			}						
			else
				alert("بايد يک آيتم از گريد انتخاب شود")
		}
		/////////////////////////////////////////
//		function onclickbtnNew()
//		{
//			NewUser()
//		}
		/////////////////////////////////////////
		function onclickbtnCancel()
		{
			ViewGrid()
		}
		
	/**********************************************************************************/
	function onclickbtnShow()
	 {
		
		Form1.txtPname.value="";
		Form1.PersonIdGrd.value="";
		TempPersonCodeFirst="";
		window.frames("MainFrame").document.all.item("PersonIdGrd").value=""
		window.frames("MainFrame").document.all.item("txtSubmit").value="Show"
		window.frames("MainFrame").document.all.item("Form1").submit()
     }
	/**********************************************************************************/
	function btnSearchOnClick(){


	    window.frames("MainFrame").src = "UserFrame.aspx?SessionID=" + Form1.txtSessionID.value;
		window.frames("MainFrame").document.all.item("PersonIdGrd").value=Form1.PersonIdGrd.value;		 
		window.frames("MainFrame").document.all.item("txtSubmit").value="Search"		
		window.frames("MainFrame").document.all.item("Form1").submit()
		 
	}
	/**********************************************************************************/
	function OnBluretxtSearchPersonName()
	{
		if(Form1.txtSearchPersonName.value=="")
		{
					Form1.txtPersonId.value="";
					TempPersonCode=Form1.txtPersonId.value			
					//Form1.DepartmentID.value="0";
					//Form1.Role.value="0";
					//Form1.Sex.value="0";
					Form1.UserName.value="";
					Form1.Password.value="";
					Form1.confpass.value="";
					RealPass=Form1.Password.value;	
		}
	}
	/**********************************************************************************/
	function OnBluretxtPersonName()
	{
		if(Form1.txtPname.value=="")
		{
			Form1.PersonIdGrd.value="";
			TempPersonCodeFirst=Form1.PersonIdGrd.value
		}
	}
	/**********************************************************************************/
	 function Trim(str){
			if(str.length>0)
			{
				j=str.length-1 
				while(str.substr(j,1)==" "){
					str=str.substr(0,str.length-1)
					j=str.length-1}
				j=0
				while(str.substr(j,1)==" "){
					str=str.substr(1,str.length)
					l=str.length}
				
			}
			return str
}
		</script>
	</HEAD>
	<body id="Body" dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="yes" onload="onLoad()"
		rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="center" border="0">
				<TBODY>
					<tr>
						<td  vAlign="middle" align="center">
							<table class="CssLayer2" id="Layer2" height="100%" cellSpacing="0" cellPadding="0" width="100%"
								border="0">
								<tr>
									<td vAlign="middle" align="center">
										<TABLE class="CssPage" id="Page" style="WIDTH: 822px; HEIGHT: 538px" cellSpacing="1"
											cellPadding="1" width="822" border="0">
											<TR>
												<TD id="TopRow" style="DISPLAY: inline; HEIGHT: 526px" vAlign="top" align="center">
													<TABLE id="Table16" style="WIDTH: 825px; HEIGHT: 474px" height="474" cellSpacing="1" cellPadding="1"
														width="825" align="right" border="0">
														<TR>
															<TD style="DISPLAY: inline; HEIGHT: 37px" vAlign="top" align="left">
																<TABLE id="Table19" style="WIDTH: 761px; HEIGHT: 40px" cellSpacing="1" cellPadding="1"
																	width="761" align="right" border="0">
																	<TR>
																		<TD style="WIDTH: 616px" vAlign="middle">
																			<TABLE id="Table20" style="WIDTH: 522px; HEIGHT: 5px" cellSpacing="1" cellPadding="1" width="522"
																				align="right" border="0">
																				<TR>
																					<TD style="WIDTH: 58px">کد پرسنلي</TD>
																					<TD style="WIDTH: 181px"><INPUT class="TxtControls" onblur="onClickImgRefreshFirst()" id="PersonIdGrd" style="WIDTH: 100px; HEIGHT: 20px"
																							size="13" name="PersonIdTree" runat="server"></TD>
																					<TD style="WIDTH: 94px">نام خانوادگي و نام</TD>
																					<TD align="left"><asp:textbox id="txtPname" runat="server" Width="145px" onblur="OnBluretxtPersonName()" CssClass="txtControls"></asp:textbox>&nbsp;&nbsp;<INPUT class="HeaderStyle" id="BtnSearchPersonNameFirst" style="WIDTH: 22px; HEIGHT: 22px; CURSOR: hand"
																							onclick="onclickbtnSearchPerson(true)" type="button" value="..." name="BtnSearchPersonNameFirst"></TD>
																				</TR>
																			</TABLE>
																		</TD>
																		<TD vAlign="middle" align="right">&nbsp;<INPUT class="CssBtnLimitSerach" id="btnSearch" dir="rtl" style="WIDTH: 99px; HEIGHT: 32px;cursor:hand;"
																				onclick="btnSearchOnClick()" type="button" name="btnSearch" runat="server">&nbsp;&nbsp;<INPUT class="CssBtnShow" id="btnShow" dir="rtl" style="WIDTH: 70px; HEIGHT: 32px;cursor:hand;" onclick="onclickbtnShow()"
																				type="button" name="btnSearch"></TD>
																	</TR>
																</TABLE>
															</TD>
														</TR>
														<TR>
															<TD id="RowGridUser" style="DISPLAY: inline; HEIGHT: 370px" vAlign="top" align="center"
																CssClass="CssBackColor"><IFRAME id="MainFrame" dir="rtl" style="WIDTH: 820px; HEIGHT: 360px" name="LFrame" align="middle"
																	src="UserFrame.aspx?SessionID=<%=request("SessionID")%>" frameBorder="0" scrolling="no"></IFRAME>
															</TD>
														</TR>
														<TR>
															<TD style="DISPLAY: inline" vAlign="top" align="center">
																<HR class="CssHorizontalLine" style="WIDTH: 629px; HEIGHT: 2px" SIZE="2">
																<TABLE id="Table17" style="WIDTH: 172px; HEIGHT: 36px" cellSpacing="1" cellPadding="1"
																	width="172" border="0">
																	<TR>
																		<%--<TD><INPUT class="CssBtnNew" id="btnNew1" onclick="onclickbtnNew1()" type="button" name="btnNew1" style="cursor:hand;"></TD>--%>
																		<TD><INPUT class="CssBtnEdit" id="btnEdit1" onclick="onclickbtnEdit1()" type="button" name="btnEdit1" style="cursor:hand;"></TD>
																		<TD><INPUT class="CssBtnDelete" id="btnDelete1" onclick="onclickbtnDelete1()" type="button" style="cursor:hand;"
																				name="btnDelete1"></TD>
																	</TR>
																</TABLE>
															</TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
											<TR>
												<TD id="DownRow" style="DISPLAY: inline" align="right">
													<table >
														<tr>
															<td >
																<table style="BORDER-BOTTOM: lightblue thin solid; BORDER-LEFT: lightblue thin outset;  BORDER-TOP: lightblue thin solid; BORDER-RIGHT: lightblue thin inset ;Display=none">
																	<tr>
																		<TD style="WIDTH: 61px; HEIGHT: 23px; Display=none">کد پرسنلي</TD>
																		<TD style="WIDTH: 150px; HEIGHT: 23px; Display=none">
																			<P align="right"><asp:textbox id="txtPersonId" runat="server" onblur="onClickImgRefresh()" Width="100px" TabIndex="1"
																					CssClass="TxtControls" name="UserName"></asp:textbox></P>
																		</TD>
																		<TD style="WIDTH: 89px; HEIGHT: 23px;Display=none"><asp:label id="lblSelectList" runat="server" style="Display=none">نام و نام خانوادگي</asp:label></TD>
																		<TD style="WIDTH: 181px; HEIGHT: 23px; Display=none"><asp:textbox TabIndex="2" id="txtSearchPersonName" runat="server" Width="130px" onblur="OnBluretxtSearchPersonName()"
																				CssClass="txtControls"></asp:textbox>&nbsp; <INPUT class="HeaderStyle" id="btnSearchPerson" style="WIDTH: 22px; HEIGHT: 22px; CURSOR: hand"
																				onclick="onclickbtnSearchPerson(false)" type="button" value="..." name="btnSearchPerson"></TD>
																		<!--<td style="WIDTH: 77px; HEIGHT: 31px">جنسيت</td>-->
																		<TD style="WIDTH: 75px; HEIGHT: 23px"><asp:textbox TabIndex="3" id="PersonId" style="DISPLAY: none" runat="server" Width="1px" name="PersonId"></asp:textbox><!--<cc1:lcombo id="Sex" runat="server" Width="160px" CssClass="TxtControls" LookupName="sex"></cc1:lcombo>--></TD>
																		<td style="HEIGHT: 23px"></td>
																	</tr>
																	<TR>
																		<TD style="WIDTH: 61px; HEIGHT: 31px ;Display=none">نام کاربري</TD>
																		<TD style="WIDTH: 150px; HEIGHT: 31px ;Display=none">
																			<P align="right"><asp:textbox id="UserName" TabIndex="4" runat="server" Width="147px" CssClass="TxtControls" name="UserName"></asp:textbox></P>
																		</TD>
																		<TD style="WIDTH: 89px; HEIGHT: 31px ;Display=none">كلمه عبور
																		</TD>
																		<TD style="WIDTH: 181px; HEIGHT: 31px ;Display=none"><asp:textbox id="Password" TabIndex="5" runat="server" Width="175px" CssClass="TxtControls" EnableViewState="False"
																				TextMode="Password"></asp:textbox></TD>
																		<TD style="WIDTH: 75px; HEIGHT: 31px ;Display=none"  >تكرار كلمه عبور</TD>
																		<TD style="HEIGHT: 31px ;Display=none"><asp:textbox id="confpass" TabIndex="6" runat="server" Width="160px" CssClass="TxtControls" TextMode="Password"></asp:textbox></TD>
																	</TR>
																	<!--<TR>
																		<TD style="WIDTH: 85px">واحد سازماني
																		</TD>
																		<TD style="WIDTH: 179px">
																			<P align="right"><cc1:lcombo id="DepartmentID" runat="server" Width="175px" TabIndex="7" CssClass="TxtControls"
																					LookupName="Department" ForeColor="Red" ConnectionName="GenCnn"></cc1:lcombo></P>
																		</TD>
																		<TD style="WIDTH: 105px">پست سازماني</TD>
																		<TD style="WIDTH: 181px"><cc1:lcombo id="Role" TabIndex="8" runat="server" Width="175px" CssClass="TxtControls" LookupName="Role"
																				ForeColor="Red" ConnectionName="GenCnn"></cc1:lcombo></TD>
																		<TD style="WIDTH: 77px">&nbsp;</TD>
																		<TD></TD>
																	</TR>-->
																</table>
															</td>
														</tr>
														<TR>
															<TD>
																<TABLE id="Table18" style="WIDTH: 848px; HEIGHT: 516px" cellSpacing="1" cellPadding="1"
																	align="center" border="0">
																	<TBODY class="label">
																		<TR>
																			<TD class="Label" style="WIDTH: 162px; HEIGHT: 439px" vAlign="top" align="center" width="162">
																				<TABLE id="Table6" style="BORDER-BOTTOM: lightblue thin solid; BORDER-LEFT: lightblue thin outset; WIDTH: 410px; HEIGHT: 436px; BORDER-TOP: lightblue thin solid; BORDER-RIGHT: lightblue thin inset"
																					height="436" cellSpacing="0" cellPadding="0" width="410" align="right">
																					<TR>
																						<TD vAlign="top" colSpan="2">
																							<TABLE id="Table3" style="HEIGHT: 36px" cellSpacing="1" cellPadding="1" width="100%" align="right"
																								border="0">
																								<TR>
																									<TD style="WIDTH: 68px" vAlign="middle">نام سيستم
																									</TD>
																									<TD vAlign="middle"><cc1:lcombo id="selSubSys" TabIndex="9" runat="server" Width="156px" CssClass="TxtControls"
																											LookupName="SubSys"></cc1:lcombo></TD>
																									<TD vAlign="top"><INPUT class="CssBtnLimitSerach" id="BtnLimitSubSys" dir="rtl" title="نمايش محدود" style="WIDTH: 99px; HEIGHT: 32px;cursor:hand;"
																											onclick="onclickBtnLimitSubSys()" type="button" name="BtnLimitSubSys"></TD>
																									<TD vAlign="top"><INPUT class="CssBtnShow" id="BtnShowSubSys" dir="rtl" title="نمايش" style="WIDTH: 67px; HEIGHT: 32px;cursor:hand;display:none"
																											onclick="onclickBtnShowSubSys()" type="button" name="BtnShowSubSys"></TD>
																								</TR>
																							</TABLE>
																						</TD>
																					</TR>
																					<TR>
																						<TD id="Td3" dir="rtl" vAlign="top" colSpan="2">
																							<DIV id="divTreeRole" style="SCROLLBAR-ARROW-COLOR: black; WIDTH: 405px; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 388px; SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto"
																								align="right" runat="server"><cc1:tree id="Tree2" runat="server" Width="219px"></cc1:tree></DIV>
																						</TD>
																					</TR>
																				</TABLE>
																				<TABLE id="Table1" style="BORDER-BOTTOM: lightblue thin solid; BORDER-LEFT: lightblue thin outset; WIDTH: 414px; HEIGHT: 436px; BORDER-TOP: lightblue thin solid; BORDER-RIGHT: lightblue thin inset"
																					height="436" cellSpacing="0" cellPadding="0">
																					<TR>
																						<TD id="tab2" dir="rtl" style="DISPLAY: inline" vAlign="top" colSpan="2">
																							<DIV id="divTreeGroup" style="WIDTH: 409px; HEIGHT: 404px; OVERFLOW: auto" align="right"
																								runat="server"><cc1:tree id="TreeGroup" runat="server" Width="100%"></cc1:tree></DIV>
																						</TD>
																					</TR>
																				</TABLE>
																			</TD>
																			<TD style="HEIGHT: 439px" vAlign="top" align="right"></TD>
																		</TR>
																		<TR>
																			<TD class="Label" vAlign="top" align="center" width="50%" colSpan="2">
																				<HR class="CssHorizontalLine" style="WIDTH: 100%; HEIGHT: 2px" SIZE="1">
																				<TABLE id="Table5" style="WIDTH: 14px; HEIGHT: 38px" align="center" border="0">
																					<TR>
																						<%--<TD width="33%"><INPUT class="CssbtnNew" id="btnNew" onclick="onclickbtnNew()" type="button" name="btnNew" style="cursor:hand;"></TD>--%>
																						<TD width="33%"><INPUT class="CssbtnSave" id="btnSave" onclick="onclickbtnSave()" type="button" name="btnSave" style="cursor:hand;"></TD>
																						<TD width="33%"><INPUT class="CssbtnCancel" id="btnCancel" onclick="onclickbtnCancel()" type="button" name="btnCancel" style="cursor:hand;"></TD>
																					</TR>
																				</TABLE>
																			</TD>
																		</TR>
																	</TBODY>
																</TABLE>
															</TD>
														</TR>
													</table>
												</TD>
											</TR>
											<TR>
												<TD style="DISPLAY: none" align="right">
													<input type="hidden" id="txtSessionID" runat="server" NAME="txtSessionID">
													<asp:textbox id="UserID" style="DISPLAY: inline" runat="server" Width="1px"></asp:textbox><INPUT id="parent" style="WIDTH: 1px" type="hidden" name="parent">
													<INPUT id="BeforePrevStyle" style="WIDTH: 1px" type="hidden" size="1" name="BeforePrevStyle">
													<INPUT id="PrevrecID" style="WIDTH: 1px" type="hidden" size="1" name="PrevrecID">
													<INPUT id="recID" style="WIDTH: 1px" type="hidden" size="1" name="recID"> <INPUT id="PageName" style="WIDTH: 1px" type="hidden" size="1" value="user" name="PageName">
													<cc1:mysecurity id="onlineuser" runat="server"></cc1:mysecurity><asp:textbox id="XMLRole" style="DISPLAY: inline" runat="server" Width="1px"></asp:textbox><asp:textbox id="XMLAccessRole" style="DISPLAY: inline" runat="server" Width="1px"></asp:textbox><INPUT id="ActiveTabLeft" style="WIDTH: 1px; DISPLAY: inline" type="hidden" name="ActiveTabLeft"
														runat="server"> <INPUT id="Active" style="WIDTH: 1px; DISPLAY: inline" type="hidden" name="Active" runat="server">
													<INPUT id="ModeSave" style="WIDTH: 1px; DISPLAY: inline" type="hidden" name="ModeSave"
														runat="server"> <INPUT id="XMLGroupMember" style="WIDTH: 1px; DISPLAY: inline" type="hidden" name="XMLGroupMember"
														runat="server"> <INPUT id="ModeDelete" style="WIDTH: 1px; DISPLAY: inline" type="hidden" name="ModeDelete"
														runat="server">
													<asp:textbox id="XMLMemberAccess" style="DISPLAY: inline" runat="server" Width="1px"></asp:textbox><INPUT id="XMLUser" style="WIDTH: 1px; DISPLAY: inline" type="hidden" name="XMLUser" runat="server">
													<INPUT id="CntRGroup" style="WIDTH: 1px; DISPLAY: inline" type="hidden" name="CntRGroup"
														runat="server"> <INPUT id="CntUGroup" style="WIDTH: 1px; DISPLAY: inline" type="hidden" name="CntUGroup"
														runat="server"> <INPUT id="XMLAllUser" style="WIDTH: 1px; DISPLAY: inline" type="hidden" name="XMLAllUser"
														runat="server"> <INPUT id="LastSelectedRowgrdUser" style="WIDTH: 1px; DISPLAY: none" type="hidden" name="LastSelectedRowgrdUser"
														runat="server">
                                                         <input id="txtCompanyFinatialPeriodID" style="display: none; width: 1px" type="text"
                                                            name="txtCompanyFinatialPeriodID" runat="server">
													<asp:button id="hBtnSearch" runat="server" Text="Button"></asp:button><asp:button id="hBtnShow" runat="server" Text="Button"></asp:button></TD>
											</TR>
											<tr>
												<td>
													<div style="DISPLAY: none">
														<input id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID" runat="server">
														<input id="txtPersonIdTemp" type="hidden" runat="server" NAME="txtPersonIdTemp"> <input id="txtcmbPersonTemp" type="hidden" name="Text1" runat="server">
														<input id="txtUserNameTemp" type="hidden" name="Text2" runat="server"> <input id="txtUserIDTemp" type="hidden" name="Text3" runat="server">
														<!--<input id="txtSexTemp" type="hidden" name="Text4" runat="server"> <input id="txtDepartmentIDTemp" type="hidden" name="Text4" runat="server">-->
														<!--<input id="txtRoleTemp" type="hidden" name="Text4" runat="server">--> <input id="txtPasswordTemp" type="hidden" name="Text4" runat="server">
														<input id="txtSubmit" type="hidden" name="txtSubmit" runat="server"> <input id="txtXMLPersonTab" type="hidden" name="txtXMLPersonTab" runat="server">&nbsp;
														<input id="txtPersonXml" type="hidden" name="txtPersonXml" runat="server"> <input id="txtAlert" type="hidden" runat="server" NAME="txtAlert">
													</div>
												</td>
											</tr>
										</TABLE>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</TBODY>
			</table>
		</form>
	</body>
</HTML>
