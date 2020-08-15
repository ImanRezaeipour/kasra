<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewOrganChart.aspx.cs"
    Inherits="FrmPresentation.App_Pages.BaseInfo.OrganizationChart.NewOrganChart"
    ValidateRequest="false" %>

<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox"
    TagPrefix="uc2" %>
<!doctype HTML public "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../../../App_Utility/Styles/treeStyle.css" rel="stylesheet" type="text/css" />
    <link href="~/App_Utility/Styles/menuStyle.css" rel="Stylesheet" type="text/css" />
    <link href="../../../App_Utility/Styles/combobox.css" rel="Stylesheet" type="text/css" />
    <link href="../../../App_Utility/Styles/GeneralStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../../App_Utility/Styles/StyleForPages.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../../App_Utility/Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="../../../App_Utility/Scripts/General.js" language="javascript"></script>
    <script type="text/javascript" src="../../../App_Utility/Scripts/KeySorting.js" language="javascript"></script>
    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/BaseInfo/OrganizationChart/NewOrganChart.js"></script>
    <script type="text/javascript" src="../../../App_Utility/Scripts/jqia2.support.js"></script>
    <script src="../../../App_Utility/Scripts/splitter.js" type="text/javascript"></script>
    <script src="../../../App_Utility/Scripts/farsitype.js?v=1.1" type="text/javascript"></script>
    <style type="text/css">
        
    </style>
</head>
<body scroll="no" class="cssMenu" style="margin: 0px; scrollbar-highlight-color: white;
    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; overflow: auto">
    <style>
        .headerCss
        {
            cursor: hand;
            cursor: pointer;
        }
        .CssHeaderPageMain
        {
            filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#7ea7e0, EndColorStr=#D5E2F4); /*background-image: url('../../App_Utility/Images/PageMain/BG38.gif');*/
            font-family: Tahoma;
            font-size: 13px;
            font-weight: bold;
        }
        .vsplitbar
        {
            width: 5px;
            background: #cab;
        }
        #MySplitter
        {
            height: 420px;
        }
        #DivRight
        {
            min-width: 10px;
        }
        #UpdatePanel1
        {
            height: 100%;
            width: 100%;
        }
    </style>
    <script type="text/javascript" language="jscript">

        $(document).ready(function () {
            $("#MySplitter").splitter({
                type: "v",
                sizeRight: 300,
                minRight: 20
            });
        });
        function SetMsg(Msg) {
            try {
                var strMsg = Msg
                var icon = "Blank.gif"
                if (Msg == "Save") {
                    strMsg = "ذخيره شد"
                    icon = "Save4.png"
                }
                else if (Msg == "Modify") {
                    strMsg = "ذخيره شد"
                    icon = "Save4.png"
                }
                else if (Msg == "SaveFail") {
                    strMsg = "ذخيره نشد"
                    icon = "Error.ico"
                }
                else if (Msg == "Delete") {
                    strMsg = "حذف شد"
                    icon = "Cancel.png"
                }
                else if (Msg == "DeleteFail") {
                    strMsg = "حذف انجام نشد"
                    icon = "cancelrefresh.gif"
                }
                else if (Msg == "NoAccess") {
                    strMsg = "شما اجازه ايجاد در اين قسمت را نداريد"
                    icon = "deleteallink.gif"
                }
                else if (Msg == "NoAccessDelete") {
                    strMsg = "شما اجازه حذف اين مورد را نداريد"
                    icon = "cancelrefresh.gif"
                }
                else if (Msg == "Error") {
                    strMsg = "عمليات با مشکل مواجه شد"
                    icon = "Error.ico"
                }
                else if (Msg == "RepeatInfo") {
                    strMsg = "اطلاعات تکراري است"
                    icon = "fav_team.png"
                }
                else if (Msg == "NotFound") {
                    strMsg = "اطلاعات يافت نشد"
                    icon = "S1.png"
                }
                else if (Msg == "Error") {
                    strMsg = "کد واحد تکراري است"
                    icon = "fav_team.png"
                }
                else {
                    strMsg = Msg
                    icon = "fav_team.png"
                }
                //-----------------------------------------------
                Dialog1.beginUpdate();
                Dialog1.set_title(strMsg);
                Dialog1.set_icon(icon);
                Dialog1.endUpdate();
                Dialog1.Show();
                window.setTimeout("Dialog1.Close('Close click');", 1500)
                //-----------------------------------------------
            }
            catch (e) { }
        }
  

    

    </script>
    <form id="form1" style="height: 100%; vertical-align: middle" runat="server" lang="fa">
    <div>
         
               
        <div>
            <ComponentArt:Dialog HeaderCssClass="headerCss" AllowDrag="true" CloseTransition="Fade"
                TransitionDuration="200" ShowTransition="Fade" Icon="pencil.gif" Value="Sample Dialog Content"
                HeaderClientTemplateId="header" ContentClientTemplateId="content" FooterClientTemplateId="footer"
                Alignment="MiddleCentre" ID="Dialog1" runat="server" Height="150" Width="300">
                <ClientTemplates>
                    <ComponentArt:ClientTemplate ID="header">
                        <table style="border-top-style: double; border-right-style: double; border-left-style: double;
                            border-top-width: medium; border-right-width: medium; border-left-width: medium;
                            border-top-color: #336699; border-right-color: #336699; border-left-color: #336699;"
                            cellpadding="0" cellspacing="0" border="2" width="300" onmousedown="Dialog1.StartDrag(event);">
                            <tr>
                                <td style="height: 20px !important;" class="CssHeaderPageMain" valign="middle">
                                    <div align="right" width="100%">
                                        اتوماسيون تردد كسرا
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </ComponentArt:ClientTemplate>
                    <ComponentArt:ClientTemplate ID="content">
                        <table cellpadding="0" cellspacing="0" style="border-right-style: double; border-left-style: double;
                            border-right-width: medium; border-left-width: medium; border-right-color: #336699;
                            border-left-color: #336699;" cellpadding="0" cellspacing="0" border="2" width="300">
                            <tr>
                                <td style="background-color: white; font-size: 12px; font-family: Arial;">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td valign="middle" style="padding: 10px; width: 30px;">
                                                <img src="/FrmPresentation/App_Utility/Images/Icons/## Parent.Icon ##" style="padding: 5px;" />
                                            </td>
                                            <td style="height: 60px !important; padding: 5px; font-family: Tahoma; font-size: 12px;
                                                font-weight: bold;" align="center" valign="middle">
                                                ## Parent.Title ##
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </ComponentArt:ClientTemplate>
                    <ComponentArt:ClientTemplate ID="footer">
                        <table cellpadding="0" cellspacing="0" width="300" style="border-right-style: double;
                            border-left-style: double; border-right-width: medium; border-left-width: medium;
                            border-right-color: #336699; border-left-color: #336699; border-bottom-style: double;
                            border-bottom-width: medium; border-bottom-color: #336699;" border="2">
                            <tr>
                                <td width="440">
                                </td>
                            </tr>
                        </table>
                    </ComponentArt:ClientTemplate>
                </ClientTemplates>
            </ComponentArt:Dialog>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <script type="text/javascript" language="javascript">
            var elem
            Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            function BeginRequestHandler(sender, args) {
                elem = args.get_postBackElement();
                rowi = RowIndex
                if (elem.id == 'CmbCodeDept_BtnSubmitCombo' || elem.id == 'CmbRoleName_BtnSubmitCombo' || elem.id == 'CmbPerson_BtnSubmitCombo') {
                    $("#ProgressState").val("1");
                }
                $("#txtDivWidth").val($("#shadowMessage").css('width'));
                SetProgressBar1();
              }
            function onclickImgClose() {

                document.getElementById("PopupCreate").style.display = "none"
            }
            function EndRequestHandler(sender, args) {
                RowIndex = rowi

                if (elem.id == 'TVNew') {
                }
//                if (($get("txtDivWidth").value != $get("txtDivWidths").value) && $get("txtDivWidths").value != '' && (parseInt($get("txtDivWidth").value) >= 1200)) {
//                    $get("txtDivWidth").value = $get("txtDivWidths").value
//                }
                //Code for Mysplitter
                if ($get("txtDivWidth").value == 'auto')
                    $get("txtDivWidth").value = $get("txtDivWidths").value
                if ($get("txtSubmit").value != "" || $get("txtPSubmit").value != '') {
                    var DivWidth = $get("txtDivWidth").value;
                    DivWidth = DivWidth.substr(0, DivWidth.length - 2); //bedoone px bayad hesab shavad
                    $("#MySplitter").splitter({
                        type: "v",
                        sizeRight: DivWidth,
                        minRight: 20
                    });
                }
                if (elem.id.substring(elem.id.length - 7, elem.id.length) == "Btndata") {
                    if (document.getElementById("txtSubmit").value == "SelEmptyPerson") {
                        var OGrid = document.getElementById("GrdPersonRole");

                        var str1 = form1.txtXmlGridData.value
                        var strXml1 = "<Root>" + str1 + "</Root>"

                        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                        oXmlDoc.async = "false";
                        oXmlDoc.loadXML(strXml1);
                        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [RoleID=0 and RowIndex=" + RowIndex + "]");

                        if (oXmlNodes.length != 0) {
                            for (var i = 0; i < oXmlNodes.length; ++i) {
                                if (parseInt(OGrid.rows.length, 10) <= parseInt(RowIndex, 10))
                                    FillGridPersonRoleForNew()
                                OGrid.rows(RowIndex).cells(0).firstChild.value = oXmlNodes.item(i).selectSingleNode("RoleType").text
                                OGrid.rows(RowIndex).cells(3).firstChild.value = oXmlNodes.item(i).selectSingleNode("RoleTitle").text
                            }
                        }
                    }
                    if (document.getElementById("txtSubmit").value == "DeletePerson") {
                        var OGrid = document.getElementById("GrdPersonRole");
                        var str = form1.txtXmlGridData.value
                        var strXml = "<Root>" + str + "</Root>"
                        var GrdRow = 0
                        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                        oXmlDoc.async = "false";
                        oXmlDoc.loadXML(strXml);
                        var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [RoleID=0]");

                        if (oXmlNodes.length != 0) {
                            for (var i = 0; i < oXmlNodes.length; ++i) {
                                GrdRow = parseInt(oXmlNodes.item(i).selectSingleNode("RowIndex").text, 10)

                                if ((parseInt(OGrid.rows.length, 10) - 1) - (parseInt(GrdRow, 10)) == 1) {
                                    //alert(1)
                                }
                                else {

                                    OGrid.rows(GrdRow).cells(0).firstChild.value = oXmlNodes.item(i).selectSingleNode("RoleType").text
                                    //OGrid.rows(GrdRow).cells(1).firstChild.value = oXmlNodes.item(i).selectSingleNode("RoleTitle").text
                                    OGrid.rows(GrdRow).cells(1).firstChild.value = oXmlNodes.item(i).selectSingleNode("PersonCode").text
                                    OGrid.rows(GrdRow).cells(2).innerText = oXmlNodes.item(i).selectSingleNode("PersonName").text
                                    if (OGrid.rows(GrdRow + 1) == null || OGrid.rows(GrdRow + 1) == undefined)
                                        OnClickBtnNewRow(OGrid.rows(GrdRow).cells(6).firstChild)
                                }
                            }
                        }
                    }
                }
                if (elem.id == 'BtnSubmitPerson') {
                    var OGrid = document.getElementById("GrdPersonRole");
                    if (parseInt(OGrid.rows.length, 10) <= parseInt(RowIndex, 10)) {
                        FillGridPersonRoleForNew()
                    }
                    if ($get("txtPersonValue").value != 0 && $get("txtPersonValue").value != "") {

                        OGrid.rows(RowIndex).cells(2).innerText = $get("txtPersonValue").value
                    }
                    else {
                        OGrid.rows(RowIndex).cells(2).innerText = "";
                        OGrid.rows(RowIndex).cells(1).firstChild.value = "0";
                    }
                    for (var i = 1; i < OGrid.rows.length; i++) {
                        OGrid.rows(i).cells(0).firstChild.disabled = false;
                        OGrid.rows(i).cells(1).firstChild.disabled = false;
                        OGrid.rows(i).cells(3).firstChild.disabled = false;
                        OGrid.rows(i).cells(1).childNodes(1).disabled = false;
                        OGrid.rows(i).cells(4).firstChild.disabled = false;
                        OGrid.rows(i).cells(5).firstChild.disabled = false;
                        if (OGrid.rows.length - 1 == RowIndex)
                            OGrid.rows(i).cells(6).firstChild.disabled = false;
                    }
                    //--------------------------------------------------------
                    var str1 = form1.txtXmlGridData.value
                    var strXml1 = "<Root>" + str1 + "</Root>"

                    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                    oXmlDoc.async = "false";
                    oXmlDoc.loadXML(strXml1);
                    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [RoleID=0 and RowIndex=" + RowIndex + "]");

                    if (oXmlNodes.length > 0) {
                        if ($get("txtPersonValue").value != "") {
                            oXmlNodes.item(0).selectSingleNode("PersonName").text = OGrid.rows(RowIndex).cells(2).innerText
                            if (oXmlNodes.item(0).selectSingleNode("Selected").text == 0)
                                oXmlNodes.item(0).selectSingleNode("Selected").text = 1;

                            strXml1 = oXmlDoc.xml;
                            str1 = strXml1.replace("<Root>", "");
                            str1 = str1.replace("</Root>", "");

                            form1.txtXmlGridData.value = str1
                            FillGridPersonRoleForNew()
                        }
                        else {
                            oXmlNodes.item(0).selectSingleNode("PersonName").text = ""
                            oXmlNodes.item(0).selectSingleNode("PersonCode").text = "0"
                            if (oXmlNodes.item(0).selectSingleNode("Selected").text == 0)
                                oXmlNodes.item(0).selectSingleNode("Selected").text = 1;

                            strXml1 = oXmlDoc.xml;
                            str1 = strXml1.replace("<Root>", "");
                            str1 = str1.replace("</Root>", "");

                            form1.txtXmlGridData.value = str1
                            FillGridPersonRoleForNew()
                        }
                    }
                    var str = form1.txtXmlGridData.value
                    var strXml = "<Root>" + str + "</Root>"
                    var RoleID = OGrid.rows(RowIndex).getAttribute('RoleID')

                    //Code for Mysplitter////////////////////////////////////////
                    if ($get("txtDivWidth").value == 'auto')
                        $get("txtDivWidth").value = $get("txtDivWidths").value
                    if (elem.id != '') {
                        var DivWidth = $get("txtDivWidth").value;
                        DivWidth = DivWidth.substr(0, DivWidth.length - 2); //bedoone px bayad hesab shavad
                        $("#MySplitter").splitter({
                            type: "v",
                            sizeRight: DivWidth,
                            minRight: 20
                        });
                    }
                    ///////////////////////////////////////////////////////////////
                    if (OGrid.rows(RowIndex).cells(0).firstChild.value == "0" || OGrid.rows(RowIndex).cells(0).firstChild.value == "")
                        return;
                    if (OGrid.rows(RowIndex).cells(1).firstChild.value == "")
                        return;
                    if (OGrid.rows(RowIndex).cells(3).firstChild.value == "")
                        return;

                    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                    oXmlDoc.async = "false";
                    oXmlDoc.loadXML(strXml);
                    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [RoleID=" + RoleID + " and RowIndex=" + RowIndex + "]");

                    if (oXmlNodes.length > 0) {

                        if ($get("txtPersonValue").value != "") {
                            oXmlNodes.item(0).selectSingleNode("PersonName").text = OGrid.rows(RowIndex).cells(2).innerText
                            if (oXmlNodes.item(0).selectSingleNode("Selected").text == 0)
                                oXmlNodes.item(0).selectSingleNode("Selected").text = 1;

                            strXml = oXmlDoc.xml;
                            str = strXml.replace("<Root>", "");
                            str = str.replace("</Root>", "");

                        }
                        else {
                            oXmlNodes.item(0).selectSingleNode("PersonName").text = ""
                            oXmlNodes.item(0).selectSingleNode("PersonCode").text = "0"
                            if (oXmlNodes.item(0).selectSingleNode("Selected").text == 0)
                                oXmlNodes.item(0).selectSingleNode("Selected").text = 1;

                            strXml = oXmlDoc.xml;
                            str = strXml.replace("<Root>", "");
                            str = str.replace("</Root>", "");
                        }
                    }
                    else {

                        str += "<Tb>"
                        str += "<RowIndex>" + RowIndex + "</RowIndex>"
                        str += "<DepartmentID>" + document.getElementById("txtDepartmentID").value + "</DepartmentID>"
                        str += "<RoleID>" + RoleID + "</RoleID>"
                        str += "<RoleType>" + OGrid.rows(RowIndex).cells(0).firstChild.value + "</RoleType>"
                        str += "<RoleTitle>" + OGrid.rows(RowIndex).cells(3).firstChild.value + "</RoleTitle>"
                        str += "<PersonCode>" + OGrid.rows(RowIndex).cells(1).firstChild.value + "</PersonCode>"
                        str += "<PersonName>" + OGrid.rows(RowIndex).cells(2).innerText + "</PersonName>"
                        str += "<Head>" + OGrid.rows(RowIndex).cells(8).firstChild.checked ? "1" : "0" + "</Head>";
                        str += "<Selected>1</Selected>"
                        str += "</Tb>"
                    }

                    form1.txtXmlGridData.value = str


                    var str = form1.txtXmlGridData.value
                    var strXml = "<Root>" + str + "</Root>"
                    var GrdRow = 0

                    var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                    oXmlDoc.async = "false";
                    oXmlDoc.loadXML(strXml);
                    var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [RoleID=0]");
                    if (oXmlNodes.length != 0) {
                        for (var i = 0; i < oXmlNodes.length; ++i) {
                            GrdRow = parseInt(oXmlNodes.item(i).selectSingleNode("RowIndex").text, 10)

                            if ((parseInt(OGrid.rows.length, 10) - 1) - (parseInt(GrdRow, 10)) == 1) {

                            }
                            else {
                                OGrid.rows(GrdRow).cells(0).firstChild.value = oXmlNodes.item(i).selectSingleNode("RoleType").text
                                //OGrid.rows(GrdRow).cells(1).firstChild.value = oXmlNodes.item(i).selectSingleNode("RoleTitle").text
                                OGrid.rows(GrdRow).cells(1).firstChild.value = oXmlNodes.item(i).selectSingleNode("PersonCode").text
                                OGrid.rows(GrdRow).cells(2).innerText = oXmlNodes.item(i).selectSingleNode("PersonName").text
                                if (OGrid.rows(GrdRow + 1) == null || OGrid.rows(GrdRow + 1) == undefined)
                                    OnClickBtnNewRow(OGrid.rows(GrdRow).cells(6).firstChild)
                            }
                        }
                    }

                }
                //-------------------------------------------------------------
                if (elem.id == 'BtnPSubmit') {

                    var PSubmit = $get("txtPSubmit").value

                    switch (PSubmit) {
                        case "New":


                            CreateNewDepartment()
                            break;
                        case "NewTree":

                            if ($get("txtPAlert").value != "")
                                SetMsg($get("txtPAlert").value)
                            else
                                CreateNewDepartmentFromTree(form1.txtTreeDepartmentIDSelected.value)
                            break;
                        case "Edit":

                            if ($get("txtPAlert").value != "") {
                                SetMsg($get("txtPAlert").value)
                            }
                            else {
                                PopupCreate.style.display = "inline"
                                document.getElementById("txtFlagMode").value = "2";
                                EditDepartment()
                            }
                            break;
                        case "EditTree":
                            if ($get("txtPAlert").value != "")
                                SetMsg($get("txtPAlert").value)
                            else {
                                PopupCreate.style.display = "inline"
                                document.getElementById("txtFlagMode").value = "2";
                                EditDepartmentFromTree()
                            }
                            break;
                        case "Save":
                            if ($get("txtPAlert").value != "") {
                                PopupCreate.style.display = "none"
                                SetMsg($get("txtPAlert").value)
                                //                                $get("txtDepartmentID").value = "0";
                                form1.txtTreeDepartmentIDSelected.value = "0";

                            }


                            if (document.getElementById("txtDepartmentID").value != "0" && document.getElementById("txtDepartmentID").value != "")
                                TVNew.SelectNodeById(document.getElementById("txtDepartmentID").value);
                            break;
                        case "SaveNew":

                            document.getElementById("txtFlagMode").value = "1";
                            document.getElementById("txtDepartmentID").value = "0"
                            form1.txtTreeDepartmentIDSelected.value = "0";
                            if ($get("txtPAlert").value != "") {
                                SetMsg($get("txtPAlert").value)
                                PopupCreate.style.display = "inline"
                            }
                            if ($get("txtNewDepartmentCode").value != "")
                                CreateNewDepartment();
                            $get("txtDepartmentID").value = "0";
                            form1.txtTreeDepartmentIDSelected.value = "0";

                            if (document.getElementById("txtDepartmentID").value != "0" && document.getElementById("txtDepartmentID").value != "")
                                TVNew.SelectNodeById(document.getElementById("txtDepartmentID").value);
                            break;
                    }

                    $get("txtPAlert").value = "";
                    $get("txtPSubmit").value = "";

                }

                //-------------------------------------------------------------
                if (elem.id == 'BtnSubmit') {
                    str = "";

                    //-----------------
                    if ($get("txtSubmit").value == "DelDepartment") {
                        $get("txtSubmit").value = "";
                        SetMsg($get("txtAlert").value)

                        if (document.getElementById("txtDepartmentID").value != "0" && document.getElementById("txtDepartmentID").value != "")
                            TVNew.SelectNodeById(document.getElementById("txtDepartmentID").value);
                    }



                    if ($get("txtSubmit").value == "DepartmentPaste") {
                        $get("txtSubmit").value = "";
                        form1.txtDeptCopied.value = ""
                        form1.txtTreeDepartmentIDSelected.value = ""
                        form1.txtTreeAction.value = ""
                        SetMsg($get("txtAlert").value)

                        if (document.getElementById("txtDepartmentID").value != "0" && document.getElementById("txtDepartmentID").value != "")
                            TVNew.SelectNodeById(document.getElementById("txtDepartmentID").value);
                    }

                    if ($get("txtSubmit").value == "DeptMergePaste") {
                        $get("txtSubmit").value = "";
                        form1.txtDeptCopied.value = ""
                        form1.txtTreeDepartmentIDSelected.value = ""
                        form1.txtTreeAction.value = ""
                        form1.txtXmlTreeNodes.value = ""
                        SetMsg($get("txtAlert").value)
                        //CreateGridXml()
                        if (document.getElementById("txtDepartmentID").value != "0" && document.getElementById("txtDepartmentID").value != "")
                            TVNew.SelectNodeById(document.getElementById("txtDepartmentID").value);
                    }
                    //-----------------

                    if ($get("txtSubmit").value == "Filter") {
                        if (document.getElementById("txtDepartmentID").value != "0" && document.getElementById("txtDepartmentID").value != "") {
                            TVNew.SelectNodeById(document.getElementById("txtDepartmentID").value);
                        }
                    }
                    if ($get("txtSubmit").value == "Modify") {
                        form1.txtXmlGridData.value = ""
                        if ($get("txtAlert").value != "") {
//                            if ($get("txtDelSelectedItem").value == "1" && $get("txtValidate").value == "3")
//                                $get("txtAlert").value = "حذف سمت با موفقيت انجام شد";

                            SetMsg($get("txtAlert").value)

                        }
                    }
                }
                if ($get("txtSubmit").value == 'FilteTree') {
                    var Top, Left;
                    var NewObj = $("#TVNew .SelectedTreeNode")[0];
                    var posX = NewObj.offsetLeft;
                    var posY = NewObj.offsetTop;
                    if (Left != null && Top != null && Div.id == "shadowMessage") {
                        Div.style.top = Top;
                        Div.style.left = Left;
                    }
                    else {
                        while (NewObj.offsetParent) {
                            posX = posX + NewObj.offsetLeft;
                            posY = posY + NewObj.offsetTop;
                            if (NewObj == document.getElementsByTagName('body')[0]) { break }
                            else { NewObj = NewObj.offsetParent; }
                        }
                    }
                    $("div#shadowMessage").attr("scrollTop", posY - 220);
                }
                $get("txtSubmit").value = "";
                ////////////////////////////////////////////////
                $get("txtPAlert").value = "";
                $get("txtPSubmit").value = "";
                $get("txtValidate").value = "";
                $get("txtDelSelectedItem").value = "";
                FillGridPersonRole()
            }
            //===============نمایش وضعیت ها در هنگام فیلتر===============
            function OnClickRdCurr() {
                $get("ShowAllStatus").checked = false;
                $get("txtRdStatus").value = "1";
            }
            //-----------------------
            function OnClickRdShowAll() {
                $get("CurrentStatus").checked = false;
                $get("txtRdStatus").value = "0";
                $get("CmbPerson_NotExitDate").value = "1";
            }
            //=================================================
            function txtDepartmnetCode_onclick() {

            }
            //=================================================
            function onclickChkHead(obj) {
                RowIndex = obj.parentElement.parentElement.rowIndex;

                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML("<Root>" + form1.txtXmlGridData.value + "</Root>");
                var OXmlNode;

                var OGrid = document.getElementById("GrdPersonRole");
                if (OGrid != undefined)
                    if (OGrid.rows.length > 0)
                        if (OGrid.rows(RowIndex).cells(1).firstChild.value != "" && OGrid.rows(RowIndex).cells(1).firstChild.value != 0) {
                            form1.txtHeadNew.value = RowIndex;
                            for (var k = 1; k < OGrid.rows.length; ++k) {
                                OXmlNode = oXmlDoc.documentElement.selectNodes("/Root/Tb[RowIndex=" + k + "]");
                                if (k != RowIndex) {
                                    OGrid.rows(k).cells(8).firstChild.checked = false
                                    if (OXmlNode.length > 0)
                                        OXmlNode[0].selectSingleNode("Head").text = "0";
                                }
                                else {
                                    if (OXmlNode.length > 0)
                                        OXmlNode[0].selectSingleNode("Head").text = "1";
                                }
                            }
                            form1.txtXmlGridData.value = oXmlDoc.xml.replace("<Root>", "");
                            form1.txtXmlGridData.value = form1.txtXmlGridData.value.replace("</Root>", "");
                        }
                        else
                            OGrid.rows(RowIndex).cells(8).firstChild.checked = false;
            }
            //=================================================
            function onclickTreeNode(sender, eventArgs) {
                $("#txtDivWidth").val($("#shadowMessage").css('width'));
            }
        </script>
        <table style="width: 100%" dir="rtl">
            <tr>
                <td align="center">
                    <center>
                        <table dir="rtl">
                            <tr>
                                <td>
                                    واحد سازمانی :
                                </td>
                                <td>
                                    <uc2:ComboBox ID="CmbCodeDept" runat="server" />
                                </td>
                                <td>
                                    شماره پرسنلي:
                                </td>
                                <td>
                                    <uc2:ComboBox ID="CmbPerson" runat="server" />
                                </td>
                                <td>
                                    سمت:
                                </td>
                                <td>
                                    <uc2:ComboBox ID="CmbRoleName" runat="server" />
                                </td>
                                <td style="width: 10px">
                                </td>
                                <td>
                                    <input type="radio" id="CurrentStatus" name="CurrentStatus" runat="server" onclick="OnClickRdCurr()" />
                                    وضعيت جاری
                                </td>
                                <td>
                                    <input type="radio" id="ShowAllStatus" name="ShowAllStatus" runat="server" onclick="OnClickRdShowAll()" />
                                    نمايش همه
                                </td>
                            </tr>
                        </table>
                    </center>
                </td>
            </tr>
            <tr>
                <img style="display: none">
                <td>
                    <uc1:ToolBar ID="OToolBar" runat="server" PageName="OrganChart.aspx" PageID="11110"
                        Paging="1" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div id="MySplitter">
                                <div id="DivRight" style="overflow: auto;">
                                    <table align="right">
                                        <tr>
                                            <td align="right" valign="top">
                                                <div style="width: 100%; scrollbar-hightlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                                    scrollbar-base-color: #B1D3FF; height: 350px">
                                                    <asp:PlaceHolder EnableViewState="false" ID="GridViewPlaceHolder" runat="Server" />
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div style="height: 100%; overflow: auto; overflow-y: scroll" id="shadowMessage">
                                    <div style="border: 2px double #6593CF; overflow-y: hidden">
                                        <div style="height: 100%; overflow-y: hidden">
                                            <table width="100%">
                                                <tr valign="top">
                                                    <td valign="top">
                                                        <div style="border: 2px inset #0072A8; width: 100%;">
                                                            <ComponentArt:TreeView ID="TVNew" runat="server" AutoPostBackOnSelect="true" KeyboardEnabled="true"
                                                                MultipleSelectEnabled="true" DisplayMargin="false" ShowLines="true" CssClass=""
                                                                NodeCssClass="TreeNode" SelectedNodeCssClass="SelectedTreeNode" MultipleSelectedNodeCssClass="MultipleSelectedTreeNode"
                                                                HoverNodeCssClass="HoverTreeNode" NodeEditCssClass="NodeEdit" CutNodeCssClass="CutTreeNode"
                                                                MarginWidth="24" DefaultMarginImageWidth="24" DefaultMarginImageHeight="20" LineImageWidth="19"
                                                                LineImageHeight="20" DefaultImageWidth="16" DefaultImageHeight="16" NodeLabelPadding="3"
                                                                ParentNodeImageUrl="folders.gif" LeafNodeImageUrl="folder.gif" CollapseImageUrl="exp.gif"
                                                                ExpandImageUrl="col.gif" ExpandCollapseImageWidth="19" ExpandCollapseImageHeight="20"
                                                                ImagesBaseUrl="../../../App_Utility/Images/TreeViewImage/" LineImagesFolderUrl="../../../App_Utility/Images/TreeViewLine/"
                                                                ExpandSinglePath="true" OnNodeSelected="TVNew_NodeSelected" ExpandNodeOnSelect="True"
                                                                CollapseNodeOnSelect="False">
                                                                <ClientEvents>
                                                                    <NodeSelect EventHandler="onclickTreeNode" />
                                                                    <ContextMenu EventHandler="TVNew_onContextMenu" />
                                                                </ClientEvents>
                                                            </ComponentArt:TreeView>
                                                        </div>
                                                        <div style="display: none">
                                                            <asp:HiddenField ID="txtTreePersonCode" runat="server" />
                                                            <asp:HiddenField ID="txtDepartmentID" runat="server" />
                                                            <asp:HiddenField ID="txtDelFalg" runat="server" />
                                                            <asp:HiddenField ID="txtAlert" runat="server" />
                                                            <asp:HiddenField ID="txtValidate" runat="server" />
                                                            <asp:HiddenField ID="txtSaveXml" runat="server" />
                                                            <asp:HiddenField ID="txtCurPage" runat="server" />
                                                            <asp:HiddenField ID="txtSearch" runat="server" />
                                                            <asp:HiddenField ID="lblFrom" runat="server" />
                                                            <asp:HiddenField ID="lblTo" runat="server" />
                                                            <asp:HiddenField ID="lblTotal" runat="server" />
                                                            <asp:HiddenField ID="txtRdStatus" runat="server" />
                                                            <asp:Button ID="BtnMenuSubmit" runat="server" />
                                                            <asp:HiddenField ID="txtHead" runat="server" />
                                                            <asp:HiddenField ID="txtHeadNew" runat="server" />
                                                            <asp:HiddenField ID="txtDelSelectedItem" runat="server" />
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div align="center">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div id="PopupCreate" style="display: none; position: absolute; top: 170px; left: 170px;
                                            z-index: 1001">
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td style="border: 2px double #6593CF;">
                                                        <table cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td align="right" style="border: 2px double #6593CF; height: 8px; background-color: #74A0D8;">
                                                                    <img alt="بستن" align="left" style="display: inline" onclick="onclickImgClose()"
                                                                        id="imgClose" src="../../../App_Utility/Images/Icons/close1.png" />
                                                                </td>
                                                            </tr>
                                                            <tr valign="top">
                                                                <td id="TDTree" valign="top">
                                                                    <div class="cssDiv" id="Divtree">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <div align="right">
                                                                                        <table cellpadding="0" cellspacing="0">
                                                                                            <tr>
                                                                                                <td>
                                                                                                    نام واحد
                                                                                                </td>
                                                                                                <td align="right" style="width: 126px;">
                                                                                                    <input id="txtOrgName" runat="server" style="width: 120px;" type="text" class="TxtControls" />
                                                                                                </td>
                                                                                                <td>
                                                                                                    نام واحد مافوق
                                                                                                </td>
                                                                                                <td>
                                                                                                    <select id="SelParentName" runat="server" onkeypress="return KeySort(this,false)"
                                                                                                        class="TxtControls" style="width: 250px">
                                                                                                        <option></option>
                                                                                                    </select>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <input id="BtnParentName" name="BtnShowActive" class="CssHeaderStyle" onclick="OnClickBtnParentName()"
                                                                                                        style="width: 23px; cursor: hand;" type="button" value="..." title="نام واحد مافوق" />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    نوع واحد
                                                                                                </td>
                                                                                                <td>
                                                                                                    <select id="SelOrgType" runat="server" class="TxtControls" style="width: 120px">
                                                                                                        <option></option>
                                                                                                    </select>
                                                                                                </td>
                                                                                                <td>
                                                                                                    کد واحد
                                                                                                </td>
                                                                                                <td>
                                                                                                    <input id="txtDepartmnetCode" runat="server" style="width: 120px;" type="text" class="TxtControls"
                                                                                                        onkeydown="OnKeyDownIntDeptCode(this)" onclick="return txtDepartmnetCode_onclick()" />
                                                                                                </td>
                                                                                                <td>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr id="TrPriority" runat="server">
                                                                                                <td>
                                                                                                    <asp:Label ID="lblPeriority" runat="server" Text="اولويت"></asp:Label>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                                                                                        <ContentTemplate>
                                                                                                            <input id="TxtPeriority" runat="server" style="width: 120px;" type="text" class="TxtControls"
                                                                                                                onkeydown="OnKeyDownInt(this)" disabled="disabled" />
                                                                                                        </ContentTemplate>
                                                                                                        <Triggers>
                                                                                                            <asp:AsyncPostBackTrigger ControlID="BtnPerioritySubmit" EventName="click" />
                                                                                                        </Triggers>
                                                                                                    </asp:UpdatePanel>
                                                                                                </td>
                                                                                                <td style="text-align: right">
                                                                                                    <input id="BtnPriority" name="BtnShowActive" class="CssHeaderStyle" onclick="OnClickBtnPriority()"
                                                                                                        style="width: 23px; cursor: hand;" type="button" value="..." title="اولويت" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <input id="BtnPSave" onclick="OnClickBtnPSave()" style="cursor: hand" type="button"
                                                                                                    class="CssBtnSave" />
                                                                                            </td>
                                                                                            <td>
                                                                                                <input id="BtnPSaveNew" onclick="OnClickBtnPSaveNew()" style="cursor: hand" type="button"
                                                                                                    class="CssBtnSaveAndNew" />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <asp:HiddenField ID="txtNewDepartmentCode" runat="server" />
                                        <asp:HiddenField ID="txtNewOrgType" runat="server" />
                                        <asp:HiddenField ID="txtFlagMode" runat="server" />
                                        <asp:HiddenField ID="txtXmlDepartmnet" runat="server" />
                                        <asp:HiddenField ID="txtDepID" runat="server" />
                                        <asp:HiddenField ID="txtAccessDepartment" runat="server" />
                                        <asp:HiddenField ID="txtPAlert" runat="server" />
                                        <asp:HiddenField ID="txtColseFlag" runat="server" />
                                        <asp:HiddenField ID="txtAllDepartmentXML" runat="server" />
                                        <div style="display: none">
                                            <input type="text" id="txtTempPersonID" name="txtTempPersonID" runat="server" />
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnPSubmit" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div id="SearchPopup" dir="rtl" style="border-left: lightsteelblue 3px solid; border-right: #346fa4 3px solid;
                                            border-top: lightsteelblue 3px solid; border-bottom: #346fa4 3px solid; position: absolute;
                                            top: 200px; left: 200px; display: none; background-color: #e7eeff; right: 400px;
                                            width: 288px; z-index: 1001;">
                                            <table>
                                                <tr>
                                                    <td>
                                                        واحدسازمانی :
                                                        <asp:DropDownList ID="CmbDepartment" runat="server" CssClass="DropDownList" onChange="onChangeCmbDepartment()"
                                                            onkeypress="return KeySort(this,false)" Width="150px">
                                                        </asp:DropDownList>
                                                        <img id="BtnSearchDepartment" alt="انتخاب واحد سازمانی" onclick="onClickBtnSearchDepartment()"
                                                            src="/FrmPresentation/App_Utility/Images/Icons/select.png" />&nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <table id="XTabTable_Header" border="0" cellpadding="0" cellspacing="0" style="border-right: #6666cc thin inset;
                                                            border-top: #6666cc thin solid; border-left: #6666cc thin outset; width: 267px;
                                                            border-bottom: #6666cc thin solid; height: 25px">
                                                            <thead style="display: inline">
                                                                <tr>
                                                                    <td align="center" style="width: 65px; background-color: #e2d8ff">
                                                                        نوع سمت
                                                                    </td>
                                                                    <td align="center" style="width: 63px; background-color: #e2d8ff">
                                                                        نام سمت
                                                                    </td>
                                                                </tr>
                                                            </thead>
                                                        </table>
                                                        <div style="scrollbar-highlight-color: white; overflow: auto; width: 99.81%; scrollbar-arrow-color: black;
                                                            scrollbar-base-color: #b0c4de; height: 88.3%">
                                                            <table id="XTabTable">
                                                                <thead style="display: none">
                                                                </thead>
                                                            </table>
                                                            <input id="BtnOK" name="BtnOK" onclick="onClickBtnOK()" type="button" value="فیلتر" /><input
                                                                id="BtnCancel" name="BtnCancel" onclick="onClickBtnCancel()" type="button" value="انصراف" />
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <asp:HiddenField ID="txtPersonRoles" runat="server" />
                                        <asp:HiddenField ID="txtTmpPRCode" runat="server" />
                                        <asp:HiddenField ID="txtXmlPersonRoles" runat="server" />
                                        <asp:HiddenField ID="txtTmpPDepartmentID" runat="server" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmitPersonRole" EventName="click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="BtnMenuSubmit" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="BtnPSubmit" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmitPerson" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmitPersonRole" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:HiddenField ID="txtPersonValue" runat="server" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmitPerson" EventName="click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div style="display: none">
                                <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                                <input type="text" id="txtDivWidths" name="txtDivWidths" runat="server" />
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmitPerson" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="BtnMenuSubmit" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="BtnPSubmit" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmitPerson" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="BtnSubmitPersonRole" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <div style="display: none">
                        <cc1:MySecurity ID="OnLineUser" runat="server">
                        </cc1:MySecurity>
                        <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
                            runat="server" />
                        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                        <input type="text" id="txtOnlineUserCode" name="txtOnlineUserCode" runat="server" />
                        <input type="text" id="txtFilterFlag" name="txtFilterFlag" runat="server" />
                        <input type="text" id="txtTreeDepartmentIDSelected" name="txtTreeDepartmentIDSelected"
                            runat="server" />
                        <asp:Button ID="BtnPSubmit" runat="server" Text="BtnPSubmit" OnClick="BtnPSubmit_Click" />
                        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                        <asp:Button ID="BtnSubmitPersonRole" runat="server" Text="BtnSubmitPersonRole" OnClick="BtnSubmitPersonRole_Click" />
                        <asp:Button ID="BtnPerioritySubmit" runat="server" Text="BtnPerioritySubmit" OnClick="BtnPerioritySubmit_Click" />
                        <input type="text" id="txtPerioritySubmit" name="txtPerioritySubmit" runat="server" />
                        <input type="text" id="txtPSubmit" name="txtPSubmit" runat="server" />
                        <%--<input type="text" id="txtSubmit" name="txtSubmit" runat="server" />--%>
                        <input type="text" id="txtTempDeptID" name="txtTempDeptID" runat="server" />
                        <input type="text" id="txtDeleteFlag" name="txtDeleteFlag" runat="server" />
                        <input type="text" id="txtDeptCopied" name="txtDeptCopied" runat="server" />
                        <input type="text" id="txtTreeAction" name="txtTreeAction" runat="server" />
                        <input type="text" id="txtXmlTreeNodes" name="txtXmlTreeNodes" runat="server" />
                        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                            runat="server" />
                        <input type="text" id="SDate" name="SDate" runat="server" />
                        <input type="text" id="txtGridDepartmentID" name="txtGridDepartmentID" runat="server" />
                        <input type="text" id="EDate" name="EDate" runat="server" />
                        <asp:Button ID="BtnSubmitPerson" runat="server" Text="BtnSubmitPerson" OnClick="BtnSubmitPerson_Click" />
                        <input type="text" id="txtPersonCode" name="txtPersonCode" runat="server" />
                        <input type="text" id="txtPageID" name="txtPersonCode" runat="server" />
                        <input type="text" id="txtOnLineUser" name="txtPersonCode" runat="server" />
                        <input type="text" id="txtXmlGridData" name="txtXmlGridData" runat="server" />
                        <input type="text" id="txtTmpTree" name="txtTmpTree" runat="server" />
                        <input type="text" id="txtDivWidth" name="txtDivWidth" runat="server" />
                        <input type="text" id="txtPriorityOption" name="txtPriorityOption" runat="server" />
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
        </table>
        <ComponentArt:Menu ID="DepartmentMenu" ExpandSlide="None" ExpandTransition="IrisStar"
            ExpandDelay="250" CollapseSlide="none" CollapseTransition="IrisStar" Orientation="Vertical"
            CssClass="MenuGroup" DefaultGroupCssClass="MenuGroup" DefaultItemLookId="DefaultItemLook"
            DefaultGroupItemSpacing="1px" ImagesBaseUrl="images/" EnableViewState="False"
            ContextMenu="Custom" runat="server" ScrollDownLookId="DefaultItemLook" ScrollUpLookId="DefaultItemLook"
            TopGroupItemSpacing="1px">
            <ClientEvents>
                <ItemSelect EventHandler="DepartmentMenu_OnSelect" />
            </ClientEvents>
            <Items>
                <ComponentArt:MenuItem Text="ايجاد واحد جديد" Value="New">
                </ComponentArt:MenuItem>
                <ComponentArt:MenuItem Text="ويرايش واحد انتخاب شده" Value="Edit">
                </ComponentArt:MenuItem>
                <ComponentArt:MenuItem Text="حذف واحد انتخاب شده فاقد واحد زير مجموعه و سمت و پرسنل فعال"
                    Value="DelDeptNoSubNoRoleNoPerson">
                </ComponentArt:MenuItem>
                <ComponentArt:MenuItem Text="حذف واحد انتخاب شده و حذف واحدهاي زير مجموعه و سمتها و پرسنل فعال"
                    Value="DelDeptYesSubYesRoleYesPerson">
                </ComponentArt:MenuItem>
                <ComponentArt:MenuItem Text="حذف واحدهاي زير مجموعه واحد انتخاب شده فاقد سمت و پرسنل فعال"
                    Value="DelSubDeptNoRoleNoPerson">
                </ComponentArt:MenuItem>
                <ComponentArt:MenuItem Text="حذف واحدهاي زير مجموعه واحد انتخاب شده و سمتها و پرسنل فعال"
                    Value="DelSubDeptYesRoleYesPerson">
                </ComponentArt:MenuItem>
                <ComponentArt:MenuItem Text="حذف پرسنل فعال واحد انتخاب شده" Value="DelPersonDept">
                </ComponentArt:MenuItem>
                <ComponentArt:MenuItem Text="حذف سمتها و پرسنل فعال واحد انتخاب شده" Value="DelRolePersonDept">
                </ComponentArt:MenuItem>
                <ComponentArt:MenuItem Text="اخذ كپي از واحد جاري" Value="DeptCopy">
                </ComponentArt:MenuItem>
                <ComponentArt:MenuItem Text="اخذ كپي از واحد جاري و حذف از محل جاري" Value="DeptCut">
                </ComponentArt:MenuItem>
                <ComponentArt:MenuItem ID="MenuItem1" runat="server" DefaultSubGroupCssClass="MenuGroup"
                    DefaultSubGroupItemSpacing="1px" SubGroupCssClass="MenuGroup" SubGroupItemSpacing="1px"
                    Text="قراردادن واحد كپي شده در محل جاري " Value="DeptPaste">
                </ComponentArt:MenuItem>
                <ComponentArt:MenuItem ID="MenuItem2" runat="server" DefaultSubGroupCssClass="MenuGroup"
                    DefaultSubGroupItemSpacing="1px" SubGroupCssClass="MenuGroup" SubGroupItemSpacing="1px"
                    Text="اخذ كپي از پرسنل واحد انتخاب شده" Value="PersonCopy">
                </ComponentArt:MenuItem>
                <%-- <ComponentArt:MenuItem ID="MenuItem3" runat="server" DefaultSubGroupCssClass="MenuGroup"
                    DefaultSubGroupItemSpacing="1px" SubGroupCssClass="MenuGroup" SubGroupItemSpacing="1px"
                    Text="اخذ كپي از پرسنل واحد جاري و حذف واحد از محل جاري" Value="PersonCut">
                </ComponentArt:MenuItem>--%>
                <ComponentArt:MenuItem ID="MenuItem4" runat="server" DefaultSubGroupCssClass="MenuGroup"
                    DefaultSubGroupItemSpacing="1px" SubGroupCssClass="MenuGroup" SubGroupItemSpacing="1px"
                    Text="قراردادن پرسنل كپي شده در محل جاري" Value="PersonPaste">
                </ComponentArt:MenuItem>
                <%--   <ComponentArt:MenuItem ID="MenuItem5" runat="server" DefaultSubGroupCssClass="MenuGroup"
                    DefaultSubGroupItemSpacing="1px" SubGroupCssClass="MenuGroup" SubGroupItemSpacing="1px"
                    Text="اخذ كپي از يك يا چند واحد و حذف از محل جاري جهت ادغام" Value="DeptMergeCut">
                </ComponentArt:MenuItem>--%>
                <%--   <ComponentArt:MenuItem ID="MenuItem6" runat="server" DefaultSubGroupCssClass="MenuGroup"
                    DefaultSubGroupItemSpacing="1px" SubGroupCssClass="MenuGroup" SubGroupItemSpacing="1px"
                    Text="ادغام واحدهاي كپي شده و قراردادن در محل جاري" Value="DeptMergePaste">
                </ComponentArt:MenuItem>--%>
            </Items>
            <ItemLooks>
                <ComponentArt:ItemLook LookId="DefaultItemLook" CssClass="MenuItem" HoverCssClass="MenuItemHover"
                    LabelPaddingLeft="15" LabelPaddingRight="10" LabelPaddingTop="3" LabelPaddingBottom="3" />
                <ComponentArt:ItemLook LookId="BreakItem" ImageUrl="break.gif" CssClass="MenuBreak"
                    ImageHeight="1" ImageWidth="100%" />
            </ItemLooks>
        </ComponentArt:Menu>
        
    </div>
    
    </form>
   <table id="Layer1" class="cssMenu" dir="rtl" cellpadding="0" cellspacing="0" style="width: 100%;
        height: 100%">
        <tr valign="middle">
            <td align="center" valign="top">
                <div id="DivProgress">
                </div>
           </td>
        </tr>
    </table>
    <div style="display: none">
        <input type="hidden" id="ProgressState" value="0" runat="server" />
    </div>
</body>
</html>
<script type="text/javascript" language="javascript">
    //-----------------------------
    SetProgressBar1();
    document.getElementById("CurrentStatus").checked = true;
    document.getElementById("txtRdStatus").value = "1";
    //-----------------------------
    function SetProgressBar1() {
        try {
            if (Sys != undefined) {
                Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(OpenModelPopup);
                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(CloseModelPopup);
            }
        }
        catch (e) {
        }
        if (navigator.appVersion.split(";")[1].trim() != "MSIE 6.0") {
            document.getElementById("DivProgress").innerHTML = "<div id='MaskedDiv' style='width:20px;height:20px; background-color: #ECF9F8;vertical-align:middle; position: absolute; visibility: hidden;filter: progid:DXImageTransform.Microsoft.Alpha(opacity=50);mazopacity: 0.5;opacity: 0.5;cursor:default; ' align='center'><table  border='0' style='width:100%;height:100%; vertical-align:middle' ><tr style='vertical-align:middle'><td align='center' valign='middle' ><img alt='' src='/TAPresentation/App_Utility/Images/ProgressImage/Loading.gif' /><br /><span style='width: 320px; font-family: Tahoma,Tahoma; font-size: 25px;color: #7439A8; font-weight: bold;'>لطفا منتظر بمانيد</span><br /></td></tr></table></div>";
        }
        else {
            document.getElementById("DivProgress").innerHTML = "<iframe src='/FrmPresentation/App_Utility/Progress/ProgressPage.aspx' id='MaskedFrame' style='vertical-align:middle; position: absolute; visibility: hidden;filter: progid:DXImageTransform.Microsoft.Alpha(opacity=40);mazopacity: 0.4;opacity: 0.4;cursor:default;' ></iframe>   ";
        }
    }
    //--------------------------------------------
    var Version, objProgress
    function OpenModelPopup() {
        Version = navigator.appVersion.split(";")[1]
        objProgress = Version.toString().replace(" ", "") == "MSIE 6.0" ? document.getElementById('MaskedFrame') : document.getElementById('MaskedDiv');
        switch ($("#ProgressState").val()) {
            case "2":
                objProgress.style.visibility = "visible"; objProgress.style.top = document.body.offsetTop; objProgress.style.left = document.body.offsetLeft; objProgress.style.width = document.body.offsetWidth;
                objProgress.style.height = document.body.offsetHeight; OpenMouseProgress(); break;
            case "1": OpenMouseProgress(); break;
            case "0":
                objProgress.style.visibility = "visible"; objProgress.style.top = document.body.offsetTop; objProgress.style.left = document.body.offsetLeft;
                objProgress.style.width = document.body.offsetWidth; objProgress.style.height = document.body.offsetHeight;
        }
    }
    function CloseModelPopup() {
        Version = navigator.appVersion.split(";")[1];
        objProgress = Version.toString().replace(" ", "") == "MSIE 6.0" ? document.getElementById('MaskedFrame') : document.getElementById('MaskedDiv');
        switch ($("#ProgressState").val()) {
            case "2": objProgress.style.visibility = "hidden"; CloseMouseProgress()
                break;
            case "1": CloseMouseProgress()
                break;
            case "0": objProgress.style.visibility = "hidden"
        }
    }
    function OpenMouseProgress() {
        switch ($("#ProgressState").val()) {
            case "2":
                if (Version == "MSIE 6.0")
                    objProgress.contentWindow.document.getElementById("IframeBody").style.setAttribute("cursor", "wait")
                else
                    objProgress.style.setAttribute("cursor", "wait")
            case "0":
            default: var bodyElement = document.getElementsByTagName("body")[0]; bodyElement.style.setAttribute("cursor", "wait")
        }
    }
    function CloseMouseProgress() {
        switch ($("#ProgressState").val()) {
            case "2":
                if (Version == "MSIE 6.0")
                    objProgress.contentWindow.document.getElementById("IframeBody").style.setAttribute("cursor", "default")
                else
                    objProgress.style.cursor = "default"
                break
            case "0": var bodyElement = document.getElementsByTagName("body")[0]; bodyElement.style.cursor = "default"
        }
        $("#ProgressState").val("0");
    }
     
</script>
