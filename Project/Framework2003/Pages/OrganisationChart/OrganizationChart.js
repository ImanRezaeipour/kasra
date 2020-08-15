function getCntChar(subStr1,Str1)
{
var Str=new String					
Str=Str1+''
if (Str1==0 || Str1=='')
	return(0)

var subStr=new String		 
subStr=subStr1+''
if (subStr1=='')
	return(0)
	
var cnt
cnt=0
for(j=0;j<Str.length;++j)
	if(Str.substring(j,j+subStr.length)==subStr)
			cnt+=1
return(cnt)
}
function getArray(Str,Index,sep)
{
var j
var i=0
var items=new String
items=Str
var p=new String
if (items!="")
{
	j=items.search(sep)	
	while(j<=items.length && i<=Index)	
	{
		p=items.substring(0,j)
		if (j<0) p=items.substring(0,items.length)
		j=j+1
		items=items.substring(j,items.length)
		j=items.search(sep)	
		if (j<0) j=items.length+1
		i=i+1
	}
}
i=i-1
if (i==Index)
	return(p.substring(0,p.length))
else
	return('')}
function OnKeyDownNum(TypeNum,number){
var key=window.event.keyCode
if (TypeNum=='double'){
	window.event.returnValue=
		(
			((key>=96) && (key <=105))||
			((key>=48) && (key <=57 ))||
			(key==8)||(key==9)||(key==46)||
			((key>=35)&& (key<=40)) ||((key==110) && getCntChar('.',number)<1)
		)
}
if (TypeNum=='integer'){
	window.event.returnValue=(
			((key>=96) && (key <=105))||
			((key>=48) && (key <=57 ))||
			(key==8)||(key==9)||(key==46)||
			((key>=35)&& (key<=40)) 
		)}}