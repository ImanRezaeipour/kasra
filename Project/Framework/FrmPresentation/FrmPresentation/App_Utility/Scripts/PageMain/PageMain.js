var IsSelect = 0;
var MenuItemID, MenuTitle, MenuToolTip, TabContent;
//========================================================
function PageLoad() {
    MenuItemID = $('#txtMenuItemID').val();
    MenuTitle = $('#txtMenuTitle').val();
    MenuToolTip = MenuTitle;
    var PageURL = $("#txtDefaultURL").val();
    //------------------Create Tab----------------------
    $("document").ready(function () {
        $('.container').tabs();
    });
    //------------------Add Tab-------------------------
    AddNewTab(MenuItemID, PageURL);
    if (document.getElementById("txtShowAbout").value == "1")
        document.all.item('DivAboutShow').style.display = "inline";
    else
        document.all.item('DivAboutShow').style.display = "none";
}
//========================================================
function AddNewTab(MenuItemID, PageURL) {
    if (PageURL != "") {
        //-----------------------------------------------
        TabContent = ' <iframe id="F' + MenuItemID + '"  align="right" height="93%" width="100%" scrolling="no" style="overflow-x:scroll;overflow-y:scroll;"  src="'
                + PageURL + "?ToPersonID=" + $("#txtToPersonId").val()
                + "&SessionID=" + $("#txtSessionID").val()
                + "&CompanyFinatialPeriodID=" + $("#txtCompanyFinatialPeriodID").val()
                + "&MenuItemID=" + MenuItemID + '"  ></iframe>'
        //-------------------------------------------------
        $("#addtab").click();
    }
}
//========================================================
function onclickbtnOK() {
    try {
        Dialog1.Close('Close click');
    }
    catch (e) { }
}
//========================================================
function tdMainMenuOnClick() {
    document.getElementById("txtSelMenu").value = "Tree"
    document.all.item('divDesktop').style.display = "none";
    document.all.item('divTreeMenu').style.display = "inline";
    tdDesktop.className = "tdDesktop";
    tdMainMenu.className = "tdMainMenuactive";
    IsSelect = 1;
}
//========================================================
function tdDesktopOnClick() {
    document.getElementById("txtSelMenu").value = "Desktop"
    document.all.item('divDesktop').style.display = "inline";
    document.all.item('divTreeMenu').style.display = "none";
    tdMainMenu.className = "tdMainMenu";
    tdDesktop.className = "tdDesktopactive";
    IsSelect = 2;
}
//========================================================
function imgHideMenuOnClick(obj) {
    document.all.item('tdRight').style.display = "none";
    document.all.item('ImgRestore').style.display = "inline";
}
//========================================================
function imgShowMenuOnClick(obj) {
    document.all.item('tdRight').style.display = "inline";
    document.all.item('ImgRestore').style.display = "none";
}
//========================================================
function TVDesktop_onContextMenu(sender, eventArgs) {
    var e = eventArgs.get_event();
    TVDesktopMenu.showContextMenu(e, eventArgs.get_node());
}
//========================================================
function TVDesktop_OnNodeSelected(sender, eventArgs) {
    OnClickSelectedNode(sender, eventArgs);
}
//========================================================
function TVMenu_OnNodeSelected(sender, eventArgs) {
    OnClickSelectedNode(sender, eventArgs);
}
//========================================================
function OnClickSelectedNode(sender, eventArgs) {
    MenuItemID = eventArgs.get_node().get_id()
    MenuTitle = eventArgs.get_node().get_text();
    MenuToolTip = eventArgs.get_node().get_toolTip();
    var PageURL = eventArgs.get_node().LeftUrl
    //-----------------------------------------------------
    if ($('#t' + MenuItemID).length > 0) //Select Existing Tab
    {
        PageURL= PageURL + "?ToPersonID=" + $("#txtToPersonId").val()
                + "&SessionID=" + $("#txtSessionID").val()
                + "&CompanyFinatialPeriodID=" + $("#txtCompanyFinatialPeriodID").val()
                + "&MenuItemID=" + MenuItemID
        $("#F" + MenuItemID).attr("src", PageURL);
        $('#t' + MenuItemID).click();

    }
    else {
        if (PageURL != undefined)
            AddNewTab(MenuItemID, PageURL);
    }
}
//========================================================
function TVMenu_onContextMenu(sender, eventArgs) {
    if (document.getElementById("txtToPersonId").value == document.getElementById("txtFromPersonId").value) {
        var e = eventArgs.get_event();
        TVTreeMenu.showContextMenu(e, eventArgs.get_node());
    }
}
//========================================================
function TVDesktopMenu_OnSelect(sender, eventArgs) {
    var menuItem = eventArgs.get_item();
    var contextDataNode = menuItem.get_parentMenu().get_contextData();
    document.getElementById("txtTVDesktopID").value = contextDataNode.get_value()
    if (menuItem.get_value() == "Del") {
        document.getElementById("txtSubmit").value = "DesktopDel"
        document.getElementById("BtnSubmit").click()
    }
    else if (menuItem.get_value() == "Up") {
        document.getElementById("txtSubmit").value = "DesktopUp"
        document.getElementById("BtnSubmit").click()
    }
    else if (menuItem.get_value() == "Down") {
        document.getElementById("txtSubmit").value = "DesktopDown"
        document.getElementById("BtnSubmit").click()
    }
    else if (menuItem.get_value() == "Conferment") {

        var strUrl = '../Access/ConfermentMenu.aspx?ID=' + contextDataNode.get_id()
             + '&ToPersonId=' + $get("txtOnLineUserID").value
             + "&SessionID=" + $get("txtSessionID").value
             + "&CompanyFinatialPeriodID=" + $get("txtCompanyFinatialPeriodID").value
          

        strUrl = encodeURI(strUrl)
        var rValue = window.showModalDialog(strUrl, '', 'dialogHeight:300px;dialogWidth:400px;center: Yes;help: no;status: no;scroll: no;')

    }
}
//========================================================
function TVTreeMenu_OnSelect(sender, eventArgs) {
    var menuItem = eventArgs.get_item();
    var contextDataNode = menuItem.get_parentMenu().get_contextData();

    document.getElementById("txtTVDesktopID").value = contextDataNode.get_value()

    if (menuItem.get_value() == "Add") {
        document.getElementById("txtSubmit").value = "DesktopAdd"
        document.getElementById("BtnSubmit").click()
    }
    else if (menuItem.get_value() == "Conferment") {

        var strUrl = '../Access/ConfermentMenu.aspx?ID=' + contextDataNode.get_id()
             + '&ToPersonId=' + $get("txtOnLineUserID").value
             + "&SessionID=" + $get("txtSessionID").value
             + "&CompanyFinatialPeriodID=" + $get("txtCompanyFinatialPeriodID").value

        strUrl = encodeURI(strUrl)
        var rValue = window.showModalDialog(strUrl, '', 'dialogHeight:300px;dialogWidth:400px;center: Yes;help: no;status: no;scroll: no;')

    }
}
//========================================================
function onclickHelp() {
    window.open("../../App_Utility/Images/PageMain/KasraUserGuide-User.pdf")
}
//========================================================
$(function () {
    $("#addtab").click(function () {
        $("#tabcontent p").hide();
        addtab(MenuItemID, MenuTitle);
        return false;
    });
    //========================================================
    function addtab(MenuItemID, MenuTitle) {
        $('img.close').hide();
        $('li').removeClass('ui-tabs-selected ui-state-active');
        var closetab = '<img id="close' + MenuItemID + '"  src="../../App_Utility/Images/Icons/close2.gif" class=close  style="font-size:10px;cursor:pointer"  title="بستن" />';
        $("#tabul").append("<li  id='t" + MenuItemID + "' title='" + MenuToolTip + "' > " + "<div style='float:left' >" + "&nbsp;&nbsp;" + MenuTitle + "&nbsp;&nbsp;&nbsp;" + closetab + "&nbsp;&nbsp;" + "</div>" + "</li>");
        $("#t" + MenuItemID).addClass('ui-state-default ui-corner-top ui-tabs-selected ui-state-active');
        $("#tabcontent").append('<p   id="c' + MenuItemID + '">' + TabContent + '</p>');

        $("#t" + MenuItemID).bind("click", function () {
            $('li').removeClass('ui-tabs-selected ui-state-active');
            $("#t" + MenuItemID).addClass('ui-tabs-selected ui-state-active');
            $("#tabcontent p").hide();
            $("#c" + MenuItemID).show();
            $('img.close').hide();
            $("#close" + MenuItemID).show();
        });

        $("#close" + MenuItemID).bind("click", function () {
            $("#tabcontent p").hide();
            $('li').removeClass('ui-tabs-selected ui-state-active');
            $("#t" + MenuItemID).prev().addClass('ui-tabs-selected ui-state-active');

            if ($("#t" + MenuItemID).prev()[0].id != "litab")
                $("#" + $("#t" + MenuItemID).prev()[0].id.replace("t", "close")).show();
            else {
                if ($("img.close").length > 1) {
                    $("#" + $("img.close")[1].id).show();
                    $("#" + $("img.close")[1].id.replace("close", "t")).addClass('ui-tabs-selected ui-state-active');
                    $("#" + $("img.close")[1].id.replace("close", "c")).show();
                }
            }

            $("#c" + MenuItemID).prev().show();
            $(this).parent().parent().remove();
            $("#c" + MenuItemID).remove();

            return false;
        });
    }

});
//=================================================================
//===============راهنما===========================================
http_check = getHTTPObject();

function getHTTPObject() {
    //Create a boolean variable to check for a valid Internet Explorer instance.
    var xmlhttp = false;
    //Check if we are using IE.
    try {
        //If the Javascript version is greater than 5.
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
        //If not, then use the older active x object.
        try {
            //If we are using Internet Explorer.
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (E) {
            //Else we must be using a non-IE browser.
            xmlhttp = false;
        }
    }
    //If we are using a non-IE browser, create a javascript instance of the object.
    if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
        xmlhttp = new XMLHttpRequest();
    }

    return xmlhttp;
}
//---------------------------------for IE-------------------------------
if ("onhelp" in window)
    window.onhelp = function () {
        help();
        return false;
    }
//--------------------------------for others---------------------------

/*  else {
document.onkeydown = function (evt) {
cancelKeypress = (evt.keyCode == 112);
if (cancelKeypress) {  // F1 was pressed             
showMyHelpInsteadOfTheUsualDefaultHelpWindow(true);
return false;
}
}
// --------------------------Additional step required for Opera-----     
document.onkeypress = function (evt) {
if (cancelKeypress)
return false;
}
} */



function help() {

    var address = $("#F" + MenuItemID).attr("src");
    //var address = document.URL;
    // address = address.substr(7) + "<br />";
    var sindex = address.indexOf("/")
    var eindex = address.indexOf(".aspx")
    address = address.substring(sindex, eindex)
    var urlcode = "/Help" + address + ".htm"
    
    
   
    http_check.open("HEAD", urlcode);
    http_check.onreadystatechange = handleHttpResponse_check;
    http_check.send(null);

    function handleHttpResponse_check() {
        if (http_check.readyState == 4) {
            if (http_check.status == 200) {
                window.showHelp(urlcode, window, "dialogHeight: 400px;dialogWidth: 600px;center: Yes;help: no;status: no;minimize:yes;resizable:yes;")
            } else if (http_check.status == 404) {
                alert('این صفحه دارای راهنما نمی باشد')
            }
        }
    }

}
//====================================================================
//====================================================================