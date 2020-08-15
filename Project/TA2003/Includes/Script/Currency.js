////////////////////////////////////////////////////////////////////////////////
function OnKeyDownNum(TypeNum)
{
	var key=window.event.keyCode
	if (TypeNum==1)//double
	{
		window.event.returnValue=
			(
				((key>=96) && (key <=105))||
				((key>=48) && (key <=57 ))||
				(key==8)||(key==9)||(key==46)||
				((key>=35)&& (key<=40)) ||(key==110)
			)
	}
	if (TypeNum==2)//integer
	{
		window.event.returnValue=
			(
				((key>=96) && (key <=105))||
				((key>=48) && (key <=57 ))||
				(key==8)||(key==9)||(key==46)||
				((key>=35)&& (key<=40)) 
			)
	}
}
////////////////////////////////////////////////////////////////////////////////
function getnumber(sep,currstring)
{			
	var currencystring=new String					
	currencystring=currstring+''
	if (currencystring=='')
		return(0)
	var j;	
	var subcurrency1,subcurrency2;										
	for(j=0;j<currencystring.length;j++)
		{
			if(currencystring.substring(j,j+1)==sep)
				{
					subcurrency1=currencystring.substring(0,j)														
					subcurrency2=currencystring.substring(j+1,currencystring.length+1)							
					currencystring=subcurrency1+subcurrency2														
				}	
		}
	return(currencystring)
}	
////////////////////////////////////////////////////////////////////////////////
function getCurrency(sep,number,Round,obj) //<font color='red' size='3px'>+sep+</font>
{
	var TempInnerHTML=''
	var StartTag
	
	var numberstring=new String					
	numberstring=number+''
	
	if (number==0 || number=='')
		return(0)
	var subnumRound=''
	
	if (Round==1)
	{
		
		var subnum="";
		var subnum1="";
		var numbertstrlength=0;	
		var j;
		var pointplace=0;	
		var flag=false	
		
		var numbertstrlength=numberstring.length
		for(j=0;j<numbertstrlength;++j)
			{
				if(numberstring.substring(j,j+1)==".")
					{
						pointplace=j
						flag=true
					}
			}
		
		if(flag==true)
		{				
			subnum1=numberstring.substring(pointplace,pointplace+3)				
		}
		else
		{
			subnum1=""	
			pointplace=	numbertstrlength	
		}
		
		numberstring=numberstring.substring(0,pointplace)
		numbertstrlength=numberstring.length				
		while (numberstring.length>=3)			
		{																
			subnum=numberstring.substring(numberstring.length-3,numberstring.length)+sep+subnum			
			numberstring=numberstring.substring(0,numberstring.length-3)				
		}
				
		if (numbertstrlength%3==0)
			subnum=numberstring+subnum
		else
			subnum=numberstring+sep+subnum	
				
		subnum=subnum.substring(0,subnum.length-1)+subnum1
		return(subnum)												
	}
	else
	{
		var subnum="";
		var subnum1="";
		var numbertstrlength=0;	
		var j;
		var pointplace=0;	
		var flag=false		
		var numbertstrlength=numberstring.length
		for(j=0;j<numbertstrlength;++j)
			{
				if(numberstring.substring(j,j+1)==".")
					{
						pointplace=j
						flag=true
					}
			}			
		if(flag==true)				
		{
			subnum1=numberstring.substring(pointplace,pointplace+3)	
			if ((numberstring.length)>=(pointplace+4))
				subnumRound=numberstring.substring(pointplace,pointplace+4)	
			else
				subnumRound=subnum1
			if (subnumRound.length==4)
				if(parseInt(subnumRound.substring(3,4))>=5)
					subnumRound=subnumRound.substring(0,2)+(parseInt(subnumRound.substring(2,3))+1)
				else
					subnumRound=subnumRound.substring(0,2)+parseInt(subnumRound.substring(2,3))	
				
		}
		else
		{
			subnum1=",00"	
			pointplace=	numbertstrlength	
		}
		numberstring=numberstring.substring(0,pointplace)
		numbertstrlength=numberstring.length
			
		//StartTag="<asp:Label runat='server'>"		
		
		subnum=numberstring.substring(numberstring.length-3,numberstring.length)
		TempInnerHTML=subnum
		numberstring=numberstring.substring(0,numberstring.length-3)
			
		while (numberstring.length>=3)			
		{
			//subnum=numberstring.substring(numberstring.length-3,numberstring.length)+sep+subnum			
			subnum=numberstring.substring(numberstring.length-3,numberstring.length)
			TempInnerHTML=subnum+"<font color='red' size='3px'>"+sep+"</font>"+TempInnerHTML
					
			numberstring=numberstring.substring(0,numberstring.length-3)				
		}
				
		if (numbertstrlength%3==0)
		{
			//subnum=numberstring+subnum
			subnum=numberstring	
			TempInnerHTML=subnum+TempInnerHTML			
		}
		else
		{
			//subnum=numberstring+sep+subnum	
			subnum=numberstring
			if (subnum=='')
				TempInnerHTML=subnum+TempInnerHTML					
			else
				TempInnerHTML=subnum+"<font color='red' size='3px'>"+sep+"</font>"+TempInnerHTML					
		}
		
		/*subnum=subnum.substring(0,subnum.length-1)+subnumRound
		
		if (subnum !='')
		{
			//alert(subnum)
			TempInnerHTML=subnum+"<font color='red' size='3px'>"+sep+"</font>"+TempInnerHTML					
		}*/
		
		TempInnerHTML=TempInnerHTML+"</asp:Label>"	
		//document.all.item(obj).innerHTML=TempInnerHTML
		return(TempInnerHTML)
		
		
		//return(subnum)	
	}							
}	