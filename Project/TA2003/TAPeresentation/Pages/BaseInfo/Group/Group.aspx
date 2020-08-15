<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Group.aspx.vb" Inherits="TA.Group"
    ValidateRequest="false" %>

<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../../../Includes/Calendar/TextDate.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html dir="rtl">
<head>
    <title>--------------------------------------------------------------تعريف گروه-----------------------------------------------------------------------------
    </title>

    <!--test-->
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../../../Includes/Styles/StyleLib.css" type="text/css" rel="stylesheet">
    <link href="../../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="../../../../Includes/Script/General.js"></script>
    <script language="javascript" src="../../Person/General.js"></script>
    <script language="javascript" src="../../../../Includes/Script/WaitShow.js"></script>
    <script language="javascript">
        //test

        var oRequst = new ActiveXObject("Microsoft.XMLHTTP");
        var lastPersonid;
        /****************************************************************/
        function onblurCurPage() {
            if ((parseInt(Form1.CurPage.value) >= 1) && (parseInt(Form1.CurPage.value) < parseInt(Form1.Totalpage1.value))) {
                Form1.txtSubmit.value = "Const";
                Form1.submit();
            }
        }
        /****************************************************************/
        function onblurPersonId() {
//            if (Form1.PersonId.value == "") {
//                Form1.cmbPersonName.value = "";
//                lastPersonid = "";
//            }
//            else {
//                if (Form1.PersonId.value != lastPersonid) {
//                    lastPersonid = Form1.PersonId.value;
//                    onClickImgRefresh();
//                }
            //            }
            if (Form1.PersonId.value == "") Form1.cmbPersonName.value = "0"
            else Form1.cmbPersonName.value = Form1.PersonId.value
        }
        /****************************************************************/
        function onchangecmbPersonName() {
            if (Form1.cmbPersonName.value == "0") Form1.PersonId.value = ""
            else Form1.PersonId.value = Form1.cmbPersonName.value
        }
        /****************************************************************/
        function onClickImgRefresh() {
            if (document.getElementById("PersonId").value != "") {
                var PersonId = document.getElementById("PersonId").value;
                oRequst.open("post", "Group.aspx?AjaxSend=Ajax &PersonID=" + parseInt(PersonId), false);
                oRequst.onreadyStateChange = AjaxFunction;
                oRequst.send(null);
            } 
        }
        /****************************************************************/
        function AjaxFunction() {
            if (oRequst.readyState == 4)
                if (oRequst.status == 200)
                    Form1.cmbPersonName.value = oRequst.responseText;
        }
        /****************************************************************/
        var LastSelectedRowgrd = null;
        var LastSelectedRowClassgrd = "";

        function f1() {
            onmouseoverBody(grdGroup);
        }
        /****************************************************************/
        function f2() {
            onmouseoutBody(grdGroup);
        }
        /****************************************************************/
        function onLoad() {
            lastPersonid = Form1.PersonId.value;
            if (Form1.Active.value == 'DownRow') {
                if (Form1.GroupId.value > 0) {
                    var Sd = document.getElementById("txtSDate").value;
                    Form1.StartDate_txtDay.value = Sd.substr(6, 2);
                    Form1.StartDate_txtMonth.value = Sd.substr(3, 2);
                    Form1.StartDate_txtYear.value = '13' + Sd.substr(0, 2);
                    var Ed = document.getElementById("txtEDate").value;
                    Form1.EndDate_txtDay.value = Ed.substr(6, 2);
                    Form1.EndDate_txtMonth.value = Ed.substr(3, 2);
                    Form1.EndDate_txtYear.value = '13' + Ed.substr(0, 2);
                    ViewDownRow();
                }
                else
                    ViewTopRow();
            }
            else
                ViewTopRow(); //			document.body.attachEvent("onmouseover",f1)
            //			document.body.attachEvent("onmouseout",f2)
            fnStopInterval();
            document.all.item("TdMsg").style.display = "none";
            window.name = "Group";
            Form1.target = window.name;
            if (Form1.txtModalflag.value == "11") {
                document.all.item('btnTOPCancel').style.display = 'inline';
            }
            if (Form1.txtMsg.value != "") {
                if (Form1.txtMsg.value == "display") {
                    Form1.txtMsg.value = "";
                    url = "ModalGroup.aspx?";
                    rr = window.showModalDialog(url, window, "dialogHeight: 500px;dialogWidth: 520px;center: Yes;help: no;status: no");
                    if (rr == "1") {
                        Form1.txtSubmit.value = "OKDate";
                        Form1.submit();
                    } 
                }
                else {
                    alert(Form1.txtMsg.value);
                }
                Form1.txtMsg.value = "";
            } 
        }
        function ViewTopRow() {
            document.all.item('TopRow').style.display = 'inline';
            document.all.item('DownRow').style.display = 'none';
            Form1.Active.value = 'TopRow';
        }
        function ViewDownRow() {
            document.all.item('DownRow').style.display = 'inline';
            document.all.item('TopRow').style.display = 'none';
            RefreshFrame();
            Form1.Active.value = 'DownRow';
        }
        function onClickbtnNew() {
            ClearAll();
            ViewDownRow();
        }
        function onclickgrd(selectedRow) {
            if (LastSelectedRowgrd != null) {
                LastSelectedRowgrd.className = LastSelectedRowClassgrd;
            }
            LastSelectedRowClassgrd = selectedRow.className;
            LastSelectedRowgrd = selectedRow;
            selectedRow.className = "CssSelectedItemStyle";
            LoadData(selectedRow);
        }
        function LoadData(selectedRow) {
            Form1.GroupId.value = selectedRow.GroupId;
            Form1.Name.value = selectedRow.cells(0).innerText;
            Form1.Acronym.value = selectedRow.cells(1).innerText;
            Form1.cmbCategory.value = selectedRow.CategoryId;
            if (selectedRow.flags == 1) {
                Form1.rdbNoShift.checked = false;
                Form1.rdbShift.checked = true;
            }
            else {
                Form1.rdbNoShift.checked = true;
                Form1.rdbShift.checked = false;
            }
            if (selectedRow.Active == "1")
                Form1.RbActive.checked = true;
            else
                Form1.RbDeactive.checked = true;
            var Sd = selectedRow.StartDate;
            Form1.StartDate_txtDay.value = Sd.substr(0, 2);
            Form1.StartDate_txtMonth.value = Sd.substr(3, 2);
            Form1.StartDate_txtYear.value = '13' + Sd.substr(8, 2);
            var Ed = selectedRow.EndDate;
            Form1.EndDate_txtDay.value = Ed.substr(0, 2);
            Form1.EndDate_txtMonth.value = Ed.substr(3, 2);
            Form1.EndDate_txtYear.value = '13' + Ed.substr(8, 2);
        }
        function ondblclickgrd() {
            ViewDownRow();
        }
        function ClearAll() {
            Form1.GroupId.value = "0";
            Form1.Name.value = "";
            Form1.Acronym.value = "";
            Form1.cmbCategory.value = "0";
            Form1.rdbNoShift.checked = true;
            Form1.rdbShift.checked = false;
            var d = Form1.txtCurDate.value;
            Form1.StartDate_txtDay.value = '01';
            Form1.StartDate_txtMonth.value = '01';
            Form1.StartDate_txtYear.value = '1301';
            Form1.EndDate_txtDay.value = '29';
            Form1.EndDate_txtMonth.value = '12';
            Form1.EndDate_txtYear.value = '1399';
            Form1.RbActive.checked = true;
            Form1.RbDeactive.checked = false;
            Form1.txtXMLMember.value = "";
        }
        function onClickbtnEdit() {
            if (LastSelectedRowgrd == null) {
                alert('لطفا سطر مورد نظر را انتخاب کنيد');
                return;
            }
            if (Form1.GroupId.value != "0") {
                ViewDownRow();
            }
            else
                alert("ابتدا يک سطر انتخاب نماييد");
        }
        function onClickbtnDownNew() {
            ClearAll();
            RefreshFrame();
        }
        function onClickbtnCancel() {
            ViewTopRow();
        }
        function MakeXML() {
            var str = "<GroupEntity><Group>";
            str += "<GroupId>" + Form1.GroupId.value + "</GroupId>";
            str += "<Name>" + Form1.Name.value + "</Name>";
            str += "<Acronym>" + Form1.Acronym.value + "</Acronym>";
            str += "<CategoryId>" + Form1.cmbCategory.value + "</CategoryId>";
            str += "<StartDate>" + Form1.StartDate_txtYear.value + "/" + Form1.StartDate_txtMonth.value + "/" + Form1.StartDate_txtDay.value + "</StartDate>";
            str += "<EndDate>" + Form1.EndDate_txtYear.value + "/" + Form1.EndDate_txtMonth.value + "/" + Form1.EndDate_txtDay.value + "</EndDate>";
            str += "<Active>" + ((Form1.RbActive.checked == true) ? 1 : 0) + "</Active>";
            str += "<flags>" + ((Form1.rdbShift.checked == true) ? 1 : 0) + "</flags>";
            str += "</Group></GroupEntity>";
            Form1.txtGroupXML.value = str;
        }
        function onClickbtnSave() {
            if (CheckNotEmptyData() == true) {
                fnStartInterval();
                document.all.item("TdMsg").style.display = "inline";
                MakeXML();
                Form1.txtModifyXML.value = window.frames('FGroupMember').document.all.item('txtModifyXML').value;
                //alert(Form1.txtModifyXML.value.length)
                if (Form1.txtModifyXML.value == "")
                    Form1.txtModifyXML.value = "<GroupEntity><EmployeeGroup></EmployeeGroup></GroupEntity>";
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(document.all.item('txtModifyXML').value);
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/GroupEntity/EmployeeGroup[Selected=1]');
                var flag = false;
                var strAlert = "";
                strAlert = "خطا !" + String.fromCharCode(13) +
							" تاريخ شروع اعتبار پرسنل زير از تاريخ پايان اعتبار آنها بزرگتر است:" + String.fromCharCode(13);
                for (var i = 0; i < xmlNodes.length; i++) {
                    var sdi = xmlNodes.item(i).selectSingleNode('StartDate').text.substring(8, 10) + xmlNodes.item(i).selectSingleNode('StartDate').text.substring(3, 5) + xmlNodes.item(i).selectSingleNode('StartDate').text.substring(0, 2);
                    var edi = xmlNodes.item(i).selectSingleNode('EndDate').text.substring(8, 10) + xmlNodes.item(i).selectSingleNode('EndDate').text.substring(3, 5) + xmlNodes.item(i).selectSingleNode('EndDate').text.substring(0, 2);
                    if (sdi > edi) {
                        strAlert = strAlert + String.fromCharCode(13) + " => " + "شماره پرسنلي : " + xmlNodes.item(i).selectSingleNode('PersonID').text + "        "
							+ "نام و نام خانوادگي : " + xmlNodes.item(i).selectSingleNode('Name').text + String.fromCharCode(13);
                        flag = true;
                    }
                }
                if (flag) {
                    alert(strAlert);
                    fnStopInterval();
                    document.all.item("TdMsg").style.display = "none";
                }
                else {
                    Form1.txtSubmit.value = "Save";
                    Form1.submit();
                }
            }

        }
        function CheckNotEmptyData() {
            if (Form1.Name.value == "") {
                alert('نام گروه را وارد نماييد');
                document.all.item('Name').focus();
                return false;
            }
            else if (Form1.Acronym.value == "") {
                alert('مخفف گروه را وارد نماييد');
                document.all.item('Acronym').focus();
                return false;
            }
            else if (Form1.StartDate_txtYear.value + "/" + Form1.StartDate_txtMonth.value + "/" + Form1.StartDate_txtDay.value == "//") {
                alert('تاريخ شروع اعتبار را وارد نماييد'); //document.all.item('StartDate').focus()
                return false;
            }
            else if (Form1.EndDate_txtYear.value + "/" + Form1.EndDate_txtMonth.value + "/" + Form1.EndDate_txtDay.value == "//") {
                alert('تاريخ خاتمه اعتبار را وارد نماييد'); //document.all.item('EndDate').focus()
                return false;
            }
            else if (Form1.EndDate_txtYear.value + "/" + Form1.EndDate_txtMonth.value + "/" + Form1.EndDate_txtDay.value < Form1.StartDate_txtYear.value + "/" + Form1.StartDate_txtMonth.value + "/" + Form1.StartDate_txtDay.value) {
                alert('تاریخ شروع بزرگتر از تاریخ خاتمه است'); //document.all.item('EndDate').focus()
                return false;
            }
            else if (window.frames('FGroupMember').checkNotEmptyDateonGrid() == false)
                return false;
            else
                return true;
        }
        function onClickbtnDelete() {
            if ((LastSelectedRowgrd != null) && (Form1.GroupId.value != "0") && (Form1.GroupId.value != "")) {
                if (Form1.PersonId.value == "") {
                    if (LastSelectedRowgrd.flags == 1) {
                        alert("حذف يک گروه شيفتي غير مجاز است");
                    }
                    else {
                        var rsp = window.confirm("آيا حذف اين گروه و اعضاي آن را تاييد ميکنيد؟");
                        if (rsp == true) {
                            Form1.txtSubmit.value = "Delete";
                            Form1.submit();
                        } 
                    } 
                }
                else {
                    var rsp = window.confirm("آيا براي حذف '" + Form1.PersonId.value + "' از گروه '" + LastSelectedRowgrd.cells(0).innerText + "' مطمئن هستيد؟");
                    if (rsp == true) {
                        Form1.txtDelSDate.value = LastSelectedRowgrd.cells(3).innerText;
                        Form1.txtDelEDate.value = LastSelectedRowgrd.cells(4).innerText;
                        Form1.txtSubmit.value = "Delete" + Form1.PersonId.value;
                        Form1.submit();
                    } 
                } 
            }
            else
                alert("لطفا ابتدا يک سطر انتخاب نماييد");
        }
        function onblurFromCRNo() {
            Form1.ToCRNo.value = Form1.FromCRNo.value;
        }
        function RefreshFrame() {
            var url = 'EmployeeGroup.aspx?GroupId=' + Form1.GroupId.value + '&SessionID=' + Form1.txtSessionID.value;
            window.frames('FGroupMember').location = url;
        }
        function onclickBtnSelectPerson() {
            Form1.SDate.value = Form1.StartDate_txtYear.value + '/' + Form1.StartDate_txtMonth.value + '/' + Form1.StartDate_txtDay.value;
            Form1.EDate.value = Form1.EndDate_txtYear.value + '/' + Form1.EndDate_txtMonth.value + '/' + Form1.EndDate_txtDay.value;
            window.frames('FGroupMember').onclickBtnSelectPerson();
        }
        function onclickbtnDown() {
            if (Form1.btnDown.className == "CssbtnUP") {
                Form1.btnDown.className = "CssbtnDown";
                document.all.item('GridTD').style.display = 'none';
            }
            else {
                Form1.btnDown.className = "CssbtnUP";
                document.all.item('GridTD').style.display = 'inline';
            } 
        }

        function OnClickbtnTOPCancel() {
            window.close();
        }
        function onclickCalendar(obj) {
            while (obj.tagName != "TR") {
                obj = obj.parentElement;
            }
            var url;
            if (Form1.PersonId.value != "") {
                //alert(url)
                url = "../../SpecialCal/SpecialCal.aspx?GroupId=" + "0" + "&PersonId=" + Form1.PersonId.value + '&SessionID=' + Form1.txtSessionID.value;
                window.showModalDialog(url, window, "dialogHeight: 680px;dialogWidth: 895px;center: Yes;help: no;status: no");
            }
            else {
                if (obj.flags != 1) {
                    alert("امکان باز کردن تقويم برنامه کاري براي گروههاي غير شيفتي وجود ندارد");
                    return;
                }

                url = "../../SpecialCal/SpecialCal.aspx?GroupId=" + obj.GroupId + "&PersonId=" + "0" + "&SessionID=" + Form1.txtSessionID.value;
                window.showModalDialog(url, window, "dialogHeight: 680px;dialogWidth: 895px;center: Yes;help: no;status: no");
            } 
        }
    </script>
    <script language="vbscript">
		dim century
		century="13"
		function datechk()
			dim val
			val=replace(window.event.srcElement.value," ","",1,-1,1)
			if (not (val=""))and(not Isvaliddate(val)) then
 			Dim strQuestion, intReturn
			strQuestion="  ! لطفا دراين قسمت تاريخ شمسي صحيح وارد كنيد"
			strQuestion=MsgBox(strQuestion, 0, "تاريخ شمسي اشتباه ")
			window.event.srcElement.focus()
			window.event.returnvalue=false
			else
			if val<>"" then
				dim arr
				arr=split(val,"/",-1,0)
				if arr(2)<100  then  
					century="13"
				else	  
					century=""
				end if
				val=right("0" & arr(1),2) & "/" & century & arr(2)
				val=right("0" & arr(0),2) & "/" & val  
				window.event.srcElement.value=val
			end if
			end if
		end function
		function isshleap (sal)
		dim ybase_sh,L1

			if sal<100   then  
				sal=sal+1300
			end if
		      
			ybase_sh=int((sal-125)/ 99)*99+125
		      
			L1=((sal-ybase_sh) mod 99)
			if (L1>=98) then
				isshleap=(((L1-89) mod 4 )=0)
			else
				if (L1 >=61) then
						isshleap=(((L1-62) mod 4)=0)
				else 
					if L1 >=28 then
						isshleap=(((L1-29) mod 4)=0)
					else 
						isshleap=((L1 MOD 4)=0)
					end if
				end if
			end if

		END function
		function Isvaliddate(txt)
		dim   le,t1,t2,sal,mah,roz,arr
		arr=split(txt,"/",-1,0)
		if ubound(arr)=2 then
			roz=cint("0" & arr(0))
   				mah=cint("0" & arr(1))
 				sal=cint("0" & arr(2))
			le=0
			if sal<100   then 
				sal=sal+1300
			end if
			if isshleap(sal)then 
				le=1 
			end if 
			t1= (mah>=1) and (mah<=12)
			t2= (roz>=1) and (roz<=29+le)
			t2= t2 or ((roz=30) and ((mah>=1) and ( mah<=11)))
			t2= t2 or ((roz=31)and((mah>=1) and ( mah<=6 )))
			Isvaliddate= (t1 and t2)
		else
			Isvaliddate=false
		end if
		end function
		function mi2sh(Mdate)
		dim   roz 
		if  isdate(mdate) then
				roz=(mdate - #22 March 1935#)
				Mi2sh=InttoSHD(roz)
		else
				mi2sh=""
		end if
		end function
		function InttoSHD(roz)
		dim   leap,Esal,sal,mahbase,tag 

				sal=0  :   mah =0  :   leap=0 :  tag=0  : Esal=0
				do while roz<00000  :roz=roz+36159 :sal=sal-99 :loop
				do while roz>36158  :roz=roz-36159 :sal=sal+99 :loop
				select case roz
					case 10591 
					case 22644 
					case 36158 
					case else
        			if (roz>=00000) and (roz<=10225) then
						tag=1  :Esal=0  :base=00000 
						end if
					if (roz>=10226) and (roz<=10590) then
						tag=2 :Esal=1  :base=10226 
						end if
					if (roz>=10592) and (roz<=22278) then
        				tag=3 :Esal=1  :base=10592 
						end if
					if (roz>=22279) and (roz<=22643) then
        				tag=4 :Esal=2  :base=22279 
						end if
					if (roz>=22645) and (roz<=35792) then
        				tag=5 :Esal=2 :base=22645  
						end if
					if (roz>=35793) and (roz<=36157) then
        				tag=6 :Esal=3 :base=35793  
						end if
			end select
			if ((tag mod 2)=1 ) and ( ((roz-base+1) mod 1461 )=0 ) then
				roz=roz-1 :leap=1
			end if
			if tag>0 then
				roz=roz-Esal*365 
				roz=roz-int(roz / 1461)
				sal=Esal+sal+ int(roz / 365)+1314
       			roz=roz mod 365+leap
			end if
			if roz>=186 then
				roz=roz-186  :mah=6+int(roz / 30) :roz=roz mod 30
			else
				mah=int(roz / 31) :roz=roz mod 31
			end if
			InttoSHD=cstr(sal)+"/"+right("0"&(mah+1),2)+"/"+right("0"&(roz+1),2)
		end function
		function SHDtoInt(shd)
		dim  sal,mah,roz,Tr,arr
		arr=split(shd,"/",-1,1)
		if ubound(arr)=2 then
			sal=cint(arr(0)) 
			mah=cint(arr(1))-1
			roz=cint(arr(2))-1
			Tr=0
			if sal <100 then sal=1300+sal end if
			sal=sal-1314
			do while sal<0  :  tr=tr-36159-366 : sal=sal+100 : loop
			do while sal>98 :  Tr=Tr+36159     : sal=sal-99  : loop
			if (sal>=0 and sal<=27)  then   Tr=Tr+sal*365+(sal\4)      end if
			if (sal>=28 and sal<=60) then   Tr=Tr+sal*365+((sal-1)\ 4) end if
			if (sal>=61 and sal<=97) then   Tr=Tr+sal*365+((sal-2)\ 4) end if
			if  (sal=98)             then   Tr=Tr+sal*365+((sal-3)\ 4) end if
			if mah>6 then
				Tr=Tr+(mah-6)*30+186
			else 
				Tr=Tr+mah*31
			end if
			SHDtoInt=Tr+roz
		else
			alert("اشكال در تاريخ شمسي")
			SHDtoInt=0
		end if
		end function
		function Between(date1,date2)
		between=SHDtoInt(date2)-SHDtoInt(date1)+1
		end function
		function shdAdd(Sdate,days)
		days=cint(days)
		if days<>0 then 
				shdAdd=InttoSHD(SHDtoInt(cstr(Sdate))+days)
		else
				shdAdd=Sdate
		end if
		end function		
    </script>
</head>
<body dir="rtl" bottommargin="0" leftmargin="0" topmargin="0" scroll="no" onload="onLoad()"
    rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <table class="CssLayer1" id="Layer1" height="100%" cellspacing="0" cellpadding="10"
        width="100%" align="center" border="0">
        <tr>
            <td valign="middle" align="center">
                <table class="CssLayer2" id="Layer2" style="width: 100%; height: 100%" height="664"
                    cellspacing="0" cellpadding="0" width="994" border="0">
                    <tr>
                        <td valign="middle" align="center">
                            <table class="CssPage" id="Page" style="width: 757px; height: 582px" cellspacing="1"
                                cellpadding="1" border="0">
                                <tr>
                                    <td id="TopRow" style="width: 500px; display: none; height: 310px" valign="top" align="center"
                                        runat="server">
                                        <table id="Table2" style="width: 734px; height: 368px" cellspacing="0" cellpadding="0"
                                            width="734" align="center" border="0">
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <table id="Table8" style="width: 559px;" cellspacing="0" cellpadding="1" width="559"
                                                        border="0">
                                                        <tr>
                                                            <td style="border-bottom: lightblue thin solid; border-left: lightblue thin outset;
                                                                border-top: lightblue thin solid; border-right: lightblue thin inset" align="center">
                                                                <table id="Table1" style="width:600px; height: 34px" cellspacing="1" cellpadding="1"
                                                                    width="524" border="0">
                                                                    <tr>
                                                                        <td style="width: 77px">
                                                                            شماره پرسنلي
                                                                        </td>
                                                                        <td>
                                                                            <input class="txtControls" id="PersonId" onblur="onblurPersonId()" onkeydown="OnKeyDownNum('integer',this.value)"
                                                                                style="width: 110px; height: 20px" size="13" name="PersonId" runat="server">
                                                                            <img id="ImgRefresh" style="width: 18px; height: 18px" onclick="onClickImgRefresh(); "
                                                                                height="18" alt="به روز رساني نام" src="../../../../Includes/Images/Icons/u6.gif"
                                                                                width="18" name="ImgRefresh" style="display: none">
                                                                        </td>
                                                                        <td style="width: 100px">
                                                                        نام و نام خانوادگي
                                                                        </td>
                                                                        <td>
                                                                            <cc1:lcombo id="cmbPersonName" runat="server" onchange="onchangecmbPersonName()" CssClass="TxtControls"
																						 Width="200px"></cc1:lcombo>
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <table id="Table5" style="width: 526px; height: 36px" cellspacing="1" cellpadding="1"
                                                                    width="526" border="0">
                                                                    <tr>
                                                                        <td style="width: 78px">
                                                                            دسته
                                                                        </td>
                                                                        <td style="width: 119px">
                                                                            <cc1:lcombo id="cmbCatGrd" runat="server" Width="116px" CssClass="txtControls" ConnectionName="GenCnn"
                                                                                LookupName="Category">
                                                                            </cc1:lcombo>
                                                                        </td>
                                                                        <td align="left">
                                                                            <input id="chkShift" type="checkbox" runat="server" name="chkShift">شيفت
                                                                        </td>
                                                                        <td align="left">
                                                                            <input id="chkNotShift" type="checkbox" runat="server" name="chkNotShift">ساير
                                                                        </td>
                                                                        <td align="left">
                                                                            <input class="CssBtnLimitSerach" id="BtnShow" style="width: 94px; height: 32px" type="button"
                                                                                name="BtnShow" runat="server"><input class="CssBtnShow" id="BtnShowAll" type="button"
                                                                                    name="BtnShowAll" runat="server">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="scrollbar-arrow-color: black; display: inline; scrollbar-base-color: #b0c4de;
                                                    height: 100%; scrollbar-highlight-color: white; overflow: auto; top: 5px" valign="top"
                                                    align="center">
                                                    <table id="Table11" dir="ltr" style="width: 264px;" cellspacing="0" cellpadding="0"
                                                        align="center" border="0">
                                                        <tr>
                                                            <td style="width: 34px">
                                                                <asp:Button ID="FirstBtn" runat="server" Width="29px" CssClass="CssFirstPage" BackColor="Transparent"
                                                                    ToolTip="اولين" BorderColor="Transparent" BorderStyle="None" Height="26px"></asp:Button>
                                                            </td>
                                                            <td align="right">
                                                                <asp:Button ID="PrevBtn" runat="server" Width="29px" CssClass="CssPrevPage" BackColor="Transparent"
                                                                    ToolTip="قبلي" BorderColor="Transparent" BorderStyle="None" Height="24px"></asp:Button>
                                                            </td>
                                                            <td valign="middle" align="right">
                                                                <asp:TextBox ID="Totalpage1" runat="server" Width="41" CssClass="txtControls" BackColor="White"
                                                                    BorderStyle="Groove" Height="24px" ReadOnly="True"></asp:TextBox>
                                                            </td>
                                                            <td dir="rtl" valign="top" align="right">
                                                                &nbsp; از&nbsp;&nbsp;&nbsp;
                                                            </td>
                                                            <td valign="middle">
                                                                <asp:TextBox ID="CurPage" onblur="onblurCurPage()" runat="server" Width="41" CssClass="txtControls"
                                                                    BorderStyle="Groove"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="NextBtn" runat="server" Width="29px" CssClass="CssNextPage" BackColor="Transparent"
                                                                    ToolTip="بعدي" BorderColor="Transparent" BorderStyle="None" Height="24px"></asp:Button>
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="LastBtn" runat="server" Width="29px" CssClass="CssLastPage" BackColor="Transparent"
                                                                    ToolTip="آخرين" BorderColor="Transparent" BorderStyle="None" Height="24px"></asp:Button>
                                                            </td>
                                                            <td style="display: none">
                                                                <input id="txtReturnMessage1" name="txtReturnMessage1" runat="server">
                                                                <asp:Button ID="Button1" Style="display: none" runat="server" Width="1px" Text="Button">
                                                                </asp:Button><asp:TextBox ID="OrderField1" Style="display: none" runat="server" Width="1px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <cc1:automationgrid id="grdGroup" runat="server" Width="584px" Height="330px" AutoGenerateColumns="False"
                                                        SendXML="DoNotSend" SelectRowOnClick="False" ClientPageSize="0" Scrolling="True"
                                                        EnableClientPager="False" ShowHeader="False" SelectRowOnMouseMove="False" UsingKeyBoard="False"
                                                        CreateClientSideScripts="False" ClientSorting="False" HtcAddress=" ">
                                                        <itemstyle cssclass="CssItemStyle"></itemstyle>
                                                        <headerstyle cssclass="CssHeaderStyle" verticalalign="Middle" horizontalalign="Center"></headerstyle>
                                                        <alternatingitemstyle cssclass="CssAlternatingItemStyle"></alternatingitemstyle>
                                                        <footerstyle cssclass="CssEditItemStyle "></footerstyle>
                                                        <selecteditemstyle cssclass="CssSelectedItemStyle"></selecteditemstyle>
                                                        <columns>
																	<ASP:TEMPLATECOLUMN HeaderText="نام گروه">
																		<HEADERSTYLE Width="230px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="230px" HorizontalAlign="Right"></ITEMSTYLE>
																		<ITEMTEMPLATE>
																			<asp:Label id=Label1 title='<%# DataBinder.Eval(Container, "DataItem.fGroupName") %>' runat="server" Width="180px" Text='<%# DataBinder.Eval(Container, "DataItem.GroupName") %>'>
																			</asp:Label>
																		</ITEMTEMPLATE>
																	</ASP:TEMPLATECOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="نام مخفف" DataField="Acronym">
																		<HEADERSTYLE Width="100px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="100px" HorizontalAlign="Right"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="نام دسته" DataField="CategoryName">
																		<HEADERSTYLE Width="90px"></HEADERSTYLE>
																		<ITEMSTYLE Width="90px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN DataField="GroupId" Visible="False">
																		<HEADERSTYLE Width="1px"></HEADERSTYLE>
																		<ITEMSTYLE Width="1px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN DataField="CategoryId" Visible="False">
																		<HEADERSTYLE Width="1px"></HEADERSTYLE>
																		<ITEMSTYLE Width="1px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN DataField="Active" Visible="False">
																		<HEADERSTYLE Width="1px"></HEADERSTYLE>
																		<ITEMSTYLE Width="1px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="تاريخ شروع" DataField="StartDate">
																		<HEADERSTYLE Width="80px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="80px" HorizontalAlign="Center"></ITEMSTYLE>
																		<FOOTERSTYLE HorizontalAlign="Center"></FOOTERSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="تاريخ پايان" DataField="EndDate">
																		<HEADERSTYLE Width="80px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="80px" HorizontalAlign="Center"></ITEMSTYLE>
																		<FOOTERSTYLE HorizontalAlign="Center"></FOOTERSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:TEMPLATECOLUMN HeaderText="فعال">
																		<HEADERSTYLE Width="40px"></HEADERSTYLE>
																		<ITEMSTYLE Width="40px" HorizontalAlign="Center"></ITEMSTYLE>
																		<ITEMTEMPLATE>
																			<IMG border="0" name="IMGModify" align="middle" src="../../Images/BlueTick.gif">
																		</ITEMTEMPLATE>
																	</ASP:TEMPLATECOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="flags" DataField="Flags" Visible="False">
																		<HEADERSTYLE Width="1px"></HEADERSTYLE>
																		<ITEMSTYLE Width="1px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:TEMPLATECOLUMN>
																		<HEADERSTYLE Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="30px" VerticalAlign="Middle" HorizontalAlign="Center"></ITEMSTYLE>
																		<ITEMTEMPLATE>
																			<IMG style="CURSOR: hand" onclick="onclickCalendar(this); " src="../../../../Includes/Images/Icons/cc1.gif">
																		</ITEMTEMPLATE>
																	</ASP:TEMPLATECOLUMN>
																</columns>
                                                    </cc1:automationgrid>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" align="center" colspan="2">
                                                    <hr class="CssHorizontalLine" style="width: 367px; height: 2px" size="2">
                                                    <table id="Table6" style="width: 230px; height: 46px" cellspacing="5" cellpadding="2"
                                                        width="230" align="center" border="0">
                                                        <tr>
                                                            <td style="width: 76px">
                                                                <input style="cursor: hand" class="CssBtnNew" id="btnTopNew" onclick="onClickbtnNew(); "
                                                                    type="button" name="btnNewDown">
                                                            </td>
                                                            <td style="width: 75px">
                                                                <input style="cursor: hand" class="CssbtnEdit" id="btnEdit" onclick="onClickbtnEdit(); "
                                                                    type="button" name="btnEdit">
                                                            </td>
                                                            <td style="width: 63px">
                                                                <input style="cursor: hand" class="CssBtnDelete" id="btnDelete" onclick="onClickbtnDelete(); "
                                                                    type="button" name="btnDelete">
                                                            </td>
                                                            <td>
                                                                <input class="CssBtnCancel" id="btnTOPCancel" style="display: none" onclick="OnClickbtnTOPCancel(); "
                                                                    type="button">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="DownRow" style="display: none; height: 510px" valign="middle" align="center">
                                        <table id="Table3" style="width: 748px; height: 46px" cellspacing="1" cellpadding="1"
                                            width="748" border="0">
                                            <tr>
                                                <td style="width: 57px; height: 12px">
                                                    نام گروه
                                                </td>
                                                <td style="width: 139px; height: 12px">
                                                    <input class="txtControls" id="Name" style="width: 124px; height: 20px" size="22"
                                                        name="Name" runat="server">
                                                </td>
                                                <td style="width: 55px; height: 12px">
                                                    مخفف
                                                </td>
                                                <td style="width: 134px; height: 12px">
                                                    <input class="txtControls" id="Acronym" style="width: 124px; height: 20px" size="22"
                                                        name="Acronym" runat="server">
                                                </td>
                                                <td style="width: 55px; height: 12px">
                                                    دسته بندي
                                                </td>
                                                <td id="tdcmb" style="width: 130px; height: 12px">
                                                    <cc1:lcombo id="cmbCategory" runat="server" Width="124px" CssClass="txtControls"
                                                        ConnectionName="GenCnn" LookupName="Category">
                                                    </cc1:lcombo>
                                                </td>
                                                <td>
                                                    نوع :<input id="rdbShift" type="radio" name="shift" runat="server" value="rdbShift">شيفتي
                                                    <input id="rdbNoShift" type="radio" name="shift" runat="server" value="rdbNoShift">غير
                                                    شيفتي
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 57px">
                                                    تاريخ شروع
                                                </td>
                                                <td style="width: 139px">
                                                    <uc1:TextDate ID="StartDate" runat="server"></uc1:TextDate>
                                                </td>
                                                <td style="width: 55px">
                                                    تاريخ خاتمه
                                                </td>
                                                <td style="width: 134px">
                                                    <uc1:TextDate ID="EndDate" runat="server"></uc1:TextDate>
                                                </td>
                                                <td style="width: 55px">
                                                    وضعيت
                                                </td>
                                                <td style="width: 130px">
                                                    <input id="RbActive" type="radio" checked value="RbActive" name="RbStatus" runat="server">&nbsp;&nbsp;فعال<input
                                                        id="RbDeactive" type="radio" value="RbDeactive" name="RbStatus" runat="server">&nbsp;&nbsp;غير
                                                    فعال
                                                </td>
                                                <td id="PW">
                                                    <input class="btnSelectPerson" id="btnSelectPerson" style="width: 125px; height: 31px"
                                                        onclick="onclickBtnSelectPerson(); " type="button" name="btnSelectPerson">
                                                </td>
                                            </tr>
                                        </table>
                                        <hr class="CssHorizontalLine" style="width: 730px; height: 2px" size="2">
                                        <table id="Table7" style="width: 726px; height: 384px" cellspacing="5" cellpadding="2"
                                            width="726" border="0">
                                            <tr>
                                                <td id="Member" valign="top" align="center">
                                                    <iframe id="FGroupMember" style="width: 100.14%; height: 105.24%" src='EmployeeGroup.aspx?SessionID=<%=request("SessionID")%>'
                                                        frameborder="no" width="100%" height="100%"></iframe>
                                                </td>
                                            </tr>
                                        </table>
                                        <table id="Table4" style="width: 730px; height: 118px" cellspacing="1" cellpadding="1"
                                            width="730" align="center" border="0">
                                            <tr>
                                                <td style="height: 51px" valign="middle" align="center">
                                                    <hr class="CssHorizontalLine" style="width: 724px; height: 2px" size="2">
                                                    <table id="Table9" style="width: 236px; height: 38px" cellspacing="1" cellpadding="1"
                                                        width="236" border="0">
                                                        <tr>
                                                            <td style="height: 49px">
                                                                <table id="TableMessage">
                                                                    <tr>
                                                                        <td style="width: 76px">
                                                                            <input class="CssBtnNew" id="btnDownNew" onclick="onClickbtnDownNew(); " type="button"
                                                                                name="btnDownNew">
                                                                        </td>
                                                                        <td style="width: 75px">
                                                                            <input class="CssbtnSave" id="btnSave" onclick="onClickbtnSave(); " type="button"
                                                                                name="btnSave">
                                                                        </td>
                                                                        <td>
                                                                            <input class="CssBtnCancel" id="btnCancel" onclick="onClickbtnCancel(); " type="button"
                                                                                name="btnCancel">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table id="Table10" style="width: 150px; height: 14px" cellspacing="1" cellpadding="1"
                                                        width="150" border="0">
                                                        <tr>
                                                            <td id="TdMsg" style="width: 57px">
                                                                <table id="Table20" style="width: 141px; height: 20px" cellspacing="0" bordercolordark="#003366"
                                                                    cellpadding="0" width="141" align="center" bordercolorlight="#6699cc" border="1">
                                                                    <tr>
                                                                        <td id="Td1" bgcolor="#ffffff">
                                                                        </td>
                                                                        <td id="Td2" bgcolor="#ffffff">
                                                                        </td>
                                                                        <td id="Td3" bgcolor="#ffffff">
                                                                        </td>
                                                                        <td id="Td4" bgcolor="#ffffff">
                                                                        </td>
                                                                        <td id="Td5" style="width: 22px" bgcolor="#ffffff">
                                                                        </td>
                                                                        <td id="Td6" bgcolor="#ffffff">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="display: none" valign="middle" align="center">
                                                    <input id="txtSessionID" runat="server" name="txtSessionID">
                                                    <input id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID" runat="server">
                                                    <cc1:mysecurity id="OnLineUser" runat="server">
                                                    </cc1:mysecurity>
                                                    <input id="XMLPerson" size="1" name="XMLPerson" runat="server"><input id="Active"
                                                        size="1" name="Active" runat="server">
                                                    <input id="txtMsg" size="1" name="txtMsg" runat="server"><input id="GroupId" size="1"
                                                        name="GroupId" runat="server">
                                                    <input id="txtXMLMember" size="1" name="txtXMLMember" runat="server"><input id="txtGroupXML"
                                                        size="1" name="txtGroupXML" runat="server">
                                                    <input id="txtSubmit" size="1" name="txtSubmit" runat="server"><input id="txtCurDate"
                                                        size="1" name="txtCurDate" runat="server">
                                                    <input id="SDate" name="SDate" runat="server">
                                                    <input id="EDate" name="EDate" runat="server">
                                                    <input id="txtOverlapXML" runat="server" name="txtOverlapXML">
                                                    <input id="txtModalflag" runat="server" name="txtModalflag">
                                                    <input id="txtXmlPerson" name="txtXmlPerson" runat="server">
                                                    <input id="txtModifyXML" runat="server" name="txtModifyXML">
                                                    <input id="txtDelSDate" runat="server" name="txtDelSDate">
                                                    <input id="txtDelEDate" runat="server" name="txtDelEDate">
                                                    <input id="txtSDate" runat="server">
                                                    <input id="txtEDate" runat="server">
                                                    <input id="txtCompanyFinatialPeriodID" style="display: none; width: 1px" type="text"
                                                            name="txtCompanyFinatialPeriodID" runat="server">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
