var LastSelectedRow = null;
var LastSelectedRowClass = "";
var MasterObj = "ctl00_ContentPlaceHolder1_";
var i = 0;

var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
oXmlDoc.async = "false";
oXmlDoc.loadXML(document.getElementById(MasterObj + 'txtMessages').value)
oXmlDoc.setProperty("SelectionLanguage", "XPath");
var XmlNodes = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/GeMeassageWhenLogin");
if (XmlNodes.length != 0) {
    FillMessage(XmlNodes.item(i).selectSingleNode('Desc').text, XmlNodes.item(i).selectSingleNode('SenderName').text, XmlNodes.item(i).selectSingleNode('MessageSubject').text)
}
function FillMessage(PrivateMsg, Name, Subject) {

    document.getElementById(MasterObj + 'txtPrivateMsg').innerText = PrivateMsg
    document.getElementById(MasterObj + 'txtPrivateMsg').style.width = screen.width - 200;
    document.getElementById(MasterObj + 'txtPrivateMsg').style.height = screen.height -400;
    document.getElementById(MasterObj + 'TdName').innerText = "فرستنده:" + Name;
    document.getElementById(MasterObj + 'txtMessageSubject').innerText = Subject;

}
function OnClickBtnOk() {
    if (XmlNodes.item(i).selectSingleNode('type').text == "12502") {
        Url = "/FrmPresentation/Login.aspx";
        Url = '../../signout.aspx' + "?ToPersonID=" + document.getElementById(MasterObj + 'txtOnlineUser').value + "&SessionID=" + document.getElementById(MasterObj + 'txtSessionID').value;
        window.location.href = Url
    }
    else {
        i = i + 1;
        if (XmlNodes.item(i) != null) {
            FillMessage(XmlNodes.item(i).selectSingleNode('Desc').text, XmlNodes.item(i).selectSingleNode('SenderName').text, XmlNodes.item(i).selectSingleNode('MessageSubject').text)
        }
        else {

            Url = "/FrmPresentation/App_Pages/PageMain/PageMain.aspx?FromPersonId=" + document.getElementById(MasterObj + 'txtFromPersonID').value + " &ToPersonId=" + document.getElementById(MasterObj + 'txtToPersonID').value + " &SessionID=" + document.getElementById(MasterObj + 'txtSessionID').value;
            window.location.href = Url

        }
    }
}