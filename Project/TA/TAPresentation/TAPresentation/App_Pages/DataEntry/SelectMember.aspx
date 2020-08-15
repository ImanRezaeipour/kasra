<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="SelectMember.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.SelectMember"  ValidateRequest="false"%>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<script language="javascript" type="text/javascript">
       
        document.body.scroll = "no";
    </script>

    <table>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="ScriptGroups.aspx" />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

                <script type="text/javascript" language="javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                    }

                    function EndRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                        $get(MasterObj + "txtSubmit").value = "";
                        if (($get(MasterObj + "txtTypeView").value == "view") || ($get(MasterObj + "txtSystem").value == "1")) {
                            document.getElementById('OToolBar_BtnOk').style.display = "none"
                            document.getElementById('Table2').style.display = "none"
                            document.getElementById('OToolBar_BtnSelect').style.display = "none"
                            var oGrid = ScriptGroups;
                            ScriptGroups_Header.rows(0).cells(0).style.display = "none"
                            for (var j = 0; j < oGrid.rows.length; j++)
                                oGrid.rows(j).cells(0).style.display = "none"
                        }
                    }
                </script>

            </td>
        </tr>
        <tr><td>
        <table id="Table1" cellspacing="0" cellpadding="0" align="center" border="0">
                                <tr>
                                    <td valign="top" >
                                    
                                        <table id="Table2" cellspacing="1" cellpadding="1" border="0">
                                            <tr style="display:none">
                                                <td style="width: 22px" align="center">
                                                    <input id="chkAllPK" onclick='OnClickchkAllPK(this)' type="checkbox" runat="server"  />
                                                </td><td></td>
                                                <td><div align="right">
                                                    کليه پرسنل 
                                                </div></td>
                                            </tr>
                                            <tr style="display:none">
                                                <td style="width: 22px" align="center">
                                                    <input id="chkEPK" runat="server" onclick='OnClickchkEPK(this)'  type="checkbox" />
                                                </td><td></td>
                                                <td ><div align="right">
                                                    پرسنل زير مجموعه
                                                 </div></td>
                                            </tr>
                                            <tr id="TDD">
                                                <td style="width: 22px" align="center">
                                                    <input id="rdbDepartment" runat="server" name="GroupChk" type="radio" checked />
                                                </td><td></td>
                                                <td style="width: 160px"><div align="right">
                                                   واحد سازماني
                                                 </div></td>
                                            </tr>
                                            <tr id="TDG">
                                                <td style="width: 22px" align="center">
                                                    <input id="rdbGroup" runat="server" name="GroupChk" type="radio" />
                                                </td><td></td>
                                                <td><div align="right">
                                                    گروه خاص
                                                 </div></td>
                                            </tr>
                                            <tr id="TDP"  style="display:none">
                                                <td style="width: 22px" align="center">
                                                    <input id="rdbPerson" runat="server" name="GroupChk" type="radio"  />
                                                </td><td></td>
                                                <td><div align="right">
                                                    پرسنل خاص
                                                 </div></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td  style="height: 219px" valign="top" align="center">
                                        <table id="ScriptGroups_Header" style="width: 275px;">
                                            <tr>
                                                <td class="CssHeaderStyle" style="width: 25px" align="center">
                                                     <input id="chkAll" style="background-color: transparent" onclick="OnClickHeaderChk(this)"
                                                    type="checkbox" name="chkAll">
                                                </td>
                                                <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                    شماره
                                                </td>
                                                <td align="center" class="CssHeaderStyle" style="width: 150px">
                                                    نام
                                                </td>
                                                <td align="center" class="CssHeaderStyle" style="width: 60px">
                                                    نوع
                                                </td>
                                            </tr>
                                        </table>
                                        <div style="width: 300px; height: 300px; scrollbar-highlight-color: white; overflow: auto;
                                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;" align="right">
                                            <table align="center" id="ScriptGroups" style="width: 275px;">
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
        </td></tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width: 500" align="center">
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                   
                                    <asp:HiddenField ID="txtSDate" runat="server" />
                                    <asp:HiddenField ID="txtEDate" runat="server" />
                                    <asp:HiddenField ID="txtAlert" runat="server" />
                                   <asp:HiddenField ID="txtScriptGroupXML" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                <input type="text" id="txtInstanceID" runat="server" />
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="SDate" name="SDate" runat="server" />
                    <input type="text" id="EDate" name="EDate" runat="server" />
                    <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
                    <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
                    <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
                    <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
                    <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                        runat="server" />
                    <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                        runat="server" />
                    <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                    <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                    <input type="text" id="txtID" runat="server" />
                    <input  type="text" id="txtXML" runat="server" />
                    <input type="text" id="txtTypeView" runat="server" />
                    <input type="text" id="txtSystem" runat="server" />
                    <input type="text" id=txtcmbOpr1 runat=server /> 
                     <input type="text" id=txtXmlShowMember runat=server /> 
                    
                </div>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">
       
        returnValue = "";
        var strChk=""
        BindScriptGroups();
        if (($get(MasterObj + "txtTypeView").value == "view") || ($get(MasterObj + "txtSystem").value == "1")) {
            document.getElementById('OToolBar_BtnOk').style.display = "none" 
              
            document.getElementById('TDP').style.display = "none"
            document.getElementById('TDG').style.display = "none"
            document.getElementById('TDD').style.display = "none"
            $get(MasterObj + "chkAllPK").disabled = "disabled"
            $get(MasterObj + "chkEPK").disabled = "disabled"
             
            document.getElementById('OToolBar_BtnSelectScriptGroups').style.display = "none"
            var oGrid = ScriptGroups;
            ScriptGroups_Header.rows(0).cells(0).style.display = "none"
            for (var j = 0; j < oGrid.rows.length; j++)
                oGrid.rows(j).cells(0).style.display = "none"
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function BindScriptGroups() {
            //alert(document.getElementById(MasterObj + "txtScriptGroupXML").value)
            if ((document.getElementById(MasterObj + "txtScriptGroupXML").value != "<DataEntryEntity />") && (document.getElementById(MasterObj + "txtScriptGroupXML").value != "")) {
                var strXml = document.getElementById(MasterObj + "txtScriptGroupXML").value
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(strXml);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/DataEntryEntity/CodeLimitationMember");
                var oXmlNodes1 = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Table1");

                var len = oXmlNodes.length
                var len1 = oXmlNodes1.length
                if (len1 > 0) {
                    for (var i = 0; i < len1; i++) {
                        if (oXmlNodes1.item(i).selectSingleNode("Acronym").text == "AllPK")
                            if (oXmlNodes1.item(i).selectSingleNode("Value").text == "1")
                            document.getElementById(MasterObj + "chkAllPK").checked = true
                        else
                            document.getElementById(MasterObj + "chkAllPK").checked = false

                        if (oXmlNodes1.item(i).selectSingleNode("Acronym").text == "EPK")
                            if (oXmlNodes1.item(i).selectSingleNode("Value").text == "1")
                            document.getElementById(MasterObj + "chkEPK").checked = true
                        else
                            document.getElementById(MasterObj + "chkEPK").checked = false
                    }
                }
                //-----------------------------------------------
                
                if (len > 0) {
                    for (var y = 0; y < len; y++) {
                        var MemberID, MemberName, type;
                        MemberID = oXmlNodes.item(y).selectSingleNode("PersonID").text;
                        MemberName = oXmlNodes.item(y).selectSingleNode("Family").text;
                        type = oXmlNodes.item(y).selectSingleNode("UserFlag").text;

                        //---------
                        strChk += "<TbCode>"
                        strChk += "<CodeID>" + MemberID + "</CodeID>"
                        strChk += "<InstanceID>131</InstanceID>"
                        strChk += "<type>" + type + "</type>"
                        strChk += "<Selected>1</Selected>"

                        strChk += "</TbCode>"
                        //---------
                        var oGrid = ScriptGroups;
                        addRow(MemberID, MemberName, type)
                    }
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnSelectScriptGroups() {

            var strOptions = ""
            var url = ""
            var OUserFlag
            
//            if (document.getElementById(MasterObj + "txtcmbOpr1").value == 3303 && document.getElementById(MasterObj + "rdbGroup").checked == true) {
//                alert("مجاز به انتخاب گروه پرسنلي نمي باشيد")
//                return;
//            } 
            if (document.getElementById(MasterObj + "rdbPerson").checked) {
                OUserFlag = "U"
                url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
                strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
            }
            else if (document.getElementById(MasterObj + "rdbGroup").checked) {

              OUserFlag = "G"
              url = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
              strOptions = "dialogHeight: 500px;dialogWidth: 600px;center: Yes;help: no;status: no"
          }
          else if (document.getElementById(MasterObj + "rdbDepartment").checked) {

              OUserFlag = "D"
              url = "/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/SelectDepartment.aspx?ShowFlag=0&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(MasterObj + "txtGetCompanyFinatialPeriodID").value + "&OnLineUser=" + document.getElementById(MasterObj + "txtOnLineUser").value
              strOptions = "dialogHeight: 620px;dialogWidth: 720px;center: Yes;help: no;status: no"
          }

            //-------------------------------------------------------
            var OSelectedMamber = "";

            if (url != "") {
                OSelectedMamber = window.showModalDialog(url, "", strOptions)
                url = ""
            }
            
            if (OSelectedMamber != undefined && OSelectedMamber != "" && OSelectedMamber != "<Root></Root>")
                CreateGrid(OSelectedMamber, OUserFlag);
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function CreateGrid(OSelectedMamber, Type) {
            
            if (Type == "D")
                OSelectedMamber = OSelectedMamber.substring(3, OSelectedMamber.length )
            
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(OSelectedMamber)

            var xmlNodesTemp = oXmlDoc.documentElement.selectNodes("/Root/Tb")
           
            
            if (xmlNodesTemp.length > 0) {
                for (var i = 0; i < xmlNodesTemp.length; i++) {
                    var MemberID, MemberName;
                    switch (Type) {
                        case 'U':
                            MemberID = xmlNodesTemp.item(i).selectSingleNode('PID').text;
                            MemberName = xmlNodesTemp.item(i).selectSingleNode('PName').text;
                            break

                        case 'G':
                            MemberID = xmlNodesTemp.item(i).selectSingleNode('GroupId').text;
                            MemberName = xmlNodesTemp.item(i).selectSingleNode('GroupName').text;
                            break

                        case 'D':

                            MemberID = xmlNodesTemp.item(i).selectSingleNode('DID').text;
                            MemberName = xmlNodesTemp.item(i).selectSingleNode('DName').text;
                            break
                    }
                    addRow(MemberID, MemberName, Type)

                    addXML(MemberID, Type)
                }
            } 
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function addXML(MemberID, Type) {
            var strXml = "<Root>" + strChk + "</Root>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID=" + MemberID + " and type='" + Type + "']");
            //========================================================
            if (oXmlNodes.length > 0) {
                oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                strXml = oXmlDoc.xml;
                strChk = strXml.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            else {
                strChk += "<TbCode>"
                strChk += "<CodeID>" + MemberID + "</CodeID>"
                strChk += "<InstanceID>" + document.getElementById(MasterObj + "txtInstanceID").value + "</InstanceID>"
                strChk += "<type>" + Type + "</type>"
                strChk += "<Selected>1</Selected>"

                strChk += "</TbCode>"
            }
            
        } 
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function addRow(MemberID, MemberName, type) {
            var oGrid = ScriptGroups;
            
            for (var j = 0; j < oGrid.rows.length; j++) {
                if (oGrid.rows(j).cells(1).innerText == MemberID) {
                    oGrid.rows(j).cells(0).firstChild.checked = true
                    return;
                }
            }
            var oRow = oGrid.insertRow();
            oRow.setAttribute("type", type) //ControlRuleMemberID

            
            if ((oGrid.rows.length - 1) % 2 == 0)
                oRow.className = "CssItemStyle"
            else
                oRow.className = "CssAlternatingItemStyle";

            var oCell0 = oRow.insertCell();
            oCell0.innerHTML = "<INPUT type='checkbox' onclick='OnClickChk(this)'  checked />";
            oCell0.className = "XTabTable";
            oCell0.style.width = "25px"
            oCell0.align = "center"

            var oCell1 = oRow.insertCell();
            oCell1.innerText = MemberID;
            oCell1.style.width = "60px"
            oCell1.align = "center";

            var oCell2 = oRow.insertCell();
            oCell2.innerText = ((MemberName.length > 30) ? MemberName.substring(0, 25) + "..." : MemberName);
            oCell2.title = MemberName;
            oCell2.style.width = "150px"
            oCell2.align = "center";

            var tempSrc = "";
            var picTitle = "";
            switch (type) {
                case "U":
                    tempSrc = "../../App_Utility/Images/Icons/Personel.gif"
                    picTitle = "پرسنل"
                    break
                case "G":
                    tempSrc = "../../App_Utility/Images/Icons/PGroup.gif"
                    picTitle = "گروه"
                    break
                case "D":
                    tempSrc = "../../App_Utility/Images/Icons/protectandshareworkbook.gif"
                    picTitle = "واحدسازماني"
                    break
            }
            var oCell3 = oRow.insertCell();
            oCell3.innerHTML = "<IMG src=" + tempSrc + " title=" + picTitle + "  border='0'>"
            oCell3.className = "XTabTable";
            oCell3.style.width = "60px"
            oCell3.align = "center"
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!EndPaging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnCancel() {
            window.close()
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnOk() {
            //CreateStr()
            returnValue = strChk
            
            window.close();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function CreateStr() {
            strChk = "";
            var OGrid = document.getElementById("ScriptGroups");
            var oLen = OGrid.rows.length
            var type=""
            for (var i = 0; i < oLen; i++) {
                if (OGrid.rows(i).cells(0).firstChild.checked) {
                    if (OGrid.rows(i).cells(3).firstChild.title == "واحدسازماني")
                        type = "D"
                    else if (OGrid.rows(i).cells(3).firstChild.title == "گروه")
                        type = "G"
                    else if (OGrid.rows(i).cells(3).firstChild.title == "پرسنل")
                        type = "U"
                    strChk += "<TbCode><CodeID>" + OGrid.rows(i).cells(1).innerText + "</CodeID>"
                    strChk += "<InstanceID>" + document.getElementById(MasterObj + "txtInstanceID").value + "</InstanceID>"
                    strChk += "<type>" + type + "</type>"
                    strChk += "<Selected>1</Selected></TbCode>"
                } 
            }
            
            if (document.getElementById(MasterObj + "chkAllPK").checked == true) {
                strChk += "<TbCode>"
                strChk += "<CodeID>AllPK</CodeID>"
                strChk += "<InstanceID>" + document.getElementById(MasterObj + "txtInstanceID").value + "</InstanceID>"
                strChk += "<type>0</type>"
                strChk += "<Selected>1</Selected>"
                strChk += "</TbCode>"
            }
            if (document.getElementById(MasterObj + "chkEPK").checked == true) {
                strChk += "<TbCode>"
                strChk += "<CodeID>EPK</CodeID>"
                strChk += "<InstanceID>" + document.getElementById(MasterObj + "txtInstanceID").value + "</InstanceID>"
                strChk += "<type>0</type>"
                strChk += "<Selected>1</Selected>"
                strChk += "</TbCode>"
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickchkEPK(obj) {
            //========================================================
            var strXml = "<Root>" + strChk + "</Root>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID='EPK' and type='0']");
            //========================================================
            if (oXmlNodes.length > 0) {
                if (obj.checked == true)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                else
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                strXml = oXmlDoc.xml;
                strChk = strXml.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            else {
                strChk += "<TbCode>"
                strChk += "<CodeID>EPK</CodeID>"
                strChk += "<InstanceID>" + document.getElementById(MasterObj + "txtInstanceID").value + "</InstanceID>"
                strChk += "<type>0</type>"

                if (obj.checked == false)
                    strChk += "<Selected>0</Selected>"
                else
                    strChk += "<Selected>1</Selected>"

                strChk += "</TbCode>"
            }
            
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickchkAllPK(obj) {
            //========================================================
            var strXml = "<Root>" + strChk + "</Root>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID='AllPK' and type='0']");
            //========================================================
            if (oXmlNodes.length > 0) {
                if (obj.checked == true)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                else
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                strXml = oXmlDoc.xml;
                strChk = strXml.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            else {
                strChk += "<TbCode>"
                strChk += "<CodeID>AllPK</CodeID>"
                strChk += "<InstanceID>" + document.getElementById(MasterObj + "txtInstanceID").value + "</InstanceID>"
                strChk += "<type>0</type>"

                if (obj.checked == false)
                    strChk += "<Selected>0</Selected>"
                else
                    strChk += "<Selected>1</Selected>"

                strChk += "</TbCode>"
            }
            
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickHeaderChk(obj) {
            var OGrid = document.getElementById("ScriptGroups");
            var oLen = OGrid.rows.length

            for (var i = 0; i < oLen; i++) {
                OGrid.rows(i).cells(0).firstChild.checked = obj.checked
                OnClickChk(OGrid.rows(i).cells(0).firstChild);
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickChk(obj) {

            var oGrid = obj.parentElement;
            while (oGrid.tagName != "TABLE")
                oGrid = oGrid.parentElement

            var oRow = obj.parentElement;
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement
            var oIndex = oRow.rowIndex
            //========================================================
            var strXml = "<Root>" + strChk + "</Root>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode [ CodeID=" + oGrid.rows(oIndex).cells(1).innerText + " and type='" + oGrid.rows(oIndex).type + "']");
            //========================================================
            if (oXmlNodes.length > 0) {
                if (oGrid.rows(oIndex).cells(0).firstChild.checked == true)
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                else
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0

                strXml = oXmlDoc.xml;
                strChk = strXml.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            else {
                strChk += "<TbCode>"
                strChk += "<CodeID>" + oGrid.rows(oIndex).cells(1).innerText + "</CodeID>"
                strChk += "<type>" + oGrid.rows(oIndex).type + "</type>"
                
                if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
                    strChk += "<Selected>0</Selected>"
                else
                    strChk += "<Selected>1</Selected>"

                strChk += "</TbCode>"
            }
            
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetChk() {
            var i = 0;
            var j = 0;

            var OGrid = document.getElementById("GrdScriptGroups");
            if (OGrid == null)
                return
            var PageSize = OGrid.rows.length
            var strXml = "<Root>" + strChk + "</Root>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/TbCode");

            for (j = 0; j < oXmlNodes.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    if (OGrid.rows(i).cells(1).innerText == oXmlNodes.item(j).selectSingleNode("CodeID").text) {
                        if (oXmlNodes.item(j).selectSingleNode("Selected").text == "1")
                            OGrid.rows(i).cells(0).firstChild.checked = true;
                        else
                            OGrid.rows(i).cells(0).firstChild.checked = false;
                    }
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>
    
</asp:Content>
