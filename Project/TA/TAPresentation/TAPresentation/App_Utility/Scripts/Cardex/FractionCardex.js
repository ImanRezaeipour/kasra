var LastSelectedRow=null,LastSelectedRowClass="";Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);function BeginRequestHandler(b,a){document.getElementById("OToolBar_ProgressBar").style.visibility="visible"}function EndRequestHandler(c,b){document.getElementById("OToolBar_ProgressBar").style.visibility="hidden";var a=$get(MasterObj+"txtSubmit").value;LastSelectedRow=null;if(a=="Delete"){if($get(MasterObj+"txtValidate").value=="1"){SetMsg($get(MasterObj+"txtAlert").value)}else{alert($get(MasterObj+"txtAlert").value)}}$get(MasterObj+"txtAlert").value="";$get(MasterObj+"txtSubmit").value=""}function OnBlurtxtCurPage(a){if(a.value!=0&&a.value.replace(" ","")!=""){document.getElementById(MasterObj+"txtCurPage").value=a.value;document.getElementById(MasterObj+"txtSubmit").value="Const";document.getElementById(MasterObj+"BtnSubmit").click()}}function OnClickBtnNext(){document.getElementById(MasterObj+"txtSubmit").value="BtnNext";document.getElementById(MasterObj+"BtnSubmit").click()}function OnClickBtnLast(){document.getElementById(MasterObj+"txtSubmit").value="BtnLast";document.getElementById(MasterObj+"BtnSubmit").click()}function OnClickBtnPrv(){document.getElementById(MasterObj+"txtSubmit").value="BtnPrev";document.getElementById(MasterObj+"BtnSubmit").click()}function OnClickBtnFirst(){document.getElementById(MasterObj+"txtSubmit").value="BtnFirst";document.getElementById(MasterObj+"BtnSubmit").click()}function OnClickGrd(a){if(LastSelectedRow!=null){LastSelectedRow.className=LastSelectedRowClass}LastSelectedRowClass=a.className;LastSelectedRow=a;a.className="CssSelectedItemStyle"}function OnClickBtnFilter(){$get(MasterObj+"txtPCode").value=$get(MasterObj+"CmbPerson_txtCode").value;$get(MasterObj+"txtCardexPeriod").value=$get(MasterObj+"CmbCardexPeriod").value;$get(MasterObj+"txtCardexCode").value=$get(MasterObj+"CmbCardexCode").value;$get(MasterObj+"txtFromPeriod").value=$get(MasterObj+"CmbFromPeriod").value;$get(MasterObj+"txtToPeriod").value=$get(MasterObj+"CmbToPeriod").value;$get(MasterObj+"txtSubmit").value="Filter";$get(MasterObj+"BtnSubmit").click()}function OnClickBtnShowAll(){$get(MasterObj+"txtPCode").value="";$get(MasterObj+"CmbPerson_txtCode").value="";$get(MasterObj+"CmbPerson_txtPCode").value="";$get(MasterObj+"CmbPerson_txtName").value="";$get(MasterObj+"txtCardexPeriod").value="";$get(MasterObj+"CmbCardexPeriod").value="0";$get(MasterObj+"CmbFromPeriod").selectedIndex="0";$get(MasterObj+"txtFromPeriod").value=$get(MasterObj+"CmbFromPeriod").selectedIndex;$get(MasterObj+"CmbToPeriod").selectedIndex="0";$get(MasterObj+"txtToPeriod").value=$get(MasterObj+"CmbToPeriod").selectedIndex;$get(MasterObj+"CmbCardexCode").selectedIndex="0";$get(MasterObj+"txtCardexCode").value="";$get(MasterObj+"txtSubmit").value="Filter";$get(MasterObj+"BtnSubmit").click()}function OnClickBtnNew(){var b="RequestFractionCardex.aspx?ToPersonId="+$get(MasterObj+"txtOnLineUser").value+"&SessionID="+$get(MasterObj+"txtSessionID").value;b=encodeURI(b);var a=window.showModalDialog(b,"","dialogHeight: 300px;dialogWidth:700px;center: Yes;help: no;status: no");if(a==1){OnClickBtnFilter()}}function OnDblClickGrd(){OnClickBtnEdit()}function OnClickBtnEdit(){if(LastSelectedRow!=null){var b="RequestFractionCardex.aspx?ToPersonId="+$get(MasterObj+"txtOnLineUser").value+"&SessionID="+$get(MasterObj+"txtSessionID").value+"&PCode="+LastSelectedRow.cells(1).innerText+"&GrantCode="+LastSelectedRow.getAttribute("GrantCode")+"&GrantWP="+LastSelectedRow.getAttribute("GrantWP")+"&GrantValue="+LastSelectedRow.cells(6).innerText+"&Type="+LastSelectedRow.getAttribute("Type")+"&Descr="+LastSelectedRow.cells(7).innerText+"&ID="+LastSelectedRow.getAttribute("ID")+"&CardexPeriodID="+LastSelectedRow.getAttribute("CardexPeriodID");b=encodeURI(b);var a=window.showModalDialog(b,"","dialogHeight: 300px;dialogWidth:700px;center: Yes;help: no;status: no");if(a==1){OnClickBtnFilter()}}else{alert("لطفا يک سطر از گريد انتخاب کنيد")}}function OnClickBtnDel(){if(LastSelectedRow!=null){if(confirm("آيا براي حذف مطمئنيد؟")){$get(MasterObj+"txtStaticCodeValueID").value=LastSelectedRow.getAttribute("ID");$get(MasterObj+"txtPCodeDel").value=LastSelectedRow.cells(1).innerText;$get(MasterObj+"txtPeriod").value=LastSelectedRow.getAttribute("GrantWP");$get(MasterObj+"txtSubmit").value="Delete";$get(MasterObj+"BtnSubmit").click()}}else{alert("لطفا يک سطر از گريد انتخاب کنيد")}}function OnClickImgFlow(d){var a=window.event.srcElement.parentElement;while(a.tagName!="TR"){a=a.parentElement}var c=a.getAttribute("ID");var e=a.getAttribute("WFDocId");var b=a.getAttribute("DocTypeID");if(b==0&&e!=0){window.showModalDialog("/FrameWork/Pages/WorkFlow/CardTable/FlowDoc.aspx?WFDocId="+e+"&DocId="+c,"","dialogHeight: 450px;dialogWidth: 990px;center: Yes;help: no;status: no")}else{window.showModalDialog("/FrmPresentation/App_Pages/BaseInfo/WorkFlow/DocFlow.aspx?DocTypeID="+b+"&DocID="+c,"","dialogHeight: 450px;dialogWidth: 1400px;center: Yes;help: no;status: no")}};