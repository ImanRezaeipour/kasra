<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdvancedSearch.ascx.cs" Inherits="TAPresentation.App_Utility.Search.AdvancedSearch" %>
<script language="javascript" type="text/javascript">
  

var Spry;
if (!Spry) Spry = {};
if (!Spry.Widget) Spry.Widget = {};

Spry.Widget.CollapsiblePanel = function(element, opts)
{
	this.init(element);

	Spry.Widget.CollapsiblePanel.setOptions(this, opts);

	this.attachBehaviors();
};

Spry.Widget.CollapsiblePanel.prototype.init = function(element)
{
	this.element = this.getElement(element);
	this.focusElement = null;
	this.hoverClass = "CollapsiblePanelTabHover";
	this.openClass = "CollapsiblePanelOpen";
	this.closedClass = "CollapsiblePanelClosed";
	this.focusedClass = "CollapsiblePanelFocused";
	this.enableAnimation = true;
	this.enableKeyboardNavigation = true;
	this.animator = null;
	this.hasFocus = false;
	this.contentIsOpen = true;
};

Spry.Widget.CollapsiblePanel.prototype.getElement = function(ele)
{
	if (ele && typeof ele == "string")
		return document.getElementById(ele);
	return ele;
};

Spry.Widget.CollapsiblePanel.prototype.addClassName = function(ele, className)
{
	if (!ele || !className || (ele.className && ele.className.search(new RegExp("\\b" + className + "\\b")) != -1))
		return;
	ele.className += (ele.className ? " " : "") + className;
};

Spry.Widget.CollapsiblePanel.prototype.removeClassName = function(ele, className)
{
	if (!ele || !className || (ele.className && ele.className.search(new RegExp("\\b" + className + "\\b")) == -1))
		return;
	ele.className = ele.className.replace(new RegExp("\\s*\\b" + className + "\\b", "g"), "");
};

Spry.Widget.CollapsiblePanel.prototype.hasClassName = function(ele, className)
{
	if (!ele || !className || !ele.className || ele.className.search(new RegExp("\\b" + className + "\\b")) == -1)
		return false;
	return true;
};

Spry.Widget.CollapsiblePanel.prototype.setDisplay = function(ele, display)
{
	if( ele )
		ele.style.display = display;
};

Spry.Widget.CollapsiblePanel.setOptions = function(obj, optionsObj, ignoreUndefinedProps)
{
	if (!optionsObj)
		return;
	for (var optionName in optionsObj)
	{
		if (ignoreUndefinedProps && optionsObj[optionName] == undefined)
			continue;
		obj[optionName] = optionsObj[optionName];
	}
};

Spry.Widget.CollapsiblePanel.prototype.onTabMouseOver = function()
{
	this.addClassName(this.getTab(), this.hoverClass);
};

Spry.Widget.CollapsiblePanel.prototype.onTabMouseOut = function()
{
	this.removeClassName(this.getTab(), this.hoverClass);
};

Spry.Widget.CollapsiblePanel.prototype.open = function()
{
	this.contentIsOpen = true;
	if (this.enableAnimation)
	{
		if (this.animator)
			this.animator.stop();
		this.animator = new Spry.Widget.CollapsiblePanel.PanelAnimator(this, true);
		this.animator.start();
	}
	else
		this.setDisplay(this.getContent(), "block");

	this.removeClassName(this.element, this.closedClass);
	this.addClassName(this.element, this.openClass);
};

Spry.Widget.CollapsiblePanel.prototype.close = function()
{
	this.contentIsOpen = false;
	if (this.enableAnimation)
	{
		if (this.animator)
			this.animator.stop();
		this.animator = new Spry.Widget.CollapsiblePanel.PanelAnimator(this, false);
		this.animator.start();
	}
	else
		this.setDisplay(this.getContent(), "none");

	this.removeClassName(this.element, this.openClass);
	this.addClassName(this.element, this.closedClass);
};

Spry.Widget.CollapsiblePanel.prototype.onTabClick = function()
{
	if (this.isOpen())
		this.close();
	else
		this.open();
	this.focus();
};

Spry.Widget.CollapsiblePanel.prototype.onFocus = function(e)
{
	this.hasFocus = true;
	this.addClassName(this.element, this.focusedClass);
};

Spry.Widget.CollapsiblePanel.prototype.onBlur = function(e)
{
	this.hasFocus = false;
	this.removeClassName(this.element, this.focusedClass);
};

Spry.Widget.CollapsiblePanel.ENTER_KEY = 13;
Spry.Widget.CollapsiblePanel.SPACE_KEY = 32;

Spry.Widget.CollapsiblePanel.prototype.onKeyDown = function(e)
{
	var key = e.keyCode;
	if (!this.hasFocus || (key != Spry.Widget.CollapsiblePanel.ENTER_KEY && key != Spry.Widget.CollapsiblePanel.SPACE_KEY))
		return true;
	
	if (this.isOpen())
		this.close();
	else
		this.open();

	if (e.stopPropagation)
		e.stopPropagation();
	if (e.preventDefault)
		e.preventDefault();

	return false;
};

Spry.Widget.CollapsiblePanel.prototype.attachPanelHandlers = function()
{
	var tab = this.getTab();
	if (!tab)
		return;

	var self = this;
	Spry.Widget.CollapsiblePanel.addEventListener(tab, "click", function(e) { return self.onTabClick(); }, false);
	Spry.Widget.CollapsiblePanel.addEventListener(tab, "mouseover", function(e) { return self.onTabMouseOver(); }, false);
	Spry.Widget.CollapsiblePanel.addEventListener(tab, "mouseout", function(e) { return self.onTabMouseOut(); }, false);

	if (this.enableKeyboardNavigation)
	{
		// XXX: IE doesn't allow the setting of tabindex dynamically. This means we can't
		// rely on adding the tabindex attribute if it is missing to enable keyboard navigation
		// by default.

		// Find the first element within the tab container that has a tabindex or the first
		// anchor tag.
		
		var tabIndexEle = null;
		var tabAnchorEle = null;

		this.preorderTraversal(tab, function(node) {
			if (node.nodeType == 1 /* NODE.ELEMENT_NODE */)
			{
				var tabIndexAttr = tab.attributes.getNamedItem("tabindex");
				if (tabIndexAttr)
				{
					tabIndexEle = node;
					return true;
				}
				if (!tabAnchorEle && node.nodeName.toLowerCase() == "a")
					tabAnchorEle = node;
			}
			return false;
		});

		if (tabIndexEle)
			this.focusElement = tabIndexEle;
		else if (tabAnchorEle)
			this.focusElement = tabAnchorEle;

		if (this.focusElement)
		{
			Spry.Widget.CollapsiblePanel.addEventListener(this.focusElement, "focus", function(e) { return self.onFocus(e); }, false);
			Spry.Widget.CollapsiblePanel.addEventListener(this.focusElement, "blur", function(e) { return self.onBlur(e); }, false);
			Spry.Widget.CollapsiblePanel.addEventListener(this.focusElement, "keydown", function(e) { return self.onKeyDown(e); }, false);
		}
	}
};

Spry.Widget.CollapsiblePanel.addEventListener = function(element, eventType, handler, capture)
{
	try
	{
		if (element.addEventListener)
			element.addEventListener(eventType, handler, capture);
		else if (element.attachEvent)
			element.attachEvent("on" + eventType, handler);
	}
	catch (e) {}
};

Spry.Widget.CollapsiblePanel.prototype.preorderTraversal = function(root, func)
{
	var stopTraversal = false;
	if (root)
	{
		stopTraversal = func(root);
		if (root.hasChildNodes())
		{
			var child = root.firstChild;
			while (!stopTraversal && child)
			{
				stopTraversal = this.preorderTraversal(child, func);
				try { child = child.nextSibling; } catch (e) { child = null; }
			}
		}
	}
	return stopTraversal;
};

Spry.Widget.CollapsiblePanel.prototype.attachBehaviors = function()
{
	var panel = this.element;
	var tab = this.getTab();
	var content = this.getContent();

	if (this.contentIsOpen || this.hasClassName(panel, this.openClass))
	{
		this.removeClassName(panel, this.closedClass);
		this.setDisplay(content, "block");
		this.contentIsOpen = true;
	}
	else
	{
		this.removeClassName(panel, this.openClass);
		this.addClassName(panel, this.closedClass);
		this.setDisplay(content, "none");
		this.contentIsOpen = false;
	}

	this.attachPanelHandlers();
};

Spry.Widget.CollapsiblePanel.prototype.getTab = function()
{
	return this.getElementChildren(this.element)[0];
};

Spry.Widget.CollapsiblePanel.prototype.getContent = function()
{
	return this.getElementChildren(this.element)[1];
};

Spry.Widget.CollapsiblePanel.prototype.isOpen = function()
{
	return this.contentIsOpen;
};

Spry.Widget.CollapsiblePanel.prototype.getElementChildren = function(element)
{
	var children = [];
	var child = element.firstChild;
	while (child)
	{
		if (child.nodeType == 1 /* Node.ELEMENT_NODE */)
			children.push(child);
		child = child.nextSibling;
	}
	return children;
};

Spry.Widget.CollapsiblePanel.prototype.focus = function()
{
	if (this.focusElement && this.focusElement.focus)
		this.focusElement.focus();
};

/////////////////////////////////////////////////////

Spry.Widget.CollapsiblePanel.PanelAnimator = function(panel, doOpen, opts)
{
	this.timer = null;
	this.interval = 0;
	this.stepCount = 0;

	this.fps = 0;
	this.steps = 10;
	this.duration = 500;
	this.onComplete = null;

	this.panel = panel;
	this.content = panel.getContent();
	this.panelData = [];
	this.doOpen = doOpen;

	Spry.Widget.CollapsiblePanel.setOptions(this, opts);


	// If caller specified speed in terms of frames per second,
	// convert them into steps.

	if (this.fps > 0)
	{
		this.interval = Math.floor(1000 / this.fps);
		this.steps = parseInt((this.duration + (this.interval - 1)) / this.interval);
	}
	else if (this.steps > 0)
		this.interval = this.duration / this.steps;

	var c = this.content;

	var curHeight = c.offsetHeight ? c.offsetHeight : 0;
	
	if (doOpen && c.style.display == "none")
		this.fromHeight = 0;
	else
		this.fromHeight = curHeight;

	if (!doOpen)
		this.toHeight = 0;
	else
	{
		if (c.style.display == "none")
		{

			c.style.visibility = "hidden";
			c.style.display = "block";
		}

		c.style.height = "";
		this.toHeight = c.offsetHeight;

	}

	this.increment = (this.toHeight - this.fromHeight) / this.steps;
	this.overflow = c.style.overflow;

	c.style.height = this.fromHeight + "px";
	c.style.visibility = "visible";
	c.style.overflow = "hidden";
	c.style.display = "block";
};

Spry.Widget.CollapsiblePanel.PanelAnimator.prototype.start = function()
{
	var self = this;
	this.timer = setTimeout(function() { self.stepAnimation(); }, this.interval);
};

Spry.Widget.CollapsiblePanel.PanelAnimator.prototype.stop = function()
{
	if (this.timer)
	{
		clearTimeout(this.timer);

		if (this.stepCount < this.steps)
			this.content.style.overflow = this.overflow;
	}

	this.timer = null;
};

Spry.Widget.CollapsiblePanel.PanelAnimator.prototype.stepAnimation = function()
{
	++this.stepCount;

	this.animate();

	if (this.stepCount < this.steps)
		this.start();
	else if (this.onComplete)
		this.onComplete();
};

Spry.Widget.CollapsiblePanel.PanelAnimator.prototype.animate = function()
{
	if (this.stepCount >= this.steps)
	{
		if (!this.doOpen)
			this.content.style.display = "none";
		this.content.style.overflow = this.overflow;
		this.content.style.height = this.toHeight + "px";
	}
	else
	{
		this.fromHeight += this.increment;
		this.content.style.height = this.fromHeight + "px";
	}
};


  </script>
<style type="text/css">


.CollapsiblePanel {
	margin: 0px;
	padding: 0px;
	border-left: solid 1px #CCC;
	border-right: solid 1px #999;
	border-top: solid 1px #999;
	border-bottom: solid 1px #CCC;
}

.CollapsiblePanelTab {
	font: bold 0.7em sans-serif;
	background-color: #DDD;
	border-bottom: solid 1px #CCC;
	margin: 0px;
	padding: 2px;
	cursor: pointer;
	-moz-user-select: none;
	-khtml-user-select: none;
}

.CollapsiblePanelContent {
	margin: 0px;
	padding: 0px;
}

.CollapsiblePanelTab a {
	color: black;
	text-decoration: none;
}

.CollapsiblePanelOpen .CollapsiblePanelTab {
	background-color: #EEE;
}

.CollapsiblePanelTabHover,  .CollapsiblePanelOpen .CollapsiblePanelTabHover {
	background-color: #CCC;
}

.CollapsiblePanelFocused .CollapsiblePanelTab {
	background-color: #3399FF;
}

</style>
 <div style="width:90%" id="CollapsiblePanel1" class="CollapsiblePanel">
  <div class="CollapsiblePanelTab" tabindex="0">جستجوي پيشرفته</div>

  <div class="CollapsiblePanelContent"> 
<asp:Literal ID="litContent" runat="server"></asp:Literal>

   </div>
     
</div>

 <script type="text/javascript" language="javascript">
    var CollapsiblePanel1 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel1",{contentIsOpen:false}); 
    </script>
    
<table>
    <tr>
        <td style="display:none">
        <input id="txtFilterStr"  name="txtFilterStr" runat="server" type="text" />
         <input id="txtHtml" name="txtHtml" runat="server" type="text" />
        </td>
    </tr>
</table>

 <script language='javascript' type='text/javascript'>
 
 
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
 </script>