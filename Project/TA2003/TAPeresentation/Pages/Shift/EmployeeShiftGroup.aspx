<%@ Page Language="vb" AutoEventWireup="false" Codebehind="EmployeeShiftGroup.aspx.vb" Inherits="TA.EmployeeShiftGroup"%>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>EmployeeShiftGroup</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../../Includes/Styles/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="../Person/General.js"></script>
		<script language="javascript">
		/****************************************************************/
		var root='/GroupEntity/EmployeeGroup';
		var PersonRoot='/UserEntity/Person'
		var GroupRoot='/BaseInfoEntity/GetGroupPerson'
		var newrowindex=0 //(last row )
		var PageSize  = 10
		var currentPage_X = 0
		var strXPathConditions="";
		/****************************************************************/
		function PageLoad()
		{
			CreateGrid("Next")
		}
		/****************************************************************/
		function onClickChkAllChangeData(obj)
		{
			//alert(Form1.txtXMLMember.value)
			
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.txtXMLMember.value);
			var xmlNodes;
			xmlNodes=xmlDoc.documentElement.selectNodes("/GroupEntity/EmployeeGroup");
			
			if(obj.checked)
				for(var i=0;i<xmlNodes.length;++i)
				{
					xmlNodes.item(i).selectSingleNode('ChangeData').text=1
				}
			else
				for(var i=0;i<xmlNodes.length;++i)
				{
					xmlNodes.item(i).selectSingleNode('ChangeData').text=0
				}
			//Form1.XMLX.value=xmlDoc2.xml
			Form1.txtXMLMember.value=xmlDoc.xml
			CreateGrid('First')
			
		}
		/****************************************************************/
		
		/****************************************************************/
		function CreateGrid(direction)
		{
			//alert(Form1.txtXMLMember.value)
			var oGrid=XTabTable;
			ClearRowGrid(oGrid)
			
			var xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(Form1.txtXMLMember.value);
			xmlDoc.setProperty("SelectionLanguage", "XPath");
			
			var xmlNodes;
			var x;
			
			var xPath=''
			xPath=''
			/*if (Form1.ShowSelectedX.checked)
			{
				xPath=' Selected=1 '
			}*/
			if (xPath!='' || strXPathConditions!='')
			{
				if(xPath!='' && strXPathConditions!='')
					xPath=strXPathConditions+' and '+xPath
				if(xPath=='' && strXPathConditions!='')
					xPath=strXPathConditions
				xmlNodes=xmlDoc.documentElement.selectNodes(root+"["+xPath+"]");
			}
			else
				xmlNodes=xmlDoc.documentElement.selectNodes(root);
			
			//xmlNodes=xmlDoc.documentElement.selectNodes(root);
				
			var totalRecords 
			totalRecords = xmlNodes.length
			//document.all.item('CntX').innerText=totalRecords
			Form1.ToatalPage_X.value =Math.ceil(totalRecords / PageSize)
			if (totalRecords > 0)
			{
				currentPage_X =parseInt(((Form1.CurPage_X.value=="") ? "0" : Form1.CurPage_X.value))
				switch (direction)
				{
					case "Const":
						currentPage_X = currentPage_X
						break
					case "Next":
						currentPage_X = parseInt(currentPage_X)+1
						break
					case "Previous":
						currentPage_X =parseInt(currentPage_X)-1
						break
					case "First":
						currentPage_X = 1
						break
					case "Last":
						currentPage_X = parseInt(Form1.ToatalPage_X.value)
						break
				}
				Form1.CurPage_X.value = currentPage_X
                var endFor 
                if(currentPage_X*PageSize-1 < 0)
                    return
                if(totalRecords <= currentPage_X*PageSize-1)
                    endFor =totalRecords-1
                else
                    endFor = parseInt(Form1.CurPage_X.value)*PageSize-1
              	
              	x=(currentPage_X-1)*PageSize

              var Param
              for(;x<=endFor;++x)
              {
					var Sd=xmlNodes.item(x).selectSingleNode('StartDate').text
					if (Sd.indexOf('/')==4)
					{
						Sd=Sd.slice(8,10)+'/'+Sd.slice(5,7)+'/'+Sd.slice(0,4)
					}
					
					var Ed=xmlNodes.item(x).selectSingleNode('EndDate').text
					if (Ed.indexOf('/')==4)
					{
						Ed=Ed.slice(8,10)+'/'+Ed.slice(5,7)+'/'+Ed.slice(0,4)
					}
					
					AddToGrid(xmlNodes.item(x).selectSingleNode('Selected').text,xmlNodes.item(x).selectSingleNode('PersonID').text,xmlNodes.item(x).selectSingleNode('Name').text,Sd,Ed,xmlNodes.item(x).selectSingleNode('ChangeData').text,xmlNodes.item(x).selectSingleNode('IsGroup').text)
			   }
			}		
		}
		/****************************************************************/
		function ClearRowGrid(oGrid)
		{
			for(var i=oGrid.rows.length-1;i>=0;i--)
			{
				oGrid.deleteRow(i);
			}
		}
		/****************************************************************/
		function AddToGrid(Selected,PersonId,Name,Sd,Ed,ChangeData,IsGroup)
		{
			var oGrid=XTabTable;
			var oRow=oGrid.insertRow();
			if(IsGroup==1)
				oRow.className="CssAlternatingItemStyle";
			else
				oRow.className="CssItemStyle";
			
			oRow.setAttribute("PersonId",PersonId)
			
			var oCell0=oRow.insertCell(); //Selected
			var ch=((Selected==1)? "checked" : "");
			oCell0.innerHTML='<input id="Chk" style="WIDTH: 25px; BACKGROUND-COLOR: transparent" type="checkbox" onclick="ModifyXMLMember('+PersonId+',0,this)" '+ch+'>'
			oCell0.className="XTabTable";
			oCell0.style.width="30px"
			oCell0.align="center"
			
			var oCell1=oRow.insertCell();	//PersonId
			oCell1.innerText=PersonId;
			oCell1.className="XTabTable";
			oCell1.style.width="98px"
			oCell1.align="right"
			
			var oCell2=oRow.insertCell();	//Name
			oCell2.innerText=Name;
			oCell2.className="XTabTable";
			oCell2.style.width="250px"
			oCell2.align="right"
				
			var oCell3=oRow.insertCell();	//StartDate
			oCell3.innerHTML='<input type="text" class="txtControls" style="WIDTH: 135px" value='+((Sd=="//")? "" : Sd)+' onblur="datechk();ModifyXMLMember('+PersonId+',3,this)" onkeydown="OnKeyDownDate(this.value)">';
			oCell3.className="XTabTable";
			oCell3.style.width="145px"
			oCell3.align="center"
			
			var oCell4=oRow.insertCell();	//EndDate
			oCell4.innerHTML='<input type="text" class="txtControls" style="WIDTH: 135px" value='+((Ed=="//")? "" : Ed)+' onblur="datechk();ModifyXMLMember('+PersonId+',4,this)" onkeydown="OnKeyDownDate(this.value)">';
			oCell4.className="XTabTable";
			oCell4.style.width="145px"
			oCell4.align="center"
			
			var oCell5=oRow.insertCell(); //Change Date
			var chD=((ChangeData==1)? "checked" : "");
			oCell5.innerHTML='<input id="ChkChangeate" style="WIDTH: 25px; BACKGROUND-COLOR: transparent" type="checkbox" onclick="ModifyXMLMember('+PersonId+',5,this)" '+chD+'>'
			oCell5.className="XTabTable";
			oCell5.style.width="25px"
			oCell5.align="center"
		}
		/****************************************************************/
		 function CurPage_XTextChanged()
		 {
			if (Form1.CurPage_X.value <= Form1.ToatalPage_X.value && Form1.CurPage_X.value > 0)
				CreateGrid('Const')
		 }
    	/****************************************************************/
		function NextBtn_XClick()
		{
			if(parseInt(Form1.CurPage_X.value) < parseInt(Form1.ToatalPage_X.value))
				CreateGrid('Next')
		}
    	/****************************************************************/
	    function PrevBtn_XClick()
	    {
			if(parseInt(Form1.CurPage_X.value) > 1)
				CreateGrid('Previous')
	    }
    	/****************************************************************/
		function FirstBtn_XClick()
		{
			CreateGrid('First')
		}
    	/****************************************************************/
	    function LastBtn_XClick()
	    {
			CreateGrid('Last')
		}
		/****************************************************************/
		function selectPerson()
		{
			var url="../BaseInfo/ValidGroupPerson.aspx"//?CategoryId="+window.parent.document.all.item('cmbCategory').value;
			var StrReturn="";
			StrReturn=window.showModalDialog(url,"","dialogWidth:550px;dialogHeight:600px;center: Yes;help: no;status:no")
			
			
			if (StrReturn!="")
			{
				document.all.item('XMLPerson').value=StrReturn;
				if(Form1.txtXMLMember.value!="<GroupEntity />")
					var res=window.confirm("Å—”‰· «‰ Œ«» ‘œÂ Ã«Ìê“Ì‰ Å—”‰· ﬁ»·Ì ê—œ‰œø")
				if (res==true)
					MakeXMLGroupMember("Replace")
				else
					MakeXMLGroupMember("Append")	
				//alert(Form1.txtXMLMember.value)
				if (Form1.CurPage_X.value==0)
					CreateGrid('Next')
				else
					CreateGrid('First')	
			}	
		}
		/****************************************************************/
		function MakeXMLGroupMember(TypeIns)
		{	
			if (TypeIns=="Replace")
				document.all.item('txtXMLMember').value = "";
				
			var StrXml="";		
			var oXmlDoc=new ActiveXObject("Microsoft.XMLDOM")
			oXmlDoc.async="false" ;
			oXmlDoc.loadXML(document.all.item('XMLPerson').value)
			var xmlNodes=oXmlDoc.documentElement.selectNodes(GroupRoot + '[Selected=1]')
			
		
			if (xmlNodes.length!=0)
			{
				for(var i=0;i<xmlNodes.length;i++)
				{
					var Flag=true;
					
					if (Form1.txtXMLMember.value!="")
					{
						var oXmlDocMem=new ActiveXObject("Microsoft.XMLDOM")
						oXmlDocMem.async="false" ;
						oXmlDocMem.loadXML(document.all.item('txtXMLMember').value)
						var xmlChilds=oXmlDocMem.documentElement.selectNodes(root+'[PersonID='+xmlNodes.item(i).selectSingleNode("PersonID").text+']')
						if (xmlChilds.length!=0)
							Flag=false
					}
					
					if (Flag==true)
					{
						var Sd=window.parent.Form1.StartDate_txtDay.value+"/"+window.parent.Form1.StartDate_txtMonth.value+"/"+window.parent.Form1.StartDate_txtYear.value;
						var Ed=window.parent.Form1.EndDate_txtDay.value+"/"+window.parent.Form1.EndDate_txtMonth.value+"/"+window.parent.Form1.EndDate_txtYear.value
								
						StrXml+="<EmployeeGroup>"
						StrXml+="<Selected>1</Selected>"
						StrXml+="<PersonID>"+xmlNodes.item(i).selectSingleNode("PersonID").text+"</PersonID>"
						StrXml+="<Name>"+xmlNodes.item(i).selectSingleNode("Name").text+"</Name>"
						StrXml+="<StartDate>"+Sd+"</StartDate>"
						StrXml+="<EndDate>"+Ed+"</EndDate>"
						StrXml+="<IsGroup>1</IsGroup>"
						StrXml+="<ChangeData>0</ChangeData>"
						StrXml+="</EmployeeGroup>"
					}
				}	
				
				if ((Form1.txtXMLMember.value=="") || (Form1.txtXMLMember.value=="<GroupEntity />"))
				{
					StrXml="<GroupEntity>"+StrXml+"</GroupEntity>"
					Form1.txtXMLMember.value=StrXml
				}	
				else
				{
					Form1.txtXMLMember.value=Form1.txtXMLMember.value.replace("</GroupEntity>",StrXml+"</GroupEntity>")
				}
			}
		}
		/****************************************************************/
		function onclickBtnSelectPerson()
		{
			var url="../BaseInfo/Group/SelValidatePerson/ValidatePerson.aspx"//?CategoryId="+window.parent.document.all.item('cmbCategory').value;
			var StrReturn="";
			StrReturn=window.showModalDialog(url,"","dialogWidth:850px;dialogHeight:670px;center: Yes;help: no;status:no")
			
			if (StrReturn!="")
			{
				document.all.item('XMLPerson').value=StrReturn;
				if(Form1.txtXMLMember.value!="<GroupEntity />")
					var res=window.confirm("Å—”‰· «‰ Œ«» ‘œÂ Ã«Ìê“Ì‰ Å—”‰· ﬁ»·Ì ê—œ‰œø")
				if (res==true)
					MakeXMLMember("Replace")
				else
					MakeXMLMember("Append")	
				//alert(Form1.txtXMLMember.value)
				if (Form1.CurPage_X.value==0)
					CreateGrid('Next')
				else
					CreateGrid('First')	
			}	
		}
		/****************************************************************/
		function MakeXMLMember(TypeIns)
		{	
			if (TypeIns=="Replace")
				document.all.item('txtXMLMember').value = "";
				
			var StrXml="";		
			var oXmlDoc=new ActiveXObject("Microsoft.XMLDOM")
			oXmlDoc.async="false" ;
			oXmlDoc.loadXML(document.all.item('XMLPerson').value)
			var xmlNodes=oXmlDoc.documentElement.selectNodes(PersonRoot + '[Selected=1]')
			
			if (xmlNodes.length!=0)
			{
				for(var i=0;i<xmlNodes.length;i++)
				{
					var Flag=true;
					
					if (Form1.txtXMLMember.value!="")
					{
						var oXmlDocMem=new ActiveXObject("Microsoft.XMLDOM")
						oXmlDocMem.async="false" ;
						oXmlDocMem.loadXML(document.all.item('txtXMLMember').value)
						var xmlChilds=oXmlDocMem.documentElement.selectNodes(root+'[PersonID='+xmlNodes.item(i).selectSingleNode("PersonID").text+']')
						if (xmlChilds.length!=0)
							Flag=false
					}
					
					if (Flag==true)
					{
						var Sd=window.parent.Form1.StartDate_txtDay.value+"/"+window.parent.Form1.StartDate_txtMonth.value+"/"+window.parent.Form1.StartDate_txtYear.value;
						var Ed=window.parent.Form1.EndDate_txtDay.value+"/"+window.parent.Form1.EndDate_txtMonth.value+"/"+window.parent.Form1.EndDate_txtYear.value
								
						StrXml+="<EmployeeGroup>"
						StrXml+="<Selected>1</Selected>"
						StrXml+="<PersonID>"+xmlNodes.item(i).selectSingleNode("PersonID").text+"</PersonID>"
						StrXml+="<Name>"+xmlNodes.item(i).selectSingleNode("FirstName").text+' '+xmlNodes.item(i).selectSingleNode("LastName").text+"</Name>"
						StrXml+="<StartDate>"+Sd+"</StartDate>"
						StrXml+="<EndDate>"+Ed+"</EndDate>"
						StrXml+="<IsGroup>0</IsGroup>"
						StrXml+="<ChangeData>0</ChangeData>"
						StrXml+="</EmployeeGroup>"
					}
				}	
				
				if ((Form1.txtXMLMember.value=="") || (Form1.txtXMLMember.value=="<GroupEntity />"))
				{
					StrXml="<GroupEntity>"+StrXml+"</GroupEntity>"
					Form1.txtXMLMember.value=StrXml
				}	
				else
				{
					Form1.txtXMLMember.value=Form1.txtXMLMember.value.replace("</GroupEntity>",StrXml+"</GroupEntity>")
				}
			}
		}
		/****************************************************************/
		function ModifyXMLMember(PersonId,cell,obj)
		{
			var oXmlDoc=new ActiveXObject("Microsoft.XMLDOM")
			oXmlDoc.async="false" ;
			oXmlDoc.loadXML(document.all.item('txtXMLMember').value)
			var xmlNodes=oXmlDoc.documentElement.selectNodes(root+'[PersonID='+PersonId+']')
			
			if (xmlNodes.length!=0)
				switch(cell)
				{
					case 0 :
						xmlNodes.item(0).selectSingleNode("Selected").text=((obj.checked==true)? "1":"0")
						break
					case 3 :	
						xmlNodes.item(0).selectSingleNode("StartDate").text=obj.value
						break
					case 4 :	
						xmlNodes.item(0).selectSingleNode("EndDate").text=obj.value
						break	
					case 5 :
						xmlNodes.item(0).selectSingleNode("ChangeData").text=((obj.checked==true)? "1":"0")
						break
				}
				
			Form1.txtXMLMember.value=oXmlDoc.xml;
			
		}
		/****************************************************************/
		</script>
		<script language="vbscript">
		dim century
		century="13"
		function datechk()
			dim val
			val=replace(window.event.srcElement.value," ","",1,-1,1)
			if (not (val=""))and(not Isvaliddate(val)) then
 			Dim strQuestion, intReturn
			strQuestion="  ! ·ÿ›« œ—«Ì‰ ﬁ”„   «—ÌŒ ‘„”Ì ’ÕÌÕ Ê«—œ ﬂ‰Ìœ"
			strQuestion=MsgBox(strQuestion, 0, " «—ÌŒ ‘„”Ì «‘ »«Â ")
			window.event.srcElement.focus()
			window.event.returnvalue=false
			else
			if val<>"" then
				dim arr
				arr=split(val,"/",-1,0)
				if arr(2)<100  then  
					century="13"
				else	  
					century=""
				end if
				val=right("0" & arr(1),2) & "/" & century & arr(2)
				val=right("0" & arr(0),2) & "/" & val  
				window.event.srcElement.value=val
			end if
			end if
		end function
		'********************
		function isshleap (sal)
		dim ybase_sh,L1

			if sal<100   then  
				sal=sal+1300
			end if
		      
			ybase_sh=int((sal-125)/ 99)*99+125
		      
			L1=((sal-ybase_sh) mod 99)
			if (L1>=98) then
				isshleap=(((L1-89) mod 4 )=0)
			else
				if (L1 >=61) then
						isshleap=(((L1-62) mod 4)=0)
				else 
					if L1 >=28 then
						isshleap=(((L1-29) mod 4)=0)
					else 
						isshleap=((L1 MOD 4)=0)
					end if
				end if
			end if

		END function

		'********************************************
		function Isvaliddate(txt)
		dim   le,t1,t2,sal,mah,roz,arr
		  
		arr=split(txt,"/",-1,0)
		if ubound(arr)=2 then
			roz=cint("0" & arr(0))
   				mah=cint("0" & arr(1))
 				sal=cint("0" & arr(2))
		        
			le=0
			if sal<100   then 
				sal=sal+1300
			end if
		        
			if isshleap(sal)then 
				le=1 
			end if 
		        
			t1= (mah>=1) and (mah<=12)
			t2= (roz>=1) and (roz<=29+le)
			t2= t2 or ((roz=30) and ((mah>=1) and ( mah<=11)))
			t2= t2 or ((roz=31)and((mah>=1) and ( mah<=6 )))

			Isvaliddate= (t1 and t2)
		else
			Isvaliddate=false
		end if
		end function
		'****************************

		function mi2sh(Mdate)
		dim   roz 
		if  isdate(mdate) then
				roz=(mdate - #22 March 1935#)
				Mi2sh=InttoSHD(roz)
		else
				mi2sh=""
		end if
		end function
		'*********************
		function InttoSHD(roz)
		dim   leap,Esal,sal,mahbase,tag 

				sal=0  :   mah =0  :   leap=0 :  tag=0  : Esal=0

				do while roz<00000  :roz=roz+36159 :sal=sal-99 :loop
				do while roz>36158  :roz=roz-36159 :sal=sal+99 :loop

				select case roz
					case 10591 '{1342/12/30} :roz=365  :sal=sal+1342
					case 22644 '{1375/12/30} :roz=365  :sal=sal+1375
					case 36158 '{1412/12/30} :roz=365  :sal=sal+1412
					case else
        			if (roz>=00000) and (roz<=10225) then
						tag=1  :Esal=0  :base=00000 
						end if
			
					if (roz>=10226) and (roz<=10590) then
						tag=2 :Esal=1  :base=10226 
						end if

					if (roz>=10592) and (roz<=22278) then
        				tag=3 :Esal=1  :base=10592 
						end if
		          
					if (roz>=22279) and (roz<=22643) then
        				tag=4 :Esal=2  :base=22279 
						end if

					if (roz>=22645) and (roz<=35792) then
        				tag=5 :Esal=2 :base=22645  
						end if

					if (roz>=35793) and (roz<=36157) then
        				tag=6 :Esal=3 :base=35793  
						end if
			end select

			if ((tag mod 2)=1 ) and ( ((roz-base+1) mod 1461 )=0 ) then
				roz=roz-1 :leap=1
			end if

			if tag>0 then
				roz=roz-Esal*365 
				roz=roz-int(roz / 1461)
				sal=Esal+sal+ int(roz / 365)+1314
       			roz=roz mod 365+leap
			end if

			if roz>=186 then
				roz=roz-186  :mah=6+int(roz / 30) :roz=roz mod 30
			else
				mah=int(roz / 31) :roz=roz mod 31
			end if
		       
			InttoSHD=cstr(sal)+"/"+right("0"&(mah+1),2)+"/"+right("0"&(roz+1),2)
		end function
		'*************************************************
		function SHDtoInt(shd)
		dim  sal,mah,roz,Tr,arr
		      
		arr=split(shd,"/",-1,1)
		if ubound(arr)=2 then
			sal=cint(arr(0)) 
			mah=cint(arr(1))-1
			roz=cint(arr(2))-1
			Tr=0
		      
			if sal <100 then sal=1300+sal end if
			sal=sal-1314

			do while sal<0  :  tr=tr-36159-366 : sal=sal+100 : loop
			do while sal>98 :  Tr=Tr+36159     : sal=sal-99  : loop
		      

			if (sal>=0 and sal<=27)  then   Tr=Tr+sal*365+(sal\4)      end if
			if (sal>=28 and sal<=60) then   Tr=Tr+sal*365+((sal-1)\ 4) end if
			if (sal>=61 and sal<=97) then   Tr=Tr+sal*365+((sal-2)\ 4) end if
			if  (sal=98)             then   Tr=Tr+sal*365+((sal-3)\ 4) end if
		      
			if mah>6 then
				Tr=Tr+(mah-6)*30+186
			else 
				Tr=Tr+mah*31
			end if

			SHDtoInt=Tr+roz
		else
			alert("«‘ﬂ«· œ—  «—ÌŒ ‘„”Ì")
			SHDtoInt=0
		end if
		end function
		'*******************************
		function Between(date1,date2)
		between=SHDtoInt(date2)-SHDtoInt(date1)+1
		end function
		'*******************************
		function shdAdd(Sdate,days)
		days=cint(days)
		if days<>0 then 
				shdAdd=InttoSHD(SHDtoInt(cstr(Sdate))+days)
		else
				shdAdd=Sdate
		end if
		end function
		'*******************************
		</script>
	</HEAD>
	<body bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" rightMargin="0" onload="PageLoad()">
		<FORM id="Form1" method="post" runat="server">
			<TABLE class="CssLayer3" id="Layer1" height="100%" cellSpacing="0" cellPadding="0" width="100%"
				align="right" border="0">
				<TR>
					<TD vAlign="top" align="right">
						<TABLE class="Csslayer3" id="Layer3" style="WIDTH: 739px; HEIGHT: 464px" height="464" cellSpacing="0"
							cellPadding="0" width="739" align="right" border="0">
							<TR>
								<TD id="Td2" vAlign="top" align="center" runat="server">
									<TABLE id="Table5" style="WIDTH: 266px; HEIGHT: 39px" cellSpacing="1" cellPadding="1" align="center"
										border="0">
										<TR>
											<TD><INPUT class="CssLastPage" id="LastBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="LastBtn_XClick()"
													type="button" name="LastBtn_X"></TD>
											<TD align="right"><INPUT class="CssNextPage" id="NextBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="NextBtn_XClick()"
													type="button" name="NextBtn_X"></TD>
											<TD vAlign="middle" align="right"><INPUT id="CurPage_X" style="BORDER-BOTTOM-STYLE: groove; BORDER-RIGHT-STYLE: groove; WIDTH: 50px; BORDER-TOP-STYLE: groove; HEIGHT: 25px; BORDER-LEFT-STYLE: groove"
													onchange="CurPage_XTextChanged()" name="CurPage_X"></TD>
											<TD dir="rtl" vAlign="middle" align="right">&nbsp;«“</TD>
											<TD vAlign="middle"><INPUT id="ToatalPage_X" style="BORDER-BOTTOM-STYLE: groove; BORDER-RIGHT-STYLE: groove; WIDTH: 50px; BORDER-TOP-STYLE: groove; HEIGHT: 25px; BORDER-LEFT-STYLE: groove"
													size="6" name="ToatalPage_X"></TD>
											<TD><INPUT class="CssPrevPage" id="PrevBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="PrevBtn_XClick()"
													type="button" name="PrevBtn_X"></TD>
											<TD><INPUT class="CssFirstPage" id="FirstBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="FirstBtn_XClick()"
													type="button" name="FirstBtn_X"></TD>
											<TD style="DISPLAY: none"></TD>
										</TR>
									</TABLE>
									<TABLE id="Table8" style="WIDTH: 736px; HEIGHT: 392px" height="392" cellSpacing="0" cellPadding="0"
										width="736" align="right" border="0">
										<TR>
											<TD vAlign="top" align="right">
												<DIV class="DivStyle" style="WIDTH: 75.19%; HEIGHT: 391px">
													<TABLE id="XTabTable_Header" style="WIDTH: 722px; HEIGHT: 34px" border="0">
														<THEAD style="DISPLAY: inline">
															<TR class="ShoperHeaderStyle">
																<TD class="CssHeaderStyle" style="BORDER-BOTTOM: #346fa4 2px solid; BORDER-LEFT: lightsteelblue 2px solid; BORDER-TOP: lightsteelblue 2px solid; BORDER-RIGHT: #346fa4 2px solid"
																	align="center" width="25"><INPUT id="ChkAll" title="‰„«Ì‘Ì »Êœ‰ ” Ê‰Â«" style="BACKGROUND-COLOR: transparent" onclick="onClickChkAll()"
																		type="checkbox" name="ChkAll">
																</TD>
																<TD class="CssHeaderStyle" style="BORDER-BOTTOM: #346fa4 2px solid; BORDER-LEFT: lightsteelblue 2px solid; BORDER-TOP: lightsteelblue 2px solid; BORDER-RIGHT: #346fa4 2px solid"
																	align="center" width="90">‘„«—Â Å—”‰·Ì</TD>
																<TD class="CssHeaderStyle" style="BORDER-BOTTOM: #346fa4 2px solid; BORDER-LEFT: lightsteelblue 2px solid; BORDER-TOP: lightsteelblue 2px solid; BORDER-RIGHT: #346fa4 2px solid"
																	align="center" width="240">‰«„ Ê ‰«„ Œ«‰Ê«œêÌ</TD>
																<TD class="CssHeaderStyle" style="BORDER-BOTTOM: #346fa4 2px solid; BORDER-LEFT: lightsteelblue 2px solid; BORDER-TOP: lightsteelblue 2px solid; BORDER-RIGHT: #346fa4 2px solid"
																	align="center" width="135"> «—ÌŒ ‘—Ê⁄ «⁄ »«—</TD>
																<TD class="CssHeaderStyle" style="BORDER-BOTTOM: #346fa4 2px solid; BORDER-LEFT: lightsteelblue 2px solid; BORDER-TOP: lightsteelblue 2px solid; BORDER-RIGHT: #346fa4 2px solid"
																	align="center" width="135"> «—ÌŒ Å«Ì«‰ «⁄ »«—</TD>
																<TD class="CssHeaderStyle" style="BORDER-BOTTOM: #346fa4 2px solid; BORDER-LEFT: lightsteelblue 2px solid; BORDER-TOP: lightsteelblue 2px solid; BORDER-RIGHT: #346fa4 2px solid"
																	align="center" width="25"><INPUT id="chkAllChangeData" title=" €ÌÌ—  «—ÌŒ" style="BACKGROUND-COLOR: transparent"
																		onclick="onClickChkAllChangeData(this)" type="checkbox" name="ChkAll"></TD>
															</TR>
														</THEAD>
													</TABLE>
													<DIV class="DivStyle" style="SCROLLBAR-ARROW-COLOR: black; WIDTH: 130.85%; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 336px; SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto">
														<TABLE id="XTabTable">
															<THEAD style="DISPLAY: none">
																<TR>
																	<TD align="center"></TD>
																	<TD align="center"></TD>
																	<TD align="center"></TD>
																</TR>
															</THEAD>
														</TABLE>
													</DIV>
												</DIV>
											</TD>
										</TR>
										<TR>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
				<TR>
					<TD style="DISPLAY: none" vAlign="top" align="right">
						<input id="txtXMLMember" size="1" name="txtXMLMember" runat="server"> <input id="XMLPerson" size="1" name="XMLPerson" runat="server">
						<input id="txtSessionID" name="txtSessionID" runat="server"> <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
							runat="server" />
						<cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity>
					</TD>
				</TR>
			</TABLE>
		</FORM>
	</body>
</HTML>
