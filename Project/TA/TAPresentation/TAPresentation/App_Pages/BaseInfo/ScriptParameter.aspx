<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="ScriptParameter.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.ScriptParameter" ValidateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table >
        <tr id="trr">
            <td id="tdd">
                <uc1:ToolBar ID="OToolBar" runat="server" Paging="1" PageName="ScriptsNew.aspx" />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

                <script type="text/javascript" language="javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                    }
                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    function EndRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                        if ($get(MasterObj + "txtAlert").value != "") {
                            SetMsg($get(MasterObj + "txtAlert").value);
                            if ($get(MasterObj + "txtValidate").value == "1")
                                returnValue = 1
                        }
                        $get(MasterObj + "txtSubmit").value = "";
                        $get(MasterObj + "txtAlertStatus").value = "";
                        $get(MasterObj + "txtAlert").value = "";
                    }
                    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    //                    alert(document.getElementById(MasterObj + "txtSystem"))
                    //                    if (document.getElementById(MasterObj + "txtSystem").value == "1")
                    //                        document.getElementById('OToolBar_BtnSave').disabled = true;
                </script>

            </td>
        </tr>
        <tr><td style="width:920px">
        
        <div style="scrollbar-arrow-color: black; width: 920; border-collapse: separate;
                                                        scrollbar-base-color: #b0c4de; height: 500px; scrollbar-highlight-color: white;
                                                        overflow: auto">
            <table  id="XTabTable" style="border-width: 1px; border-style: solid">
                <tr>
                    <td style="width: 50px" class="CssHeaderStyle">
                        پارامترها
                    </td>
                    <td class="CssHeaderStyle">
                        <img title="ايجاد پارامتر" src="../../App_Utility/Images/Icons/Down1.gif" onclick="onclickRight()" />
                        <img title="حذف پارامتر" src="../../App_Utility/Images/Icons/Up1.gif" onclick="onclickLeft()" />
                    </td>
                </tr>
                <tr>
                    <td  class="CssHeaderStyle">
                         پيشفرض
                    </td>
                    <td class="CssHeaderStyle">
                    </td>
                </tr>
                <tr>
                    <td class="CssHeaderStyle">
                        <img title="ايجاد نمونه" src="../../App_Utility/Images/Icons/Down1.gif" onclick="onclickDown()" />
                        <img title="حذف نمونه" src="../../App_Utility/Images/Icons/Up1.gif" onclick="onclickUp()" />
                    </td>
                    <td class="CssHeaderStyle">
                    </td>
                </tr>
            </table>
            </div>
        </td></tr>
         <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="display: none">
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />
                            <asp:HiddenField ID="txtAlertStatus" runat="server" />
                            <input type="hidden" id="txtScriptID" runat="server" />
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none" >
                <select  id="cmbDefault" class="TxtControls" style="width:100px"><option value="0" >مقدار ثابت</option></select>
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input  type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input  type="text" id="txtXml" name="txtXml" runat="server" />
                    <input type="text" id="txtUpdateXml" name="txtUpdateXml" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtUpdateTemplateName" runat="server" class="TxtControls" />
                    <input type="text" id="txtSystem" runat="server" />
                    <input type="text" id="txtScriptGroups" runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtParamValue" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtParamDesc" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtPageID" name="txtPageID" runat="server" />
                </div>
            </td>
        </tr>
    </table>
      <script language="javascript" type="text/javascript">
       
        //        $get(MasterObj + "txtDesc").value = ""
        //        $get(MasterObj + "txtSQLCommand").value = ""
        var newrowindex = 3;
        var newcellindex = 2;
        BindPage();
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        if (document.getElementById(MasterObj + "txtSystem").value == "1")
            document.getElementById('OToolBar_BtnSave').style.display = "none";

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function BindPage() {
           
            var oGrid = document.all.item("XTabTable")
            if ($get(MasterObj + "txtUpdateXml").value != "") {
                var strXml = $get(MasterObj + "txtUpdateXml").value

                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(strXml);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ScriptParameter");
                for (var i = 0; i < oXmlNodes.length; i++) {
                    onclickRight()
                    oGrid.rows(0).cells(i + 1).firstChild.value = oXmlNodes.item(i).selectSingleNode("Desc").text
                }
                updatecmbDefault()
                for (var i = 0; i < oXmlNodes.length; i++) {
                   
                    if (oXmlNodes.item(i).selectSingleNode("DefaultType").text == "0") {
                        oGrid.rows(1).cells(i + 1).firstChild.value = 0
                        oGrid.rows(1).cells(i + 1).childNodes(1).value = oXmlNodes.item(i).selectSingleNode("DefaultValue").text
                    }
                    else {
                        var defval = oXmlNodes.item(i).selectSingleNode("DefaultValue").text

                        defval = parseInt(defval.substr(1, defval.length - 1))
                        alert(defval)
                        oGrid.rows(1).cells(i + 1).firstChild.value = defval
                        oGrid.rows(1).cells(i + 1).childNodes(1).value = ""
                        oGrid.rows(1).cells(i + 1).childNodes(1).disabled = true
                        oGrid.rows(1).cells(i + 1).childNodes(1).className = 'TxtControlsReadOnly'
                    }
                }

                var oXmlNodes1 = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ParameterInstance");
                var oXmlNodes2;
                var ll=parseInt(oXmlNodes1.length/oXmlNodes.length)
                for (var i = 0; i < ll; i++) {
                    onclickDown()
                    oXmlNodes2 = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/ParameterInstance[InstanceID=" + (i + 1) + "]");
                    for (var j = 0; j < oXmlNodes2.length; j++) {
                        oGrid.rows(i + 2).cells(j + 1).firstChild.value = oXmlNodes2.item(j).selectSingleNode("Value").text
                    }
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function Cleargrd(obj) {
            j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
            newrowindex = 0
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSave() {
            if (checkNotEmpty() == true) {
                MakeXML()
                document.getElementById(MasterObj + "txtSubmit").value = "Save";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function MakeXML() {
            var oGrid = document.all.item("XTabTable")
            var lll = oGrid.rows.length
            var XMLStr = ""
             
             for (var k = 1; k < newcellindex - 1; k++) {
            XMLStr += "<Descr>"
                XMLStr += "<ID>" + k + "</ID>"
                XMLStr += "<Name>" + oGrid.rows(0).cells(k).childNodes(0).value + "</Name>"
                if (oGrid.rows(1).cells(k).childNodes(0).value == 0) {
                    XMLStr += "<Deftype>0</Deftype>"
                    XMLStr += "<DefValue>" + oGrid.rows(1).cells(k).childNodes(1).value + "</DefValue>"
                }
                else {
                    XMLStr += "<Deftype>1</Deftype>"
                    if (oGrid.rows(1).cells(k).childNodes(1).value<10)
                        XMLStr += "<DefValue>p0" + oGrid.rows(1).cells(k).childNodes(0).value + "</DefValue>"
                    else XMLStr += "<DefValue>p" + oGrid.rows(1).cells(k).childNodes(0).value + "</DefValue>"
                }
                XMLStr += "</Descr>"
            }

            for (var i = 2; i < newrowindex - 1; i++) {
            XMLStr +=  oGrid.rows(i).getAttribute("ScriptGroups") 
                for (var j = 1; j < newcellindex - 1; j++) {
                 XMLStr += "<Instance>"
                    XMLStr += "<parameterID>" + j + "</parameterID>"
                    XMLStr += "<InstanceID>" + parseInt(i-1) + "</InstanceID>"
                    XMLStr += "<Value>" + oGrid.rows(i).cells(j).childNodes(0).value + "</Value>"
                     XMLStr += "</Instance>"
                }
            }



            document.getElementById(MasterObj + "txtXml").value = "<Root>" + XMLStr + document.getElementById(MasterObj + "txtScriptGroups").value + "</Root>"
            alert(document.getElementById(MasterObj + "txtXml").value)           
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function checkNotEmpty() {
            var oGrid = document.all.item("XTabTable")
            var lll = oGrid.rows.length
            for (var k = 1; k < newcellindex - 1; k++) {
                if ((oGrid.rows(0).cells(k).childNodes(0).value == "")) {
                    alert("لطفا شرح پارامتر " + k + " ام را وارد کنيد")
                    return false;
                }
            }
            for (var i = 2; i < newrowindex - 1; i++) {
                
                for (var j = 1; j < newcellindex - 1; j++) {
                    if ((oGrid.rows(i).cells(j).childNodes(0).value == "")) {
                        alert("لطفا مقدار پارامتر '" + oGrid.rows(0).cells(j).childNodes(0).value + "' از نمونه " + parseInt(i - 1) + " را وارد کنيد")
                        return false;
                    }
                }
            }
            return true;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function updatecmbDefault() {
            var oGrid = document.all.item("XTabTable")
            var optionEl
            var Svalue=0
            for (var j = 1; j < newcellindex - 1; j++) {
                Svalue=oGrid.rows(1).cells(j).firstChild.value
                oGrid.rows(1).cells(j).firstChild.innerHTML = ""
                optionEl = document.createElement("OPTION")
                oGrid.rows(1).cells(j).firstChild.options.add(optionEl)
                oGrid.rows(1).cells(j).firstChild.all(0).innerText = 'مقدار ثابت'
                oGrid.rows(1).cells(j).firstChild.all(0).value = 0
                var i = 1
                for (var k = 1; k < newcellindex - 1; k++) {
                    optionEl = document.createElement("OPTION")
                    oGrid.rows(1).cells(j).firstChild.options.add(optionEl)
                    oGrid.rows(1).cells(j).firstChild.all(i).innerText = oGrid.rows(0).cells(k).firstChild.value
                    oGrid.rows(1).cells(j).firstChild.all(i).value = k
                    i++;
                }
                oGrid.rows(1).cells(j).firstChild.value = Svalue
                oGrid.rows(1).cells(j).firstChild.attachEvent('onchange', onchangecmbDefault)
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickbtnBaleni() {
            var Obj = window.event.srcElement
            while (Obj.tagName != "TR")
                Obj = Obj.parentElement

            var strUrl = "ScriptGroups.aspx?ScriptID=" + $get(MasterObj + "txtScriptID").value
            + "&Type=chk"
                            + "&InstanceID=" + parseInt(Obj.rowIndex - 1)
                            + "&ToPersonId=" + $get(MasterObj + "txtOnLineUser").value
                            + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                            + "&System=" + $get(MasterObj + "txtSystem").value
            alert(strUrl)
            strUrl = encodeURI(strUrl)
            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth: 500px;center: Yes;help: no;status: no;scroll:no')
            //document.getElementById(MasterObj + "txtScriptGroups").value = rValue

            Obj.setAttribute("ScriptGroups", rValue)
            //alert(rValue)
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onchangecmbDefault() {
            var Obj = window.event.srcElement
            if (Obj.value == 0) {
                Obj.nextSibling.disabled = false
                Obj.nextSibling.className = 'TxtControls'
            }
            else {
                Obj.nextSibling.disabled = true
                Obj.nextSibling.className = 'TxtControlsReadOnly'
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickUp() {
            var oGrid = document.all.item("XTabTable")
            if (newrowindex > 3) {
                oGrid.deleteRow(newrowindex - 2)
                newrowindex--;
            } 
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickLeft() {
            var oGrid = document.all.item("XTabTable")
            if (newcellindex > 2) {
                for (var i = 0; i < newrowindex; i++) {
                    oGrid.rows(i).deleteCell(newcellindex - 2)
                }
                newcellindex--;
                updatecmbDefault()
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function CopyDownRow() {
            var oGrid = document.all.item("XTabTable")
            oGrid.insertRow()
            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).cells(0).innerHTML = oGrid.rows(newrowindex - 1).cells(0).innerHTML
            
            for (var j = 1; j < newcellindex - 1; j++) {
            
                oGrid.rows(newrowindex).insertCell()
                oGrid.rows(newrowindex).cells(j).innerHTML = oGrid.rows(newrowindex - 1).cells(j).innerHTML
                oGrid.rows(newrowindex).cells(j).className = "CssHeaderStyle"

            }
            
            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).cells(newcellindex - 1).innerHTML = oGrid.rows(newrowindex - 1).cells(newcellindex -1).innerHTML
            oGrid.rows(newrowindex).cells(0).className = "CssHeaderStyle"
            oGrid.rows(newrowindex).cells(newcellindex - 1).className = "CssHeaderStyle"
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickDown()  {
            var oGrid = document.all.item("XTabTable")
            CopyDownRow()
          
            oGrid.rows(newrowindex-1).className = "XItemStyle";
            oGrid.rows(newrowindex - 1).cells(0).innerText = "نمونه " + parseInt(parseInt(newrowindex) - 2) + ":"
            oGrid.rows(newrowindex - 1).cells(0).style.width = "50px"
           
            for (var j = 1; j < newcellindex-1; j++) {
                oGrid.rows(newrowindex - 1).cells(j).innerHTML = "<INPUT class='TxtControls' type='text' style='WIDTH: 150px;'>"
                oGrid.rows(newrowindex - 1).cells(j).style.width = "160px"
                
                    oGrid.rows(newrowindex - 1).cells(j).className = "CssAlternatingItemStyle"
            }

            oGrid.rows(newrowindex - 1).cells(0).className = "CssHeaderStyle"
            oGrid.rows(newrowindex - 1).cells(newcellindex - 1).innerHTML = "<IMG onclick='onclickbtnBaleni()' style='height:16px;width:16px; cursor:pointer' src='../../App_Utility/Images/Icons/btnBaleni.gif'   title='مشمولين'> "
                oGrid.rows(newrowindex - 1).cells(newcellindex - 1).className = "CssHeaderStyle"
            
            
            oGrid.rows(newrowindex - 1).align = "center"
            newrowindex++;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function CopyleftColumn() {
            var oGrid = document.all.item("XTabTable")
            
            for (var i = 0; i < newrowindex; i++) {
                oGrid.rows(i).insertCell()
                oGrid.rows(i).cells(newcellindex).innerHTML = oGrid.rows(i).cells(newcellindex - 1).innerHTML
                oGrid.rows(i).cells(newcellindex).className = "CssHeaderStyle"

            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onclickRight() {
            
            var oGrid = document.all.item("XTabTable")
            CopyleftColumn()
            oGrid.rows(0).cells(newcellindex - 1).innerHTML = "<INPUT class='TxtControls' type='text' style='WIDTH: 150px;' onblur='updatecmbDefault()'>"
            oGrid.rows(1).cells(newcellindex - 1).innerHTML = "<select class='TxtControls' style='width:100px'>" + document.getElementById("cmbDefault").innerHTML + "</select><INPUT class='TxtControls' type='text' style='WIDTH: 50px;'>"
            
            for (var i = 2; i < newrowindex-1; i++) {

                oGrid.rows(i).cells(newcellindex - 1).innerHTML = "<INPUT class='TxtControls' type='text' style='WIDTH: 150px;'>"
                
                    oGrid.rows(i).cells(newcellindex - 1).className = "CssAlternatingItemStyle"

            }
            newcellindex++;
            updatecmbDefault()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        
      </script>
</asp:Content>
