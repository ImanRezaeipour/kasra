
<!--
////////////////////////////////////////////////////
// Coalesys WebMenu Studio NN6/Moz1 DHTML script
// Build 71 COPYRIGHT 2000-2003 Coalesys, Inc.
/////////////////////////////////////////////////////
var cswmDetectedBrowser = 'Moz1DHTML';var cswmMBZ=false;var cswmCSDS=false;var cswmTI="";var cswmClkd=-1;var cswmPI=new Array();var cswmPL=new Array();var cswmPT=new Array();var cswmNH=new Array();var cswmPW=0;var cswmPH=0;var cswmSPnt="";var cswmDir="";var cswmMB=0;var cswmSI="";var cswmSE=new Object();var cswmSEL=0;var cswmSET=0;var cswmSEH=0;var cswmSEW=0;var cswmBW=0;var cswmBH=0;var cswmAR=0;var cswmAB=0;var cswmSLA=0;var cswmSTA=0;var cswmExIS=new Image();cswmExIS.src="./images/Popup.gif";var cswmExdIS=new Image();cswmExdIS.src="./images/Popup.gif";var cswmCTH=true;var cswmXOff=0;var cswmYOff=0;var cswmFP=0;var cswmSTI=0;function cswmT(ms){if(ms!="off"){if(cswmCTH!=0){cswmTI=setTimeout("cswmHP(0);",ms);}}else{clearTimeout(cswmTI);}}function cswmST(l,g,i){if(i){cswmSTI = setTimeout("cswmHP("+l+");cswmSP("+g+",'"+i+"');",350);}else if(l){cswmSTI = setTimeout("cswmHP("+l+");",350);}else{clearTimeout(cswmSTI);}}function cswmShow(id,srcid,relpos,offsetX,offsetY,fixedpos){clearTimeout(cswmTI);if(cswmClkd!=id){cswmHP(0);cswmSI=srcid;cswmSPnt=relpos;cswmClkd=id;cswmDir="right";if(document.getElementById("cswmPopup"+id)){if(offsetX)cswmXOff=offsetX;if(offsetY)cswmYOff=offsetY;if(fixedpos)cswmFP=fixedpos;if(document.getElementById('cswmMenuButton'+id)){cswmButtonClickState=true;}cswmSP(id);}}}function cswmHide(){cswmTI=setTimeout("cswmHP(0);",350);}function cswmHideNow(){cswmHP(0);}function cswmHiI(id,l){if(!document.getElementById("cswmItem"+id)){return;}var bgco;try{bgco =  document.getElementById("cswmItem"+id).getAttribute('cswmSelColor');}catch(e){bgco = false;}if(document.getElementById("cswmIcoOn"+id)){document.getElementById("cswmIcoOn"+id).style.display="inline";document.getElementById("cswmIco"+id).style.display="none";}document.getElementById("cswmItem"+id).style.color="#000000";document.getElementById("cswmExpand"+id).style.color="#000000";if(bgco){document.getElementById("cswmItem"+id).style.backgroundColor=bgco;document.getElementById("cswmExpand"+id).style.backgroundColor=bgco;}else{document.getElementById("cswmItem"+id).style.backgroundColor="#B6BDD2";document.getElementById("cswmExpand"+id).style.backgroundColor="#B6BDD2";}if(document.getElementById("cswmExpandIc"+id)){document.getElementById("cswmExpandIc"+id).src=cswmExdIS.src;}cswmNHM(id,l);cswmNH[l-1]=id;}function cswmNHM(id,l){if(cswmNH[l-1]!=id){var count=l-1;for(count=l-1;count<cswmNH.length;count++){cswmDiI(cswmNH[count]);}cswmNH.length=l;}}function cswmDiI(id,bgco){if(!document.getElementById("cswmItem"+id)){return;}var bgco;try{bgco =  document.getElementById("cswmItem"+id).getAttribute('cswmUnSelColor');}catch(e){bgco = false;}if(document.getElementById("cswmIcoOn"+id)){document.getElementById("cswmIco"+id).style.display="inline";document.getElementById("cswmIcoOn"+id).style.display="none";}document.getElementById("cswmItem"+id).style.color="#000000";document.getElementById("cswmExpand"+id).style.color="#000000";if(bgco){document.getElementById("cswmItem"+id).style.backgroundColor=bgco;document.getElementById("cswmExpand"+id).style.backgroundColor=bgco;}else{document.getElementById("cswmItem"+id).style.backgroundColor="";document.getElementById("cswmExpand"+id).style.backgroundColor="";}if(document.getElementById("cswmExpandIc"+id)){document.getElementById("cswmExpandIc"+id).src=cswmExIS.src;}}function cswmSP(id,itemid){if(!itemid){if(cswmFP){cswmSEL=cswmXOff;cswmSET=cswmYOff;cswmSEH=1;cswmSEW=1;cswmFP=0;}else{if(!document.getElementById(cswmSI)){return;}cswmSE=new Object(document.getElementById(cswmSI));cswmSEL=new Number(cswmSE.offsetLeft+cswmXOff+document.body.offsetLeft);cswmSET=new Number(cswmSE.offsetTop+cswmYOff+document.body.offsetTop);cswmSEH=cswmSE.offsetHeight;cswmSEW=cswmSE.offsetWidth;var cswmPrO=cswmSE;var cswmPrT="";if(navigator.productSub<20010726){while(cswmPrT!="BODY"){if(cswmPrO.style.position == "absolute"){cswmSET-=document.body.offsetTop+cswmPrO.offsetTop;cswmSEL-=document.body.offsetLeft+cswmPrO.offsetLeft;break;}cswmPrO=cswmPrO.parentNode;cswmPrT=cswmPrO.tagName;}}else{cswmSEL=cswmSE.offsetLeft+cswmXOff;cswmSET=cswmSE.offsetTop+cswmYOff;cswmSEH=cswmSE.offsetHeight;cswmSEW=cswmSE.offsetWidth;while(cswmPrT!="BODY"){cswmPrO=cswmPrO.offsetParent;if(cswmPrO.style.position=='absolute'){break;}cswmSEL+=cswmPrO.offsetLeft;cswmSET+=cswmPrO.offsetTop;cswmPrT=cswmPrO.tagName;}}}document.getElementById("cswmPopup"+id).style.display="inline";cswmPW=document.getElementById("cswmPopup"+id).offsetWidth;cswmPH=document.getElementById("cswmPopup"+id).offsetHeight;cswmBW=document.width;cswmBH=window.innerHeight-15;cswmSLA=window.pageXOffset;cswmSTA=window.pageYOffset;switch(cswmSPnt){case "above":cswmPL[cswmPL.length]=cswmSEL;cswmPT[cswmPT.length]=cswmSET-cswmPH;cswmCA();cswmCR();break;case "below":cswmPL[cswmPL.length]=cswmSEL;cswmPT[cswmPT.length]=cswmSET+cswmSEH;cswmCB();cswmCR();break;case "right":cswmPL[cswmPL.length]=cswmSEL+cswmSEW;cswmPT[cswmPT.length]=cswmSET;cswmCR();cswmCB();break;case "left":cswmPL[cswmPL.length]=cswmSEL-cswmPW;cswmPT[cswmPT.length]=cswmSET;cswmCL();cswmCB();cswmDir="left";break;}cswmXOff=0;cswmYOff=0;document.getElementById("cswmPopup"+id).style.left=cswmPL[cswmPL.length-1];document.getElementById("cswmPopup"+id).style.top=cswmPT[cswmPT.length-1];cswmPI[cswmPI.length]=id;}else{cswmPL[cswmPL.length]=document.getElementById("cswmPopup"+cswmPI[cswmPI.length-1]).offsetWidth+cswmPL[cswmPL.length-1]-4;if(navigator.productSub>20010725){cswmPT[cswmPT.length]=cswmPT[cswmPT.length-1];var cswmPrO=document.getElementById("cswmItem"+itemid);var cswmPrT="";while(cswmPrT!="cswmPopupBox"){cswmPT[cswmPT.length-1]+=cswmPrO.offsetTop;cswmPrO=cswmPrO.offsetParent;cswmPrT=cswmPrO.className;}}else{cswmPT[cswmPT.length]=document.getElementById("cswmItem"+itemid).offsetTop;}document.getElementById("cswmPopup"+id).style.display="inline";cswmPW=document.getElementById("cswmPopup"+id).offsetWidth;cswmPH=document.getElementById("cswmPopup"+id).offsetHeight;var cswmPrW=document.getElementById("cswmPopup"+cswmPI[cswmPI.length-1]).offsetWidth;cswmAR=cswmBW-cswmPL[cswmPL.length-1]+cswmSLA;cswmAB=cswmBH-cswmPT[cswmPT.length - 1]+cswmSTA;if(cswmPL[cswmPL.length-2]==cswmSLA){cswmDir="right";}if((cswmAR<cswmPW)||(cswmDir=="left")){cswmMB=(cswmPL[cswmPL.length-1]-cswmPW-cswmPrW)+8;if((cswmMB>=0)&&(cswmMB>cswmSLA)){cswmDir="left";}else{cswmMB=cswmSLA;}cswmPL[cswmPL.length-1]=cswmMB;}if(cswmAB<cswmPH){cswmMB=cswmPT[cswmPT.length-1]-(cswmPH-cswmAB);if(cswmMB<cswmSTA){cswmMB=cswmSTA;}cswmPT[cswmPT.length-1]=cswmMB;}document.getElementById("cswmPopup"+id).style.left=cswmPL[cswmPL.length-1];document.getElementById("cswmPopup"+id).style.top=cswmPT[cswmPT.length-1];cswmPI[cswmPI.length]=id;}}function cswmHP(level){if(cswmClkd==-1){return false;}else if(level==0){clearTimeout(cswmSTI);cswmClkd=-1;var id = cswmPI[0];var count=0;for(count=0;count<cswmNH.length;count++){cswmDiI(cswmNH[count]);}cswmNH.length=0;if(document.getElementById('cswmMenuButton'+id)){cswmButtonNormal("cswmMenuButton"+id);}cswmButtonClickState=false;}var count=level;for(count=level;count<cswmPI.length;count++){document.getElementById("cswmPopup"+cswmPI[count]).style.display="none";}cswmPI.length=level;cswmPL.length=level;cswmPT.length=level;}function cswmCR(){cswmAR=(cswmBW+cswmSLA)-cswmPL[cswmPL.length-1];if(cswmAR<cswmPW){if(cswmSPnt=="below"||cswmSPnt=="above"){cswmMB=cswmPL[cswmPL.length-1]-(cswmPW-cswmAR);if(cswmMB<0||cswmMB<cswmSLA){cswmMB=cswmSLA;}cswmPL[cswmPL.length-1]=cswmMB;}else{cswmMB=cswmSEL-cswmPW;if(cswmMB>=0){cswmPL[cswmPL.length-1]=cswmMB;}}}}function cswmCL(){if(cswmPL[cswmPL.length-1]<(cswmSLA)){cswmPL[cswmPL.length-1]=cswmSEL+cswmSEW;cswmCR();}}function cswmCB(){cswmAB=(cswmBH+cswmSTA)-cswmPT[cswmPT.length-1];if(cswmAB<cswmPH){if(cswmSPnt=="below"){cswmMB=cswmPT[cswmPT.length-1]-cswmPH-cswmSEH;if(cswmMB>=0){cswmPT[cswmPT.length-1]=cswmMB;}}else{cswmMB=cswmPT[cswmPT.length-1]-(cswmPH-cswmAB);if(cswmMB<0||cswmMB<cswmSTA){cswmMB=cswmSTA;}cswmPT[cswmPT.length-1]=cswmMB;}}}function cswmCA(){if(cswmPT[cswmPT.length-1]<(cswmSTA)){cswmPT[cswmPT.length-1]=cswmSET+cswmSEH;cswmCB();}}function cswmShowInFrame(MenuID,x,y){x+=window.pageXOffset;y+=window.pageYOffset;cswmShow(MenuID,'','below',x,y,1);}function cswmHideSelectBox(){}function cswmRefresh(){}var cswmButtonClickState=false;var cswmCurrentButtonId;function cswmButtonDown(id,gid){cswmCurrentButtonId=id;cswmButtonSunken(id);if(gid){cswmShow(gid, id, 'right', -2, 1);}}function cswmButtonSelect(id,gid){if(!cswmButtonClickState){cswmButtonRaised(id);}else{cswmButtonNormal(cswmCurrentButtonId);clearTimeout(cswmTI);cswmButtonDown(id,gid);}}function cswmButtonUnSelect(id){if(!cswmButtonClickState){cswmButtonNormal(id);}else{cswmHide();}}function cswmButtonRaised(id){var obj = document.getElementById(id).style;obj.borderTopColor = "#0A246A";obj.borderLeftColor = "#0A246A";obj.borderBottomColor = "#0A246A";obj.borderRightColor = "#0A246A";obj.backgroundColor = "#B6BDD2";obj.paddingBottom = "4px";obj.paddingTop = "4px";obj.paddingLeft = "6px";obj.paddingRight = "6px";document.getElementById(id+"Caption").style.color = "#000000";}function cswmButtonSunken(id){var obj = document.getElementById(id).style;obj.borderTopColor = "#808080";obj.borderLeftColor = "#808080";obj.borderBottomColor = "#ffffff";obj.borderRightColor = "#ffffff";obj.backgroundColor = "#d4d0c8";obj.paddingBottom = "3px";obj.paddingTop = "5px";obj.paddingLeft = "7px";obj.paddingRight = "5px";document.getElementById(id+"Caption").style.color = "#000000";}function cswmButtonNormal(id){var obj = document.getElementById(id).style;obj.borderTopColor = "#d4d0c8";obj.borderLeftColor = "#d4d0c8";obj.borderBottomColor = "#d4d0c8";obj.borderRightColor = "#d4d0c8";obj.backgroundColor = "#d4d0c8";obj.paddingBottom = "4px";obj.paddingTop = "4px";obj.paddingLeft = "6px";obj.paddingRight = "6px";document.getElementById(id+"Caption").style.color = "#000000";}function cswmMenuBarInit(){}
//-->

document.write("\r\n<!-- Coalesys WebMenu Studio -->\r\n<!-- WebMenu HTML Structure COPYRIGHT 2000-2003 Coalesys, Inc. -->\r\n<div id=\"cswmPopupFile\" class=\"cswmPopupBox\"><table background=\"./images/background.gif\" border=0 cellpadding=0 cellspacing=0><tr><td><div style=\"border-style:solid; border-width: 1px; border-color:#666666 #666666 #666666 #666666\"><div style=\"border-style:solid; border-width: 1px; border-color:#F9F8F7 #F9F8F7 #F9F8F7 #F9F8F7\"><table border=0 cellpadding=0 cellspacing=0><tr onmouseover=\"cswmT(\'off\'); cswmHiI(\'File_0\',1); cswmST(1);\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);location.href=\'default.htm\'\"><td nowrap bgcolor=\"\" id=\"cswmItemFile_0\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIcoFile_0\" src=\"./images/blank.gif\" alt=\"\" border=0 height=16 width=16></span>New</td><td bgcolor=\"\" id=\"cswmExpandFile_0\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr><tr><td onmouseover=\"cswmT(\'off\'); cswmHiI(\'File_1\',1); cswmST(1,0,\'File_1\');\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);location.href=\'default.htm\'\" nowrap bgcolor=\"\" id=\"cswmItemFile_1\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIcoFile_1\" src=\"./images/blank.gif\" alt=\"\" border=0 height=16 width=16></span>Open</td><td bgcolor=\"\" id=\"cswmExpandFile_1\" class=\"cswmExpand\" style=\"padding-right:5\" onmouseover=\"cswmT(\'off\'); cswmHiI(\'File_1\',1); cswmST(1,0,\'File_1\');\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);location.href=\'default.htm\'\"><img id=\"cswmExpandIcFile_1\" src=\"./images/Popup.gif\" width=10 height=10 alt=\"\" border=0></td></tr><tr onmouseover=\"cswmT(\'off\'); cswmHiI(\'File_2\',1); cswmST(1);\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);location.href=\'default.htm\'\"><td nowrap bgcolor=\"\" id=\"cswmItemFile_2\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIcoFile_2\" src=\"./images/blank.gif\" alt=\"\" border=0 height=16 width=16></span>Close</td><td bgcolor=\"\" id=\"cswmExpandFile_2\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr><tr onmouseover=\"cswmT(\'off\');cswmNHM(\'space\',1);\" onmouseout=\"cswmT(350)\"><td align=\"Left\" bgcolor=\"#a5a6a6\" colspan=2 height=1><img border=0 alt=\"\" src=\"./images/divider.gif\"></td></tr><tr onmouseover=\"cswmT(\'off\'); cswmHiI(\'File_4\',1); cswmST(1);\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);location.href=\'default.htm\'\"><td nowrap bgcolor=\"\" id=\"cswmItemFile_4\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIcoFile_4\" src=\"./images/icon1.gif\" alt=\"\" border=0 height=16 width=16></span>Add New Item...</td><td bgcolor=\"\" id=\"cswmExpandFile_4\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr><tr onmouseover=\"cswmT(\'off\'); cswmHiI(\'File_5\',1); cswmST(1);\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);location.href=\'default.htm\'\"><td nowrap bgcolor=\"\" id=\"cswmItemFile_5\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIcoFile_5\" src=\"./images/icon2.gif\" alt=\"\" border=0 height=16 width=16></span>Add Existing Item...</td><td bgcolor=\"\" id=\"cswmExpandFile_5\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr><tr onmouseover=\"cswmT(\'off\'); cswmHiI(\'File_6\',1); cswmST(1);\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);location.href=\'default.htm\'\"><td nowrap bgcolor=\"\" id=\"cswmItemFile_6\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIcoFile_6\" src=\"./images/blank.gif\" alt=\"\" border=0 height=16 width=16></span>Add Project</td><td bgcolor=\"\" id=\"cswmExpandFile_6\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr><tr onmouseover=\"cswmT(\'off\');cswmNHM(\'space\',1);\" onmouseout=\"cswmT(350)\"><td align=\"Left\" bgcolor=\"#a5a6a6\" colspan=2 height=1><img border=0 alt=\"\" src=\"./images/divider.gif\"></td></tr><tr onmouseover=\"cswmT(\'off\'); cswmNHM(\'File_8\',1);cswmST(1);\" onmouseout=\"cswmT(350);cswmST();\"><td nowrap bgcolor=\"\" id=\"cswmItemFile_8\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIcoFile_8\" src=\"./images/icon7.gif\" alt=\"\" border=0 height=16 width=16></span><span class=\"cswmDisabled\">Page Setup...</span></td><td bgcolor=\"\" id=\"cswmExpandFile_8\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr><tr onmouseover=\"cswmT(\'off\'); cswmHiI(\'File_9\',1); cswmST(1);\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);location.href=\'default.htm\'\"><td nowrap bgcolor=\"\" id=\"cswmItemFile_9\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIcoFile_9\" src=\"./images/blank.gif\" alt=\"\" border=0 height=16 width=16></span>Print...</td><td bgcolor=\"\" id=\"cswmExpandFile_9\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr></table></div></div></td></tr></table></div><div id=\"cswmPopup0\" class=\"cswmPopupBox\" onmouseover=\"cswmHiI(\'File_1\',1);\"><table background=\"./images/background.gif\" border=0 cellpadding=0 cellspacing=0><tr><td><div style=\"border-style:solid; border-width: 1px; border-color:#666666 #666666 #666666 #666666\"><div style=\"border-style:solid; border-width: 1px; border-color:#F9F8F7 #F9F8F7 #F9F8F7 #F9F8F7\"><table border=0 cellpadding=0 cellspacing=0><tr onmouseover=\"cswmT(\'off\'); cswmHiI(\'0_0\',2); cswmST(2);\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);location.href=\'default.htm\'\"><td nowrap bgcolor=\"\" id=\"cswmItem0_0\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIco0_0\" src=\"./images/icon3.gif\" alt=\"\" border=0 height=16 width=16></span>Project...</td><td bgcolor=\"\" id=\"cswmExpand0_0\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr><tr onmouseover=\"cswmT(\'off\'); cswmHiI(\'0_1\',2); cswmST(2);\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);location.href=\'default.htm\'\"><td nowrap bgcolor=\"\" id=\"cswmItem0_1\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIco0_1\" src=\"./images/icon4.gif\" alt=\"\" border=0 height=16 width=16></span>Project From Web...</td><td bgcolor=\"\" id=\"cswmExpand0_1\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr><tr onmouseover=\"cswmT(\'off\'); cswmHiI(\'0_2\',2); cswmST(2);\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);location.href=\'default.htm\'\"><td nowrap bgcolor=\"\" id=\"cswmItem0_2\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIco0_2\" src=\"./images/icon5.gif\" alt=\"\" border=0 height=16 width=16></span>File</td><td bgcolor=\"\" id=\"cswmExpand0_2\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr><tr onmouseover=\"cswmT(\'off\'); cswmHiI(\'0_3\',2); cswmST(2);\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);location.href=\'default.htm\'\"><td nowrap bgcolor=\"\" id=\"cswmItem0_3\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIco0_3\" src=\"./images/icon6.gif\" alt=\"\" border=0 height=16 width=16></span>File From Web...</td><td bgcolor=\"\" id=\"cswmExpand0_3\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr></table></div></div></td></tr></table></div><div id=\"cswmPopupEdit\" class=\"cswmPopupBox\"><table background=\"./images/background.gif\" border=0 cellpadding=0 cellspacing=0><tr><td><div style=\"border-style:solid; border-width: 1px; border-color:#666666 #666666 #666666 #666666\"><div style=\"border-style:solid; border-width: 1px; border-color:#F9F8F7 #F9F8F7 #F9F8F7 #F9F8F7\"><table border=0 cellpadding=0 cellspacing=0><tr onmouseover=\"cswmT(\'off\'); cswmHiI(\'Edit_0\',1); cswmST(1);\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);location.href=\'default.htm\'\"><td nowrap bgcolor=\"\" id=\"cswmItemEdit_0\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIcoEdit_0\" src=\"./images/icon12.gif\" alt=\"\" border=0 height=16 width=16></span>Cut</td><td bgcolor=\"\" id=\"cswmExpandEdit_0\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr><tr onmouseover=\"cswmT(\'off\'); cswmHiI(\'Edit_1\',1); cswmST(1);\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);location.href=\'default.htm\'\"><td nowrap bgcolor=\"\" id=\"cswmItemEdit_1\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIcoEdit_1\" src=\"./images/icon9.gif\" alt=\"\" border=0 height=16 width=16></span>Copy</td><td bgcolor=\"\" id=\"cswmExpandEdit_1\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr><tr onmouseover=\"cswmT(\'off\'); cswmNHM(\'Edit_2\',1);cswmST(1);\" onmouseout=\"cswmT(350);cswmST();\"><td nowrap bgcolor=\"\" id=\"cswmItemEdit_2\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIcoEdit_2\" src=\"./images/icon11.gif\" alt=\"\" border=0 height=16 width=16></span><span class=\"cswmDisabled\">Paste</span></td><td bgcolor=\"\" id=\"cswmExpandEdit_2\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr><tr onmouseover=\"cswmT(\'off\'); cswmHiI(\'Edit_3\',1); cswmST(1);\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);location.href=\'default.htm\'\"><td nowrap bgcolor=\"\" id=\"cswmItemEdit_3\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIcoEdit_3\" src=\"./images/icon10.gif\" alt=\"\" border=0 height=16 width=16></span>Delete</td><td bgcolor=\"\" id=\"cswmExpandEdit_3\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr></table></div></div></td></tr></table></div><div id=\"cswmPopupHelp\" class=\"cswmPopupBox\"><table background=\"./images/background.gif\" border=0 cellpadding=0 cellspacing=0><tr><td><div style=\"border-style:solid; border-width: 1px; border-color:#666666 #666666 #666666 #666666\"><div style=\"border-style:solid; border-width: 1px; border-color:#F9F8F7 #F9F8F7 #F9F8F7 #F9F8F7\"><table border=0 cellpadding=0 cellspacing=0><tr onmouseover=\"cswmT(\'off\'); cswmHiI(\'Help_0\',1); cswmST(1);\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);location.href=\'default.htm\'\"><td nowrap bgcolor=\"\" id=\"cswmItemHelp_0\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIcoHelp_0\" src=\"./images/blank.gif\" alt=\"\" border=0 height=16 width=16></span>Contents...</td><td bgcolor=\"\" id=\"cswmExpandHelp_0\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr><tr onmouseover=\"cswmT(\'off\'); cswmHiI(\'Help_1\',1); cswmST(1);\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);location.href=\'default.htm\'\"><td nowrap bgcolor=\"\" id=\"cswmItemHelp_1\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIcoHelp_1\" src=\"./images/blank.gif\" alt=\"\" border=0 height=16 width=16></span>Index...</td><td bgcolor=\"\" id=\"cswmExpandHelp_1\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr><tr onmouseover=\"cswmT(\'off\'); cswmHiI(\'Help_2\',1); cswmST(1);\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);location.href=\'default.htm\'\"><td nowrap bgcolor=\"\" id=\"cswmItemHelp_2\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIcoHelp_2\" src=\"./images/blank.gif\" alt=\"\" border=0 height=16 width=16></span>Search...</td><td bgcolor=\"\" id=\"cswmExpandHelp_2\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr><tr onmouseover=\"cswmT(\'off\');cswmNHM(\'space\',1);\" onmouseout=\"cswmT(350)\"><td align=\"Left\" bgcolor=\"#a5a6a6\" colspan=2 height=1><img border=0 alt=\"\" src=\"./images/divider.gif\"></td></tr><tr onmouseover=\"cswmT(\'off\'); cswmHiI(\'Help_4\',1); cswmST(1);\" onmouseout=\"cswmT(350);cswmST();\" onClick=\"cswmHP(0);var Icon=document.getElementById(\'cswmIcoHelp_4\');alert(\'WebMenu Technology is developed by Coalesys, Inc.\');\"><td nowrap bgcolor=\"\" id=\"cswmItemHelp_4\" class=\"cswmItem\"><span style=\"padding-right:12\"><img align=\"absmiddle\" id=\"cswmIcoHelp_4\" src=\"./images/blank.gif\" alt=\"\" border=0 height=16 width=16></span>About</td><td bgcolor=\"\" id=\"cswmExpandHelp_4\" class=\"cswmExpand\"><img src=\"./images/ClearPixel.gif\" width=1 height=1 alt=\"\" border=0></td></tr></table></div></div></td></tr></table></div><table class=\"cswmButtons\" id=\"cswmButtons\" cellspacing=0 cellpadding=0 border=0><tr><td><table class=\"cswmInnerBorder\" cellspacing=0 cellpadding=0 border=0><tr><td><div id=\"cswmMenuButtonFile\" class=\"cswmButton\" onmouseover=\"cswmButtonSelect(this.id, \'File\')\" onmouseout=\"cswmButtonUnSelect(this.id)\" onmousedown=\"cswmButtonDown(this.id, \'File\');\"><table width=\"100%\" border=0 cellpadding=0 cellspacing=0><tr><td width=\"100%\" class=\"cswmButtonFont\" id=\"cswmMenuButtonFileCaption\">File</td></tr></table></div><div id=\"cswmMenuButtonEdit\" class=\"cswmButton\" onmouseover=\"cswmButtonSelect(this.id, \'Edit\')\" onmouseout=\"cswmButtonUnSelect(this.id)\" onmousedown=\"cswmButtonDown(this.id, \'Edit\');\"><table width=\"100%\" border=0 cellpadding=0 cellspacing=0><tr><td width=\"100%\" class=\"cswmButtonFont\" id=\"cswmMenuButtonEditCaption\">Edit</td></tr></table></div><div id=\"cswmMenuButtonHelp\" class=\"cswmButton\" onmouseover=\"cswmButtonSelect(this.id, \'Help\')\" onmouseout=\"cswmButtonUnSelect(this.id)\" onmousedown=\"cswmButtonDown(this.id, \'Help\');\"><table width=\"100%\" border=0 cellpadding=0 cellspacing=0><tr><td width=\"100%\" class=\"cswmButtonFont\" id=\"cswmMenuButtonHelpCaption\">Help</td></tr></table></div></td></tr></table></td></tr></table>\r\n<!-- End WebMenu HTML -->\r\n\r\n");