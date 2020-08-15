
function ReplaceAll(str,char1,replaceChar)
{
	var x=getCntChar(char1,str)
	var s=new String()
	s=str
	while(x>0)
	{
		s=s.replace(char1,replaceChar)
		x--
	}
	return(s)
}
function getCntChar(subStr1,Str1)
{
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
	return(cnt)
}
function getArray(Str,Index,sep)
{
	var j
	var i
	i=0
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
		return('')
}
function SearchonClientGrd(txtPersonelNum,txtXmlValue,root,PersonNum,PageSize,GridName,XmlLimit)
	{

		if(txtPersonelNum.value!="")
		{
			
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			var xmlNodes;
			var totalRecords  
			var ID=0;
			var Number=0;
			var i=0
			xmlDoc.loadXML(txtXmlValue.value);
			if(XmlLimit=="")
			{
			xmlNodes=xmlDoc.documentElement.selectNodes(root);
			}
			else
			{

			xmlNodes=xmlDoc.documentElement.selectNodes(root+ XmlLimit);
			}
			
			try
			{
				while(ID!=parseInt(txtPersonelNum.value))
				{
				
					if(Number>=xmlNodes.length)
					{
				
						alert('Å—”‰· „Ê—œ ‰Ÿ— ⁄÷Ê «Ì‰ ê—ÊÂ ‰„Ì »«‘œ')
						return
					}
					
					ID=xmlNodes.item(Number).selectSingleNode(PersonNum).text
				
					Number=Number+1;
				}
			
					Form1.CurPage_X.value=Math.ceil(Number/PageSize )
					CurPage_XTextChanged()
			}
				catch(e)
			{
				alert(e.message)
			}
			
			i=Number%PageSize
			if(i==0)
			{
				i=PageSize
			
			}
			
			GridName.rows(i-1).style.backgroundColor='#ffdfe7'
		}
			
	}