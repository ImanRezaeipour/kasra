var lastgrdSize=0		
var lastinnerText=""
var lasttitle=""
var lastwidth=0
var lastwidthgrdHeaderitem=""
var lastwidthgrditem=""
var lastwidthgrdHeader=""
var lastwidthgrd=""
var Kind=0
var lastSelectedcellNumber=-1
function getCntChar(subStr1,Str1){
	var Str=new String					
	Str=Str1+''
	if (Str1=='')
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
	return(cnt)}
function getArray(Str,Index,sep){
	var j
	var i
	i=0
	var items=new String
	items=Str
	var p=new String
	if (items!=""){
		j=items.search(sep)	
		while(j<=items.length && i<=Index){
			p=items.substring(0,j)
			if (j<0) p=items.substring(0,items.length)
			j=j+1
			items=items.substring(j,items.length)
			j=items.search(sep)	
			if (j<0) j=items.length+1
			i=i+1}}
	i=i-1
	if (i==Index)
		return(p.substring(0,p.length))
	else
		return('')}
var oInterval="";
var Counter=0;
var TimeCount=0;
function fnStartInterval(){
	if(oInterval=="")
		oInterval=window.setInterval("fnRecycle()",500)
	else{
		fnStopInterval()}}
function fnStopInterval(){
	if(oInterval!=""){
		window.clearInterval(oInterval);
		resetVariable()
		resetColor()}}
function fnRecycle(){
	if (Counter==6){
		Counter=0;
		TimeCount++;}
	else if (TimeCount%2==0){
		Counter++;
		switch(Counter){
			case 1:
				document.all.item('td1').bgColor="#ff99cc"
				break
			case 2:
				document.all.item('td2').bgColor="#ff99cc"
				break
			case 3:
				document.all.item('td3').bgColor="#ff99cc"
				break	
			case 4:
				document.all.item('td4').bgColor="#ff99cc"
				break	
			case 5:
				document.all.item('td5').bgColor="#ff99cc"
				break	
			case 6:
				document.all.item('td6').bgColor="#ff99cc"
				break}}
	else if (TimeCount%2!=0){
		Counter++;
		switch(Counter){
			case 1:
				document.all.item('td1').bgColor="#ffffff"
				break
			case 2:
				document.all.item('td2').bgColor="#ffffff"
				break
			case 3:
				document.all.item('td3').bgColor="#ffffff"
				break	
			case 4:
				document.all.item('td4').bgColor="#ffffff"
				break	
			case 5:
				document.all.item('td5').bgColor="#ffffff"
				break	
			case 6:
				document.all.item('td6').bgColor="#ffffff"
				break}}}
function resetVariable(){
	oInterval="";
	Counter=0;
	TimeCount=0}
function resetColor(){
	document.all.item('td1').bgColor="#ffffff"
	document.all.item('td2').bgColor="#ffffff"
	document.all.item('td3').bgColor="#ffffff"
	document.all.item('td4').bgColor="#ffffff"
	document.all.item('td5').bgColor="#ffffff"
	document.all.item('td6').bgColor="#ffffff"}


