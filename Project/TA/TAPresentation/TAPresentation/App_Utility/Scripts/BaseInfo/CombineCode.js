var LastSelectedRow=null;var LastSelectedRowClass="";Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);function BeginRequestHandler(b,a){document.getElementById("OToolBar_ProgressBar").style.visibility="visible"}function EndRequestHandler(c,b){document.getElementById("OToolBar_ProgressBar").style.visibility="hidden";LastSelectedRow=null;var a=$get(MasterObj+"txtSubmit").value;if($get(MasterObj+"txtAlert").value!=""){if($get(MasterObj+"txtValidate").value=="0"){alert($get(MasterObj+"txtAlert").value);returnValue=0}else{SetMsg($get(MasterObj+"txtAlert").value);returnValue=1}}$get(MasterObj+"txtSubmit").value="";$get(MasterObj+"txtAlert").value="";$get(MasterObj+"txtValidate").value="";if(a!=""){if($get(MasterObj+"lblTo").value==""){document.getElementById("OToolBar_txtFromData").value="";document.getElementById("OToolBar_txtToData").value="";document.getElementById("OToolBar_txtTotalData").value="";document.getElementById("OToolBar_BtnNext").disabled=true;document.getElementById("OToolBar_BtnPrv").disabled=true;document.getElementById("OToolBar_BtnFirst").disabled=true;document.getElementById("OToolBar_BtnLast").disabled=true}else{if($get(MasterObj+"lblTo").value!=""){document.getElementById("OToolBar_txtFromData").value=$get(MasterObj+"lblFrom").value;document.getElementById("OToolBar_txtToData").value=$get(MasterObj+"lblTo").value;document.getElementById("OToolBar_txtTotalData").value=$get(MasterObj+"lblTotal").value;document.getElementById("OToolBar_txtCurPage").value=$get(MasterObj+"txtCurPage").value;document.getElementById("OToolBar_txtTotalPage").value=$get(MasterObj+"Totalpage").value;if(parseInt(document.getElementById("OToolBar_txtCurPage").value)==parseInt(document.getElementById("OToolBar_txtTotalPage").value)){document.getElementById("OToolBar_BtnNext").disabled=true}else{document.getElementById("OToolBar_BtnNext").disabled=false}if(parseInt($get(MasterObj+"lblFrom").value)==1){document.getElementById("OToolBar_BtnPrv").disabled=true}else{document.getElementById("OToolBar_BtnPrv").disabled=false}document.getElementById("OToolBar_BtnFirst").disabled=false;document.getElementById("OToolBar_BtnLast").disabled=false}}}}document.getElementById("OToolBar_BtnPrv").disabled=true;document.getElementById("OToolBar_txtFromData").value=$get(MasterObj+"lblFrom").value;document.getElementById("OToolBar_txtToData").value=$get(MasterObj+"lblTo").value;document.getElementById("OToolBar_txtTotalData").value=$get(MasterObj+"lblTotal").value;document.getElementById("OToolBar_txtCurPage").value=$get(MasterObj+"txtCurPage").value;document.getElementById("OToolBar_txtTotalPage").value=$get(MasterObj+"Totalpage").value;if(parseInt(document.getElementById("OToolBar_txtCurPage").value)==parseInt(document.getElementById("OToolBar_txtTotalPage").value)){document.getElementById("OToolBar_BtnNext").disabled=true}else{document.getElementById("OToolBar_BtnNext").disabled=false}function OnClickBtnNext(){document.getElementById(MasterObj+"txtSubmit").value="BtnNext";document.getElementById(MasterObj+"BtnSubmit").click()}function OnClickBtnPrv(){document.getElementById(MasterObj+"txtSubmit").value="BtnPrv";document.getElementById(MasterObj+"BtnSubmit").click()}function OnBlurtxtCurPage(){document.getElementById("OToolBar_txtCurPage").value=document.getElementById("OToolBar_txtCurPage").value.replace(" ","");var a=parseInt(document.getElementById("OToolBar_txtTotalPage").value);if(document.getElementById("OToolBar_txtCurPage").value!=""&&document.getElementById("OToolBar_txtCurPage").value!="0"){if(parseInt(document.getElementById("OToolBar_txtCurPage").value)<=parseInt(a)){document.getElementById(MasterObj+"txtCurPage").value=document.getElementById("OToolBar_txtCurPage").value}document.getElementById(MasterObj+"txtSubmit").value="Const";document.getElementById(MasterObj+"BtnSubmit").click()}}function OnClickBtnLast(){document.getElementById(MasterObj+"txtSubmit").value="BtnLast";document.getElementById(MasterObj+"BtnSubmit").click()}function OnClickBtnFirst(){document.getElementById(MasterObj+"txtSubmit").value="BtnFirst";document.getElementById(MasterObj+"BtnSubmit").click()}function OnClickBtnFilter(){$get(MasterObj+"txtGroupCode1Search").value=$get(MasterObj+"cmbGroupCode1_txtCode").value;$get(MasterObj+"txtGroupCode2Search").value=$get(MasterObj+"cmbGroupCode2_txtCode").value;$get(MasterObj+"txtResultCodeSearch").value=$get(MasterObj+"cmbResultCode_txtCode").value;$get(MasterObj+"txtSubmit").value="Filter";$get(MasterObj+"BtnSubmit").click()}function OnClickGrd(a){if(LastSelectedRow!=null){LastSelectedRow.className=LastSelectedRowClass}LastSelectedRowClass=a.className;LastSelectedRow=a;a.className="CssSelectedItemStyle"}function OndbClickGrd(){var b="";if(LastSelectedRow.cells(5).firstChild.title==""){b=LastSelectedRow.cells(5).innerText}else{b=LastSelectedRow.cells(5).firstChild.title}var c="CombineCodeNew.aspx?GroupCode1="+LastSelectedRow.GroupCode1+"&GroupCode2="+LastSelectedRow.GroupCode2+"&ResultCode="+LastSelectedRow.ResultCode+"&DayState="+LastSelectedRow.DayState+"&Desc="+b+"&ToPersonId="+$get(MasterObj+"txtOnLineUser").value+"&SessionID="+$get(MasterObj+"txtSessionID").value+"&ID="+LastSelectedRow.getAttribute("ID");if(LastSelectedRow.System==0){c+="&System=0"}else{c+="&System=1"}c=encodeURI(c);var a=window.showModalDialog(c,"","dialogHeight:300px;dialogWidth: 800px;center: Yes;help: no;status: no");if(a==1){$get(MasterObj+"txtSubmit").value="Filter";$get(MasterObj+"BtnSubmit").click()}}function OnClickBtnDel(){if(LastSelectedRow!=null){if(LastSelectedRow.System==0){var a="آيا براي حذف مطمئنيد؟";if(confirm(a)==true){$get(MasterObj+"txtGroupCode1").value=LastSelectedRow.GroupCode1;$get(MasterObj+"txtGroupCode2").value=LastSelectedRow.GroupCode2;$get(MasterObj+"txtResultCode").value=LastSelectedRow.ResultCode;$get(MasterObj+"txtDayState").value=LastSelectedRow.DayState;$get(MasterObj+"txtSubmit").value="Delete";$get(MasterObj+"BtnSubmit").click()}}else{alert("ترکیب کدهای سيستمي را نمی توانید حذف کنید")}}else{alert("به منظور حذف يک سطر را انتخاب کنيد")}}function OnClickBtnNew(){var b="CombineCodeNew.aspx?ToPersonId="+$get(MasterObj+"txtOnLineUser").value+"&SessionID="+$get(MasterObj+"txtSessionID").value+"&ID=0";var a=window.showModalDialog(b,"","dialogHeight:300px;dialogWidth: 800px;center: Yes;help: no;status: no");if(a==1){$get(MasterObj+"txtSubmit").value="Filter";$get(MasterObj+"BtnSubmit").click()}}function OnClickBtnShowAll(){OnClickBtnClear();OnClickBtnFilter()}function OnClickBtnClear(){$get(MasterObj+"chkUser").checked=false;$get(MasterObj+"chkSystem").checked=false;$get(MasterObj+"cmbDayState").value=0;$get(MasterObj+"cmbGroupCode1_txtCode").value="";$get(MasterObj+"cmbGroupCode2_txtCode").value="";$get(MasterObj+"cmbResultCode_txtCode").value="";$get(MasterObj+"cmbGroupCode1_txtName").value="";$get(MasterObj+"cmbGroupCode2_txtName").value="";$get(MasterObj+"cmbResultCode_txtName").value=""}function OnClickBtnEdit(){if(LastSelectedRow!=null){OndbClickGrd()}else{alert("به منظور ويرايش یک سطر را انتخاب کنید")}};