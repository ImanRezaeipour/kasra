function SumTime(Time1,Time2)
	{
	if (Time1=="")
		Time1="00:00"
		
	if (Time2=="")
		Time2="00:00"
		
	Time1+=":"
	Time2+=":"
	
	if(getArray(Time1,0,':').length<2)
		Time1="0"+Time1
		
	if(getArray(Time2,0,':').length<2)
		Time2="0"+Time2
		
	if(getArray(Time1,1,':').length<2)
		Time1=getArray(Time1,0,':')+":0"+getArray(Time1,1,':')+":"
		
	if(getArray(Time2,1,':').length<2)
	
		Time2=getArray(Time2,0,':')+":0"+getArray(Time2,1,':')+":"
		
	//Time1=Time1.substring(0,Time1.length-1)
	//Time2=Time2.substring(0,Time2.length-1)
	var Minute1=getArray(Time1,0,':')
	var Second1=getArray(Time1,1,':')
	var Minute2=getArray(Time2,0,':')
	var Second2=getArray(Time2,1,':')
	
	var M=parseInt(Minute1)+parseInt(Minute2)
	var S=parseInt(Second1)+
	
	
	
	
	parseInt(Second2)
	
	if  (S>=60)
	{
		M++;
		S=S-60;
	}
	return(M+":"+S)
	 
	}