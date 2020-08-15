﻿var Version, objProgress
function OpenModelPopup() {
    Version = navigator.appVersion.split(";")[1]
    objProgress = Version.toString().replace(" ", "") == "MSIE 6.0" ? document.getElementById('MaskedFrame') : document.getElementById('MaskedDiv');
    switch (document.getElementById("ctl00_ProgressState").value) {
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
    switch (document.getElementById("ctl00_ProgressState").value) {
        case "2": objProgress.style.visibility = "hidden"; CloseMouseProgress()
            break;
        case "1": CloseMouseProgress()
            break;
        case "0": objProgress.style.visibility = "hidden"
    } 
}
function OpenMouseProgress() {
    switch (document.getElementById("ctl00_ProgressState").value) {
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
    switch (document.getElementById("ctl00_ProgressState").value) {
        case "2":
            if (Version == "MSIE 6.0")
                objProgress.contentWindow.document.getElementById("IframeBody").style.setAttribute("cursor", "default")
            else
                objProgress.style.cursor = "default"
            break
        case "0": var bodyElement = document.getElementsByTagName("body")[0]; bodyElement.style.cursor = "default"
    }
    document.getElementById("ctl00_ProgressState").value = "0"
}
     