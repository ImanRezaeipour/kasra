/******************************************************/
var century
century="13"
/******************************************************/
function datechk(val)
{	
	
	
	if ((val!="")&&!Isvaliddate(val)) 
	{
		alert("تاريخ شمسي اشتباه\nلطفا در اين قسمت تاريخ شمسي صحيح وارد نماييد!")
		return false
		
	}
	
	else
	if(val!="")
	{
		var arr1,arr2,arr3
		var x=0
		while (x<getCntChar('/',val+"/"))
		{
				arr1=getArray(val+"/",x,'/')
				++x
				arr2=getArray(val+"/",x,'/')
				++x
				arr3=getArray(val+"/",x,'/')
				++x
		}
		arr1=arr1
		arr2=arr2
		arr3=arr3
		
		if(arr1<100)
			century="13"
		else	  
			century=""
		
		if(arr2<10)
			val=century+""+arr1+"/0"+arr2
		else
			val=century+""+arr1+"/"+arr2
			
		if(arr3<10)
			val+="/0"+arr3
		else
			val+="/"+arr3
		
		
		return val
	}
	
	
}
/******************************************************/
function Isvaliddate(txt)
{
	var le,t1,t2,sal,mah,roz
	var arr1,arr2,arr3
	var x=0
	while (x<getCntChar('/',txt+"/"))
	{
			arr1=getArray(txt+"/",x,'/')
			++x
			arr2=getArray(txt+"/",x,'/')
			++x
			arr3=getArray(txt+"/",x,'/')
			++x
	}
	
	
	if(getCntChar('/',txt)==2)
	{ 
		roz=arr3
   		mah=arr2
 		sal=arr1
		
		le=0
		if(sal<100)
			sal=sal+1300
		
			
		if(isshleap(sal))
			le=1 
		
		
		t1= ((mah>=1)&&(mah<=12))
		t2= ((roz>=1)&&(roz<=29+le))
		t2= (t2||((roz==30)&&((mah>=1)&&( mah<=11))))
		t2= (t2||((roz==31)&&((mah>=1)&&( mah<=6 ))))
	
		return (t1&&t2)
	}
	else
	{
		return false
	}
}
/******************************************************/
function isshleap(sal)
{
	var ybase_sh,L1

	if(sal<100)  
		sal=sal+1300
	
	
	ybase_sh=parseInt((sal-125)/ 99)*99+125
	
	
	L1=((sal-ybase_sh)%99)
	if(L1>=98) 
		return (((L1-89)%4 )==0)
	else
	{
		if(L1>=61)
				return (((L1-62)%4)==0)
		else 
			if(L1>=28)
				return (((L1-29)%4)==0)
			else 
				return ((L1%4)==0)
			
		
	}
		
}
/******************************************************/
function InttoSHD(roz)
{
	var leap,Esal,sal,mahbase,tag 

	sal=0  
	mah =0  
	leap=0 
	tag=0  
	Esal=0
	
	do
	{
		roz=roz+36159
		sal=sal-99
	}while(roz<00000)

	do
	{
		roz=roz-36159
		sal=sal+99
	}while(roz>36158)
	
	
	if((roz!=10591)&&(roz!=22644)&&(roz!=36158))
	{
		if((roz>=00000)&&(roz<=10225))
		{
			tag=1  
			Esal=0  
			mahbase=00000 
		}
		if((roz>=10226)&&(roz<=10590))
		{
			tag=2 
			Esal=1  
			mahbase=10226 
		}
		if((roz>=10592)&&(roz<=22278))
		{
        	tag=3 
			Esal=1  
			mahbase=10592 
		}
		if((roz>=22279)&&(roz<=22643))
		{	
			tag=4 
			Esal=2  
			mahbase=22279 
		}
		if((roz>=22645)&&(roz<=35792))
		{
			tag=5 
			Esal=2 
			mahbase=22645  
		}	
		if((roz>=35793)&&(roz<=36157))
		{
        	tag=6 
			Esal=3 
			mahbase=35793  
		}
	}
	else if(roz==10591) //1342/12/30
	{
		roz=365
		sal=sal+1342
	}
	else if(roz==22644) //1375/12/30
	{
		roz=365
		sal=sal+1375
	}
	else if(roz==36158) //1412/12/30
	{
		roz=365
		sal=sal+1412
	}
	
	

	if(((tag%2)==1)&&(((roz-mahbase+1)%1461)==0))
	{
		roz=roz-1 
		leap=1
	}
	
	if(tag>0)
	{
		roz=roz-Esal*365 
		roz=roz-parseInt(roz / 1461)
		sal=Esal+sal+parseInt(roz / 365)+1314
       	roz=roz%365+leap
	}
	
	if(roz>=186)
	{
		roz=roz-186  
		mah=6+parseInt(roz / 30) 
		roz=roz%30
	}
	else
	{
		mah=parseInt(roz / 31) 
		roz=roz%31
	}
	
	
	return datechk(sal+"/"+(mah+1)+"/"+(roz+1))
	
	
}
/******************************************************/
function SHDtoInt(shd)
{
	var  sal,mah,roz,Tr
	var arr1,arr2,arr3
	
	var x=0
	while (x<getCntChar('/',shd+"/"))
	{
		arr1=getArray(shd+"/",x,'/')
		++x
		arr2=getArray(shd+"/",x,'/')
		++x
		arr3=getArray(shd+"/",x,'/')
		++x
	}
	
	if(getCntChar('/',shd)==2)
	{ 
		roz=arr3-1
   		mah=arr2-1
 		sal=arr1
 		Tr=0
 		
 		if(sal<100)
 			sal=1300+sal
 			
		sal=sal-1314
		
		while(sal<0)
		{
				Tr=Tr-36159-366 
				sal=sal+100 
		}
		
		while(sal>98)
		{
				Tr=Tr+36159     
				sal=sal-99  
		}
		
		if((sal>=0)&&(sal<=27))
			Tr=Tr+sal*365+parseInt(sal/4)
			
		if((sal>=28)&&(sal<=60))
			Tr=Tr+sal*365+parseInt((sal-1)/4)
		
		if((sal>=61)&&(sal<=97))
			Tr=Tr+sal*365+parseInt((sal-2)/4)
			
		if(sal==98)
			Tr=Tr+sal*365+parseInt((sal-3)/4)
			
			
		if(mah>6)
			Tr=Tr+(mah-6)*30+186
		else 
			Tr=Tr+mah*31
		
		return (Tr+roz)
		
 	}
 	else
 	{
 		alert("اشكال در تاريخ شمسي")
		return 0
 	}
	
}
/******************************************************/
function Between(date1,date2)
{
	return (SHDtoInt(date2)-SHDtoInt(date1)+1)
}
/******************************************************/
function shdAdd(Sdate,days)
{	
	if (!Isvaliddate(Sdate))
		return false	
	days=parseInt(days)
	if(days!=0)
			return (InttoSHD(SHDtoInt(Sdate)+days))
	else
			return Sdate
	
}
/******************************************************/