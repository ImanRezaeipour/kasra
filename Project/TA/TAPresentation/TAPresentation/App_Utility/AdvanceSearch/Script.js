
var strFilter=""
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
function OnKeyDownNum(TypeNum,number)
{
	var key=window.event.keyCode
	if (TypeNum=='double')
	{
		window.event.returnValue=
			(
				((key>=96) && (key <=105))||
				((key>=48) && (key <=57 ))||
				(key==8)||(key==9)||(key==46)||
				((key>=35)&& (key<=40)) ||((key==110) && getCntChar('.',number)<1)
			)
	}
	if (TypeNum=='integer')
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
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
    function OnBlurSelectRange(obj)
    {
        var strName=obj.id;
        var a=strName.split('_')
        strName="AdvancedSearchTxtTo_"+a[1]
        if(obj.selectedIndex==4)//////Index 'Beyn'
            document.all.item(strName).disabled=false
        else
            document.all.item(strName).disabled=true       
    }
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
    function  onBlurAll(obj)
    {
       // GetUserControlID(obj)
        var xmlDoc = new ActiveXObject("MsXml2.DomDocument");	
        xmlDoc.setProperty("SelectionLanguage", "XPath");       
       
        xmlDoc.loadXML(document.all.item('AdvancedSearch_txtXML').value)//////!!!
		var xmlNodes
		xmlNodes=xmlDoc.documentElement.selectNodes("/NewDataSet/GetFilter")//////!!!
		var xmlLen=xmlNodes.length
		strFilter=""
		if(xmlLen>0)
	    {
	        for(var i=0;i<xmlLen;i++)
	        {
	            switch((xmlNodes.item(i).selectSingleNode('FilterType').text).toString())
	            {
	                case '1'://TextBox
	                   CreateFilterStr(xmlNodes.item(i).selectSingleNode('ColName').text,
	                                    xmlNodes.item(i).selectSingleNode('ColType').text,i)
	                    break;
	                case '2':                    
	                    CreateFilterStr2(xmlNodes.item(i).selectSingleNode('ColName').text,
	                                    xmlNodes.item(i).selectSingleNode('ColType').text,i)
	                    break;
	                case '3':
	                    CreateFilterStr(xmlNodes.item(i).selectSingleNode('ColName').text,
	                                    xmlNodes.item(i).selectSingleNode('ColType').text,
	                                    i)
	                    break;
	            }
	        }
	    }
      var CName=document.all.item("AdvancedSearch_txtID").value 
      document.all.item(CName+"_txtFilterStr").value=strFilter
    }  
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
    function CreateFilterStr2(colName,colType,index)
    {
        //alert('CreateFilterStr2')
        var obj1="",obj2="",obj3=""
        obj1 ="AdvancedSearchTxtFrom_"+index
        obj2 ="AdvancedSearchTxtTo_"+index
        obj3 ="AdvancedSearchSel_"+index
    
        switch((document.all.item(obj3).selectedIndex).toString())
        {
             case '0'://شروع شود با
             return 
                if(document.all.item(obj1).value!="")
                {
                    if(strFilter!="")
                        strFilter+=" and "
                        
                    strFilter+=colName.toString()
                            +" like '"
                            +document.all.item(obj1).value
                            +"%'"    
                }
                break 
                
            case '1'://برابر
                if(document.all.item(obj1).value!="")
                {
                    if(colType==1)//Type is Int
                    {
                        if(strFilter!="")
                            strFilter+=" and " 
                            
                        strFilter+=colName.toString()
                                    +"="
                                    +document.all.item(obj1).value
                   }
                   else//Type is String
                   {
                         if(strFilter!="")
                            strFilter+=" and " 
                            
                         strFilter+=colName.toString()
                                    +"='"
                                    +document.all.item(obj1).value
                                    +"'"
                   }      
                }
                break 
            case '2'://مخالف
            
                if(document.all.item(obj1).value!="")
                {
                    if(colType==1)//Type is Int
                    {
                        if(strFilter!="")
                            strFilter+=" and " 
                        strFilter+=colName.toString()
                                    +"<>"
                                    +document.all.item(obj1).value
                   }
                   else//Type is String
                   {
                         if(strFilter!="")
                            strFilter+=" and "  
                            
                         strFilter+=colName.toString()
                                +"<>'"
                                +document.all.item(obj1).value
                                +"'"
                   }      
                }
                break 
            case '3'://داراي
            
                if(document.all.item(obj1).value!="")
                {
                    if(strFilter!="")
                        strFilter+=" and "
                        
                    strFilter+=colName.toString()
                            +" like '%"
                            +document.all.item(obj1).value
                            +"%'"    
                }
                break 
            case '4'://بين
                if(colType==1)//Type is Int
                {
                     if(strFilter!="")
                        strFilter+=" and "
                        
                     strFilter+=colName.toString()
                            +" between "
                            +document.all.item(obj1).value
                            +" and "
                            +document.all.item(obj2).value
               }
               else//Type is String
               {
                     if(strFilter!="")
                        strFilter+=" and "
                        
                    strFilter+=colName.toString()
                            +" between '"
                            +document.all.item(obj1).value
                            +"' and '"
                            +document.all.item(obj2).value
                            +"'"
               }      
               break 
            
        }
    }
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>    
    function CreateFilterStr(colName,colType,index)
    {
        var strName=""
        strName ="AdvancedSearchTxt_"+index
        if(document.all.item(strName).value!="")
        {
            if(colType==1)//Type is Int
            {
                if(strFilter!="")
                    strFilter+=" and " 
                    
                strFilter+=colName.toString()
                            +"="
                            +document.all.item(strName).value;
           }
           else//Type is String
           {
                 if( strFilter!="" )
                    strFilter+=" and " ;
                    
                 strFilter+=colName.toString()
                        +"='"
                        +document.all.item(strName).value
                        +"'"
           }      
        }
    }
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>        
    function GetUserControlID(obj)
    {
	   /* var strUserControlID = "";
	    var iCounter = 0;
    	alert(obj.IsMainTable)
	    while(++iCounter<20 && obj!=null && obj.IsMainTable==null)
		    obj = obj.parentElement;
    		
    	alert(obj.IsMainTable)
	    if(obj!=null && obj.IsMainTable!=null && obj.IsMainTable=="true")
		    strUserControlID = obj.UserControlID;
	    //return strUserControlID;
	    alert(strUserControlID)
	    */
	    
//	    var iCounter = 0;
//	    while(obj!=null && obj.tagName!="HTML")
//	    {
//		    obj = obj.parentElement;
//		    alert(obj.UserControlID)
//		 }
    		
//    	alert(obj.tagName)
//	    if(obj!=null && obj.IsMainTable!=null && obj.tagName!="div")
//		    strUserControlID = obj.UserControlID;
	    
    }