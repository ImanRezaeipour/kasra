//=======================================ALERT BOX============================================================
//Create MessageDialog with Custom Style,Button,Message
//By:BahareGhadamy			Date:1387/01/20
//============================================================================================================

//============================================================================================================
var stateNode;
var aML=new Array();
aML["offsetTop"]=new MeasurementAndLocation("parentElement.offsetTop",".offsetTop - 1",".pixelLeft + 5");
aML["offsetWidth"]=new MeasurementAndLocation("parentElement.offsetTop + 1",".offsetTop - 1",".pixelLeft + 5");
var oPoint;
var bAnim=false;
var oActiveSel="";
var iLastIndex;
var objSrcEvent

	//============================================================================================================
	function CloseMessageBox() 
	{
		document.getElementById(stateNode).parentNode.removeChild(document.getElementById(stateNode));
		enabledInputElements()
	}
	//============================================================================================================
	function disabledInputElements()
	{
//		var nodes = document.getElementsByTagName('input')
//		for (var i = 0; i<nodes.length; i++) 
//				nodes[i].disabled=true;
	}
	//============================================================================================================
	function enabledInputElements()
	{
//		var nodes = document.getElementsByTagName('input')
//		for (var i = 0; i<nodes.length; i++) 
//				nodes[i].disabled=false;
	}
//============================================================================================================

	//Moving Message Box*******************************************************************************************

		
	function MeasurementAndLocation(oParentMeasure,oElementMeasure,oPosition){
		this.parentMeasure=oParentMeasure;
		this.elementMeasure=oElementMeasure;
		this.changePosition=oPosition;
	}
	function fnInit(){
		shadowMessage.isMoving=false;
		oPoint=shadowMessage;
	}
	function fxCalcPoints(oSel) {
	alert(1)
		if(bAnim==true){
			fxStopAnim();
		}
		var sValue=oSel.options[oSel.selectedIndex].value;
		fxSetData(1,"","");				
		fxSetData(2,"","");					
		if(sValue!=""){
			oActiveSel=oSel;
			iLastIndex=oSel.selectedIndex;		
			var aData=sValue.split(",");
			oLongitude.style.display="block";
			oLatitude.style.display="block";
			var iAdjustHeight=(oLongitude.offsetHeight - oLonMeasure.offsetHeight);
			var iAdjustWidth=(oLatitude.offsetWidth - oLatMeasure.offsetWidth);
			// measure height and width
			var sNote="";
			if(aData[0]=="1"){
				var iHeight=parseInt(eval("oPoint." + aData[1]));
				if(iHeight>0){
					oLongitude.style.top=eval("oPoint." + aData[3]);
					oLongitude.style.left=eval("oPoint." + aData[4]) + oPoint.offsetHeight/2;
					oLonMeasure.style.height=iHeight - iAdjustHeight;
					fxSetData(1,aData[1],iHeight);				
				}
				else{
					oLongitude.style.display="none";
				}
				var iWidth=parseInt(eval("oPoint." + aData[2]));
				if(iWidth>0){
					oLatitude.style.top=eval("oPoint." + aData[3]) + oPoint.offsetWidth/2;
					oLatitude.style.left=eval("oPoint." + aData[4]);
					oLatMeasure.style.width=iWidth - iAdjustWidth;
					fxSetData(2,aData[2],iWidth);					
				}
				else{
					oLatitude.style.display="none";
				}
				sNote+="Drawing markers for " + aData[1] + " and " + aData[2] + " properties.<BR>";
			}
			if(aData[0]=="2"){
				var iHeight=parseInt(eval("oPoint." + aData[1]));
				if(iHeight>0){		
					oLongitude.style.top=eval("oPoint." + aData[3]);
					oLongitude.style.left=eval("oPoint." + aData[2]);
					oLonMeasure.style.height=iHeight - iAdjustHeight;
					fxSetData(1,aData[1],iHeight);		
				}
				else{
					oLongitude.style.display="none";
				}
				var iWidth=parseInt(eval("oPoint." + aData[2]));
				if(iWidth>0){			
					oLatitude.style.top=eval("oPoint." + aData[1]);
					oLatitude.style.left=eval("oPoint." + aData[4]);
					oLatMeasure.style.width=iWidth - iAdjustWidth;
					fxSetData(2,aData[2],iWidth);								
				}
				else{
					oLatitude.style.display="none";
				}
				sNote+="Drawing markers for " + aData[1] + " and " + aData[2] + " properties.<BR>";						
			}
			if(aData[0]=="3"){
				fxSetData(1,aData[1],eval("oPoint." + aData[1]));		
				fxSetData(2,aData[2],eval("oPoint." + aData[2]));		
				oLongitude.style.top=eval("oPoint." + aData[3]) + oPoint.offsetTop;
				oLongitude.style.left=eval("oPoint." + aData[4]) + oPoint.offsetLeft;
				oLonMeasure.style.height=eval("oPoint." + aData[1]) - iAdjustHeight;
				oLatitude.style.top=eval("oPoint." + aData[3]) + oPoint.offsetTop;
				oLatitude.style.left=eval("oPoint." + aData[4]) + oPoint.offsetLeft;
				oLatMeasure.style.width=eval("oPoint." + aData[2]) - iAdjustWidth;
				sNote+="Drawing markers for " + aData[1] + " and " + aData[2] + " properties.<BR>";						
			}
			if(aData[0]=="4"){
				var iHeight=eval("oPoint." + aData[1]);
				sNote+="Drawing markers for " + aData[1] + " and " + aData[2] + " properties.<BR>";			
				if(iHeight>0){
					oLongitude.style.top=eval("oPoint." + aData[3]) - iHeight + oPoint.clientTop;
					oLongitude.style.left=eval("oPoint." + aData[4]) + oPoint.clientLeft;
					oLonMeasure.style.height=iHeight - iAdjustHeight;
					fxSetData(1,aData[1],iHeight);						
				}
				else{
					if(aData[1].indexOf("scroll")>-1){
						sNote+="Cannot display marker for scrollTop property when the value is zero.<BR>";
					}			
					oLongitude.style.display="none";
				}
				var iWidth=eval("oPoint." + aData[2]);
				if(iWidth>0){
					oLatitude.style.top=eval("oPoint." + aData[3]) + oPoint.clientTop;
					oLatitude.style.left=eval("oPoint." + aData[4]) - iWidth + oPoint.clientLeft;
					oLatMeasure.style.width=iWidth - iAdjustWidth;
					fxSetData(2,aData[2],iWidth);					
				}
				else{
					if(aData[1].indexOf("scroll")>-1){
						sNote+="Cannot display marker for scrollLeft property when the value is zero.<BR>";
					}					
					oLatitude.style.display="none";
				}
			}
			if(sNote!=""){
				parent.fnSetNote(sNote);
			}
			else{
				parent.fnRandomTip();
			}
			oSel.selectedIndex=0;
			// measure top and left
		}	
		else{
			oActiveSel="";
			oLatitude.style.display="none";
			oLongitude.style.display="none";
		}
	}
	function fxSetData(iType,sProp,sVal){
		if(iType==1){
			parent.oMPN1.innerText=sProp;
			parent.oMPV1.innerText=sVal;
		}
		if(iType==2){
			parent.oMPN2.innerText=sProp;
			parent.oMPV2.innerText=sVal;
		}
		
	}
	function fxPoint(){
		if(event.srcElement.tagName!="SELECT"){
			oPoint=event.srcElement;
			oLab1.innerText="Point 1: " + oPoint.tagName;
		}
	}
	function fxTrapSelect(){
		event.returnValue=false;
	}
	function fxSetCapture(){
		oPoint.setCapture(true);
		oPoint.dx=event.clientX - oPoint.offsetLeft;
		oPoint.dy=event.clientY - oPoint.offsetTop;
		oPoint.isMoving=true;
		if(oActiveSel){
			oLatitude.style.display="none";
			oLongitude.style.display="none";
		}
	}
	function fxMove(){
		if(oPoint.isMoving){
			var iNewX=event.x - oPoint.dx;
			var iNewY=event.y - oPoint.dy;
			if((iNewX>=0)&&(iNewX + oPoint.offsetWidth<=document.body.clientWidth)){
				oPoint.style.left=iNewX;
			}
			if((iNewY>=0)&&(iNewY + oPoint.offsetHeight<=document.body.clientHeight)){
				oPoint.style.top=iNewY;
			}
		}
	}
	function fxReleaseCapture(){
		if(oActiveSel){
			oActiveSel.selectedIndex=iLastIndex;
			fxCalcPoints(oActiveSel);
		}
		document.releaseCapture();
		oPoint.isMoving=false;
	}
