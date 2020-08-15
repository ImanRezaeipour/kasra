
        document.dir = "rtl";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        //##################################################اصلی
        var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
        oXmlDoc.async = "false";
        oXmlDoc.loadXML($get(MasterObj + 'txtXml').value)
        //################################################
        document.getElementById(MasterObj + "txtPersonCode").value = document.getElementById(MasterObj + "txtAccess").value.split("#")[7];
        var TabSelect = null;
        var GridSelect = null;

        CreateGrid();
        onclickRequest(document.getElementById("Request"), 1);
        //        ChekAccess();
        //===========================================
        function onmouseoverUpDown(obj) {
            if (obj.className != "SelectedTab")
                obj.className = "DefaultTabHover";
        }
        //===============================================
        function onmouseoutUpDown(obj) {
            if (obj.className != "SelectedTab") {
                obj.className = "DefaultTab";
                obj.style.color = "";
            }
        }
        //================================================
        function onmouseoverText(obj) {
            obj.className = "CssTextLink";
        }
        //===================================================
        function onmouseoutText(obj) {
            obj.className = "";
        }
        //===================================================
        function CreateGrid() {

            //------------------------پيامها
            var xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=2]")
            AddToGridMessage(xmlNodes, "Up")
            var xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=16]")
            AddToGridMessage(xmlNodes, "Down")
            //------------------------مجوزهای مورد نیاز
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=3 and Type=0  ]")
            AddToGridCredit(xmlNodes, "Up")
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=4 and Type=0  ]")
            AddToGridCredit(xmlNodes, "Down")
            //=---------------------------------مجوز های درجریان
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=3 and (Type!=0 or Name='Sum') ]")
            AddToGridCreditCur(xmlNodes, "Up")
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=4 and (Type!=0 or Name='Sum')]")
            AddToGridCreditCur(xmlNodes, "Down")
            //------------------------درخواستهای رسیده         
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=6]")
            AddToGridRequest(xmlNodes, "Down")
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=5]")
            AddToGridRequest(xmlNodes, "Up")
            //-------------------------حاضرین غایبین
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=15]")
            AddToGridAbsentPresent(xmlNodes, "Up")
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=14]")
            AddToGridAbsentPresent(xmlNodes, "Down")
            //------------------------------         
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=12]")
            document.getElementById(MasterObj + "SDate").value = xmlNodes.item(0).selectSingleNode("SDate").text;
            document.getElementById(MasterObj + "EDate").value = xmlNodes.item(0).selectSingleNode("StartTime").text;
            if (document.getElementById(MasterObj + "SDate").value == '13')
                document.getElementById(MasterObj + "SDate").value = document.getElementById(MasterObj + "txtToday").value;
            if (document.getElementById(MasterObj + "EDate").value == '13')
                document.getElementById(MasterObj + "EDate").value = document.getElementById(MasterObj + "txtToday").value;
            PersonName.innerText = xmlNodes.item(0).selectSingleNode("Name").text.split("#")[0];
            document.getElementById(MasterObj + "txtPersonCode").value = xmlNodes.item(0).selectSingleNode("Name").text.split("#")[1];
            RemainRest.innerText = xmlNodes.item(0).selectSingleNode("Desc").text;
            //----------------------------------------------------------------------------تفویض اختیار
            document.getElementById(MasterObj + "txtWPID").value = xmlNodes.item(0).selectSingleNode("Type").text.split("#")[1];
            xmlNodes.item(0).selectSingleNode("Type").text = xmlNodes.item(0).selectSingleNode("Type").text.split("#")[0];
            if (xmlNodes.item(0).selectSingleNode("Type").text.length > 30) {
                COName.innerText = xmlNodes.item(0).selectSingleNode("Type").text.substr(0, 28) + "...";
                COName.title = xmlNodes.item(0).selectSingleNode("Type").text;
            }
            else
                COName.innerText = xmlNodes.item(0).selectSingleNode("Type").text;
            //--------------------------------------------------------------------نام جانشین
            if (xmlNodes.item(0).selectSingleNode("EndTime").text.length > 30) {
                CName.innerText = xmlNodes.item(0).selectSingleNode("EndTime").text.substr(0, 28) + "...";
                CName.title = xmlNodes.item(0).selectSingleNode("EndTime").text;
            }
            else
                CName.innerText = xmlNodes.item(0).selectSingleNode("EndTime").text;
            //------------------------------------------------------------------------
            xmlNodes = oXmlDoc.documentElement.selectNodes("/BaseInfoEntity/Abstract[Sign=13]")
            if (xmlNodes.length > 0)
                AdminMsg.innerText = xmlNodes.item(0).selectSingleNode("Desc").text;
            else
                TRAdminMsg.style.display = "none";
            var oDate = new Date()
            var arr
            arr = JD2Persian(Gregorian2JD(oDate.getFullYear(), oDate.getMonth() + 1, oDate.getDate()))
            EnterDate.innerText = arr[2] + "/" + arr[1] + "/" + arr[0];
            EnterTime.innerText = ("0" + oDate.getHours()).substr(("0" + oDate.getHours()).length - 2, 2) + ":" + ("0" + oDate.getMinutes()).substr(("0" + oDate.getMinutes()).length - 2, 2) + ":" + ("0" + oDate.getSeconds()).substr(("0" + oDate.getSeconds()).length - 2, 2);
        }
        //===================================================
        function AddToGridMessage(XmlNodes, Sign) {
            eval("document.getElementById(MasterObj+'LBL" + Sign + "3').innerText=" + XmlNodes.length.toString());
            eval("TDCount" + Sign + "3.innerText=" + XmlNodes.length.toString());
            eval("TBLData" + Sign + "3.style.width='100%'");
            for (var i = 0; i < XmlNodes.length; i++) {
                var ORow = eval("TBLData" + Sign + "3.insertRow()");
                ORow.insertCell();
                ORow.insertCell();

                if (XmlNodes.item(i).selectSingleNode("Name").text.length > 15) {
                    ORow.cells(0).innerText = XmlNodes.item(i).selectSingleNode("Name").text.substr(0, 13) + "..."
                    ORow.cells(0).title = XmlNodes.item(i).selectSingleNode("Name").text;
                }
                else ORow.cells(0).innerText = XmlNodes.item(i).selectSingleNode("Name").text

                if (XmlNodes.item(i).selectSingleNode("Desc").text.length > 120) {
                    ORow.cells(1).innerText = XmlNodes.item(i).selectSingleNode("Desc").text.substr(0, 118) + "..."
                    ORow.cells(1).title = XmlNodes.item(i).selectSingleNode("Desc").text;
                }
                else ORow.cells(1).innerText = XmlNodes.item(i).selectSingleNode("Desc").text;
                ORow.cells(0).style.width = "20%";
                ORow.cells(1).style.width = "80%";
                ORow.cells(0).style.color = XmlNodes.item(i).selectSingleNode("Type").text.trim() == "1" ? "red" : "";
                ORow.cells(0).className = "CssCells";
                ORow.cells(1).className = "CssCells";
            }
        }
        //-=================================================================================
        function AddToGridCreditCur(XmlNodes, Sign) {
            document.getElementById(MasterObj + "LBL4").innerText = document.getElementById(MasterObj + "LBL4").innerText == "" ? "0" : document.getElementById(MasterObj + "LBL4").innerText
            document.getElementById(MasterObj + "LBL4").innerText = parseInt(document.getElementById(MasterObj + "LBL4").innerText) + (XmlNodes.length == 0 ? 0 : XmlNodes.length - 1);

            eval("TDCount" + Sign + "4.innerText=" + XmlNodes.length.toString());
            eval("TBLData" + Sign + "4.style.width='100%'");

            if (XmlNodes.length == 0)
                eval("TDSum" + Sign + "4.innerText=0");
            for (var i = 0; i < XmlNodes.length; i++) {
                if (XmlNodes.item(i).selectSingleNode("Name").text != "Sum") {
                    var ORow = eval("TBLData" + Sign + "4.insertRow()");
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.insertCell();

                    ORow.cells(0).innerText = XmlNodes.item(i).selectSingleNode("Name").text.split("/")[2] + "/" + XmlNodes.item(i).selectSingleNode("Name").text.split("/")[1] + "/" + XmlNodes.item(i).selectSingleNode("Name").text.split("/")[0];
                    ORow.cells(1).innerText = XmlNodes.item(i).selectSingleNode("SDate").text
                    ORow.cells(2).innerText = XmlNodes.item(i).selectSingleNode("EndTime").text
                    ORow.cells(3).innerText = XmlNodes.item(i).selectSingleNode("StartTime").text
                    ORow.cells(4).innerText = XmlNodes.item(i).selectSingleNode("Desc").text

                    ORow.cells(0).style.width = "10%";
                    ORow.cells(1).style.width = "10%";
                    ORow.cells(2).style.width = "10%";
                    ORow.cells(3).style.width = "35%";
                    ORow.cells(4).style.width = "35%";

                    ORow.cells(0).className = "CssCells";
                    ORow.cells(1).className = "CssCells";
                    ORow.cells(2).className = "CssCells";
                    ORow.cells(3).className = "CssCells";
                }
                else {
                    eval("TDCount" + Sign + "4.innerText=(parseInt(TDCount" + Sign + "4.innerText)-1).toString()");
                    eval("TDSum" + Sign + "4.innerText= XmlNodes.item(i).selectSingleNode('EndTime').text");
                }
            }
        }
        //==================================================================================
        function AddToGridCredit(XmlNodes, Sign) {
            document.getElementById(MasterObj + "LBL5").innerText = document.getElementById(MasterObj + "LBL5").innerText == "" ? "0" : document.getElementById(MasterObj + "LBL5").innerText
            document.getElementById(MasterObj + "LBL5").innerText = parseInt(document.getElementById(MasterObj + "LBL5").innerText) + (XmlNodes.length == 0 ? 0 : XmlNodes.length - 1);

            eval("TDCount" + Sign + "5.innerText=" + XmlNodes.length.toString());
            eval("TBLData" + Sign + "5.style.width='100%'");
            if (XmlNodes.length == 0)
                eval("TDSum" + Sign + "5.innerText=0");
            for (var i = 0; i < XmlNodes.length; i++) {
                if (XmlNodes.item(i).selectSingleNode("Name").text != "Sum") {
                    var ORow = eval("TBLData" + Sign + "5.insertRow()");
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.insertCell();

                    ORow.cells(0).innerText = XmlNodes.item(i).selectSingleNode("Name").text.split("/")[2] + "/" + XmlNodes.item(i).selectSingleNode("Name").text.split("/")[1] + "/" + XmlNodes.item(i).selectSingleNode("Name").text.split("/")[0];
                    ORow.cells(1).innerText = XmlNodes.item(i).selectSingleNode("SDate").text
                    ORow.cells(2).innerText = XmlNodes.item(i).selectSingleNode("EndTime").text
                    ORow.cells(3).innerText = XmlNodes.item(i).selectSingleNode("StartTime").text
                    ORow.cells(0).style.width = "25%";
                    ORow.cells(1).style.width = "25%";
                    ORow.cells(2).style.width = "25%";
                    ORow.cells(3).style.width = "25%";
                    ORow.cells(0).className = "CssCells";
                    ORow.cells(1).className = "CssCells";
                    ORow.cells(2).className = "CssCells";
                    ORow.cells(3).className = "CssCells";
                }
                else
                    eval("TDCount" + Sign + "5.innerText=(parseInt(TDCount" + Sign + "5.innerText)-1).toString()");
                eval("TDSum" + Sign + "5.innerText= XmlNodes.item(i).selectSingleNode('SDate').text");
            }
        }
        //==================================================================================
        function AddToGridRequest(XmlNodes, Sign) {
            document.getElementById(MasterObj + "LBL1").innerText = document.getElementById(MasterObj + "LBL1").innerText == "" ? "0" : document.getElementById(MasterObj + "LBL1").innerText
            document.getElementById(MasterObj + "LBL1").innerText = parseInt(document.getElementById(MasterObj + "LBL1").innerText) + XmlNodes.length;

            eval("TDCount" + Sign + "1.innerText=" + XmlNodes.length.toString());
            eval("TBLData" + Sign + "1.style.width='100%'");
            for (var i = 0; i < XmlNodes.length; i++) {
                var ORow = eval("TBLData" + Sign + "1.insertRow()");
                var CellIndex = 0;
                ORow.insertCell();
                ORow.insertCell();
                ORow.insertCell();
                ORow.insertCell();
                if (Sign == "Down") {
                    ORow.insertCell();
                    ORow.insertCell();
                }
                //-----------------------نوع درخواست
                if (XmlNodes.item(i).selectSingleNode("Type").text.length > 20) {
                    ORow.cells(CellIndex).innerText = XmlNodes.item(i).selectSingleNode("Type").text.substr(0, 18) + "...";
                    ORow.cells(CellIndex).title = XmlNodes.item(i).selectSingleNode("Type").text
                }
                else
                    ORow.cells(CellIndex).innerText = XmlNodes.item(i).selectSingleNode("Type").text
                ORow.cells(CellIndex).style.width = "20%";
                ORow.cells(CellIndex).className = "CssCells";
                CellIndex++;
                //---------------------------تاریخ درخواست
                ORow.cells(CellIndex).innerText = XmlNodes.item(i).selectSingleNode("SDate").text.split("/")[0] + "/" + XmlNodes.item(i).selectSingleNode("SDate").text.split("/")[1] + "/" + XmlNodes.item(i).selectSingleNode("SDate").text.split("/")[2].substr(2, 2);
                ORow.cells(CellIndex).style.width = "20%";
                ORow.cells(CellIndex).className = "CssCells";
                CellIndex++;
                //---------------------------از تا
                if (Sign == "Down") {
                    ORow.cells(CellIndex).innerText = XmlNodes.item(i).selectSingleNode("StartTime").text;
                    ORow.cells(CellIndex).style.width = "5%";
                    ORow.cells(CellIndex).className = "CssCells";
                    CellIndex++;

                    ORow.cells(CellIndex).innerText = XmlNodes.item(i).selectSingleNode("EndTime").text;
                    ORow.cells(CellIndex).style.width = "5%";
                    ORow.cells(CellIndex).className = "CssCells";
                    CellIndex++;
                }
                //----------------------------درخواست کننده   
                if (XmlNodes.item(i).selectSingleNode("Name").text.length > 30) {
                    ORow.cells(CellIndex).innerText = XmlNodes.item(i).selectSingleNode("Name").text.substr(0, 28) + "...";
                    ORow.cells(CellIndex).title = XmlNodes.item(i).selectSingleNode("Name").text;
                }
                else
                    ORow.cells(CellIndex).innerText = XmlNodes.item(i).selectSingleNode("Name").text;
                ORow.cells(CellIndex).style.width = CellIndex == 2 ? "25%" : "20%";
                ORow.cells(CellIndex).className = "CssCells";
                CellIndex++;
                //-----------------------شرح درخواست
                if (XmlNodes.item(i).selectSingleNode("Desc").text.length > 30) {
                    ORow.cells(CellIndex).innerText = XmlNodes.item(i).selectSingleNode("Desc").text.substr(0, 28) + "...";
                    ORow.cells(CellIndex).title = XmlNodes.item(i).selectSingleNode("Desc").text;
                }
                else
                    ORow.cells(CellIndex).innerText = XmlNodes.item(i).selectSingleNode("Desc").text;
                ORow.cells(CellIndex).style.width = CellIndex == 3 ? "35%" : "30%";
                ORow.cells(CellIndex).className = "CssCells";
                //-----------------------                
            }
        }
        //===================================================================================
        function AddToGridAbsentPresent(XmlNodes, Sign) {
            if (Sign == "Up")
                document.getElementById(MasterObj + "LBLUp2").innerText = XmlNodes.length;
            else {
                document.getElementById(MasterObj + "LBLDown2").innerText = XmlNodes.length;

                eval("TDCount" + Sign + "2.innerText=" + XmlNodes.length.toString());
                eval("TBLData" + Sign + "2.style.width='100%'");
                for (var i = 0; i < XmlNodes.length; i++) {
                    var ORow = eval("TBLData" + Sign + "2.insertRow()");
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.insertCell();
                    if (XmlNodes.item(i).selectSingleNode("Name").text.length > 25) {
                        ORow.cells(0).title = XmlNodes.item(i).selectSingleNode("Name").text;
                        ORow.cells(0).innerText = XmlNodes.item(i).selectSingleNode("Name").text.substr(0, 23) + "...";
                    }
                    else
                        ORow.cells(0).innerText = XmlNodes.item(i).selectSingleNode("Name").text;

                    ORow.cells(1).innerText = XmlNodes.item(i).selectSingleNode("StartTime").text
                    ORow.cells(2).innerText = XmlNodes.item(i).selectSingleNode("EndTime").text
                    ORow.cells(3).innerText = XmlNodes.item(i).selectSingleNode("Desc").text.split("#")[0];
                    ORow.cells(4).innerText = XmlNodes.item(i).selectSingleNode("Desc").text.split("#")[1];
                    ORow.cells(5).innerText = XmlNodes.item(i).selectSingleNode("Desc").text.split("#")[2];

                    ORow.cells(0).style.width = "20%";
                    ORow.cells(1).style.width = "30%";
                    ORow.cells(2).style.width = "20%";
                    ORow.cells(3).style.width = "10%";
                    ORow.cells(4).style.width = "10%";
                    ORow.cells(5).style.width = "10%";

                    ORow.cells(0).className = "XTabTable";
                    ORow.cells(1).className = "XTabTable";
                    ORow.cells(2).className = "XTabTable";
                    ORow.cells(3).className = "XTabTable";
                    ORow.cells(4).className = "XTabTable";
                    ORow.cells(5).className = "XTabTable";

                    if ((ORow.rowIndex) % 2 == 0)
                        ORow.className = "CssItemStyle"
                    else
                        ORow.className = "CssAlternatingItemStyle";
                }
            }
        }
        //===================================================================
        function onclickSend(Sign) {
            //alert(Sign)
            var url; var State;
            switch (Sign) {
                //----------------------------جانشین               
                case 10:
                    url = "/Framework/Pages/User/ConfermentAccess.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value;
                    State = "dialogHeight: 850px;dialogWidth: 1100px;center: Yes;help: no;status: no";
                    break;
                //-----------------------------تفویض اختیار   
                case 11:
                    url = "/Framework/Pages/User/ViewConfermenter.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value;
                    State = "dialogHeight: 560px;dialogWidth: 950px;center: Yes;help: no;status: no";
                    break;
                case 12:
                    //-------------------------------مانده مرخصی
                    url = "/FrmPresentation/App_Pages/FormGenerator/ReportShow.aspx?pid=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&MenuItemID=34205&wpid=" + document.getElementById(MasterObj + "txtWPID").value;
                    State = "dialogHeight: 760px;dialogWidth: 950px;center: Yes;help: no;status: no";
                    break;
                case 13:
                    //-------------------------------نام کاربری
                    url = "Person/ModifyPersonNew.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&PersonID=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&PersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&Monthly=1";
                    State = "dialogHeight: 560px;dialogWidth: 950px;center: Yes;help: no;status: no";
                    break;
                case 1:
                    //-------------------------------درخواستها                                    
                    url = "/TAPresentation/App_Pages/DataEntry/CreditManagement.aspx?ToPersonId=" + $get(MasterObj + "txtOnlineUserID").value + "&SDate= "+"&EDate= "+"&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
                    + "&PersonCode=" + $get(MasterObj + "txtPersonCode").value + "&Creator= " + "&Flag=1"                    
                    State = "dialogHeight: 580px;dialogWidth: 1200px;center: Yes;help: no;status: no;resizable:yes";
                    break;
                case 2:
                    //-------------------------------حاضرین غایبین
                    url = "/TAPresentation/App_Pages/Reports/AbsentAndPresent.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&PageMode=1&GrdHeight=250px"
                            + "&PersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&PersonName=" + PersonName.innerText + "&eDate=" + document.getElementById(MasterObj + "EDate").value;
                    State = "dialogHeight: 700px;dialogWidth: 1050px;center: Yes;help: no;status: no";
                    break;
                case 3:
                    //-------------------------------پیامها
                    url = "../DataEntry/MessageReport.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value;
                    State = "dialogHeight: 700px;dialogWidth: 1000px;center: Yes;help: no;status: no";
                    break;
                case 7:
                    //-------------------------------حاضرین 
                    url = "/TAPresentation/App_Pages/Reports/AbsentAndPresent.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&PageMode=1&GrdHeight=250px"
                            + "&PersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&PersonName=" + PersonName.innerText + "&eDate=" + document.getElementById(MasterObj + "EDate").value;
                    State = "dialogHeight: 700px;dialogWidth: 1050px;center: Yes;help: no;status: no";
                    break;
                case 8:
                    //-------------------------------غایبین
                    url = "/TAPresentation/App_Pages/Reports/AbsentAndPresent.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&PageMode=1&GrdHeight=250px"
                            + "&PersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&PersonName=" + PersonName.innerText + "&eDate=" + document.getElementById(MasterObj + "EDate").value;
                    State = "dialogHeight: 700px;dialogWidth: 1050px;center: Yes;help: no;status: no";
                    break;
                case 9:
                    //-------------------------------پیامها
                    url = "../DataEntry/MessageReport.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value;
                    State = "dialogHeight: 700px;dialogWidth: 1000px;center: Yes;help: no;status: no";
                    break;
                case 5:
                    //--------------------------------------------- مجوزهای در جریان     
                    url = "/TAPresentation/App_Pages/DataEntry/EnterCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value + "&State=1" +
                    "&SPersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&Flag=1&OnLineUser=" + document.getElementById(MasterObj + "txtOnlineUserID").value;
                    State = "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no";
                    break;
                case 20:
                    //-----------------------------------مجوز های کسر در جریان
                    url = "/TAPresentation/App_Pages/DataEntry/EnterCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value + "&State=1" +
                    "&SPersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&MainCode=10102&Flag=1&OnLineUser=" + document.getElementById(MasterObj + "txtOnlineUserID").value;
                    State = "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no";
                    break;
                case 21:
                    //----------------------------------------مجوز مازاددر جریان
                    url = "/TAPresentation/App_Pages/DataEntry/EnterCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value + "&State=1" +
                    "&SPersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&MainCode=10103&Flag=1&OnLineUser=" + document.getElementById(MasterObj + "txtOnlineUserID").value;
                    State = "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no";
                    break;
                case 6:
                    //--------------------------------------------- مجوزهای مورد نیاز     
                    url = "/TAPresentation/App_Pages/DataEntry/EnterCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value + "&State=1" +
                    "&SPersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&Flag=1&OnLineUser=" + document.getElementById(MasterObj + "txtOnlineUserID").value;
                    State = "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no";
                    break;
                case 22:
                    //-----------------------------------مجوز های کسر مورد نیاز
                    url = "/TAPresentation/App_Pages/DataEntry/EnterCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value + "&State=0" +
                    "&SPersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&MainCode=10102&Flag=1&OnLineUser=" + document.getElementById(MasterObj + "txtOnlineUserID").value;
                    State = "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no";
                    break;
                case 23:
                    //----------------------------------------مجوز مازاد مورد نیاز
                    url = "/TAPresentation/App_Pages/DataEntry/EnterCredit.aspx?ToPersonId=" + document.getElementById(MasterObj + "txtOnlineUserID").value + "&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value + "&SDate=" + document.getElementById(MasterObj + "SDate").value + "&EDate=" + document.getElementById(MasterObj + "EDate").value + "&State=0" +
                    "&SPersonCode=" + document.getElementById(MasterObj + "txtPersonCode").value + "&MainCode=10103&Flag=1&OnLineUser=" + document.getElementById(MasterObj + "txtOnlineUserID").value;
                    State = "dialogHeight: 600px;dialogWidth: 800px;center: Yes;help: no;status: no";
                    break;
            }           
            window.showModalDialog(encodeURI(url), window, State);
        }
        //==================================================================
        function ChekAccess() {
            var str = document.getElementById(MasterObj + "txtAccess").value;
            //-----------------------------------------------------------------دسترسی پیامها
            if (str.split("#")[0] == "0") {
                divMessage.setAttribute("onclick", "");
                divMessage.setAttribute("onmouseover", "");
                divMessage.setAttribute("onmouseout", "");
                divMessage.style.cursor = "Normal";
            }
            if (str.split("#")[1] == "0") {
                divReciving.setAttribute("onclick", "");
                divReciving.setAttribute("onmouseover", "");
                divReciving.setAttribute("onmouseout", "");
                divReciving.style.cursor = "Normal";
            }
            //-----------------------------------------------------------------دسترسی مجوزهای مورد نیاز
            if (str.split("#")[2] == "0") {
                divLackCode.setAttribute("onclick", "");
                divLackCode.setAttribute("onmouseover", "");
                divLackCode.setAttribute("onmouseout", "");
                divLackCode.style.cursor = "Normal";
            }
            if (str.split("#")[3] == "0") {
                divOverCode.setAttribute("onclick", "");
                divOverCode.setAttribute("onmouseover", "");
                divOverCode.setAttribute("onmouseout", "");
                divOverCode.style.cursor = "Normal";
            }
            //            if (str.split("#")[3] == "0" && str.split("#")[2] == "0") {
            divCredit.setAttribute("onclick", "");
            divCredit.setAttribute("onmouseover", "");
            divCredit.setAttribute("onmouseout", "");
            divCredit.style.cursor = "Normal";
            //            }
            //-----------------------------------------------------------------دسترسی درخواستهای رسیده
            if (str.split("#")[4] == "0") {
                divRequest.setAttribute("onclick", "");
                divRequest.setAttribute("onmouseover", "");
                divRequest.setAttribute("onmouseout", "");
                divRequest.style.cursor = "Normal";
            }
            //            if (str.split("#")[4] == "0") {
            divDaily.setAttribute("onclick", "");
            divDaily.setAttribute("onmouseover", "");
            divDaily.setAttribute("onmouseout", "");
            divDaily.style.cursor = "Normal";

            divHoure.setAttribute("onclick", "");
            divHoure.setAttribute("onmouseover", "");
            divHoure.setAttribute("onmouseout", "");
            divHoure.style.cursor = "Normal";
            //            }
            //-----------------------------------------------------------------دسترسی کاردکس
            //            if (str.split("#")[5] == "0") {
            divCardex.setAttribute("onclick", "");
            divCardex.setAttribute("onmouseover", "");
            divCardex.setAttribute("onmouseout", "");
            divCardex.style.cursor = "Normal";

            divCardexsub.setAttribute("onclick", "");
            divCardexsub.setAttribute("onmouseover", "");
            divCardexsub.setAttribute("onmouseout", "");
            divCardexsub.style.cursor = "Normal";
            //            }
            //----------------------------------------------------------------دسترسی حاضرین غایبین
            divAbPresent.setAttribute("onclick", "");
            divAbPresent.setAttribute("onmouseover", "");
            divAbPresent.setAttribute("onmouseout", "");
            divAbPresent.style.cursor = "Normal";

            divPresent.setAttribute("onclick", "");
            divPresent.setAttribute("onmouseover", "");
            divPresent.setAttribute("onmouseout", "");
            divPresent.style.cursor = "Normal";

            divAbsent.setAttribute("onclick", "");
            divAbsent.setAttribute("onmouseover", "");
            divAbsent.setAttribute("onmouseout", "");
            divAbsent.style.cursor = "Normal";
        }
        //==================================================================
        function onclickimg(obj) {
            var posX = obj.offsetLeft; var posY = obj.offsetTop;
            while (obj.offsetParent) {
                posX = posX + obj.offsetParent.offsetLeft;
                posY = posY + obj.offsetParent.offsetTop;
                if (obj == document.getElementsByTagName('body')[0]) { break }
                else { obj = obj.offsetParent; }
            }
            divTools.style.top = posY + 20;
            divTools.style.left = posX + 20;
            divTools.style.display = "inline";

        }
        //==================================================================
        function onclickTableBase() {
            if (window.event.srcElement.tagName != "IMG")
                divTools.style.display = "none";
        }
        //======================================================================
        function onclickRequest(Obj, val) {
            try {
                if (TabSelect == Obj) {
                    if (val != 4 && val != 5)
                        TabSelect.attachEvent("onclick", onclickSend(val));
                }
                else
                    TabSelect.detachEvent("onclick", onclickSend);
            }
            catch (e) {
            }

            if (TabSelect == null) {
                TabSelect = Obj;
                Obj.className = "SelectedTab";
            }
            else {
                TabSelect.style.color = "";
                TabSelect.className = "DefaultTab";
                TabSelect = Obj;
                Obj.className = "SelectedTab";
            }
            if (val != 4 && val != 5) {               
              
                TabSelect.style.cursor = "pointer";
            }
            SetGrid(val);
        }
        //===================================================
        function SetGrid(Sign) {
            if (GridSelect == null) GridSelect = document.getElementById("DivMessage");
            GridSelect.style.display = "none";

            if (document.getElementById("DivOccure").style.display == "inline")
                document.getElementById("DivOccure").style.display = "none"

            switch (Sign) {
                case 1:
                    document.getElementById("DivRequest").style.display = "inline";
                    GridSelect = document.getElementById("DivRequest");
                    break;
                case 2:
                    document.getElementById("DivAbsentPresent").style.display = "inline";
                    GridSelect = document.getElementById("DivAbsentPresent");
                    break;
                case 3:
                    document.getElementById("DivMessage").style.display = "inline";
                    GridSelect = document.getElementById("DivMessage");
                    break;
                case 4:
                    document.getElementById("DivCurCredit").style.display = "inline";
                    GridSelect = document.getElementById("DivCurCredit");
                    break;
                case 5:
                    document.getElementById("DivNeededCredit").style.display = "inline";
                    GridSelect = document.getElementById("DivNeededCredit");
                    document.getElementById("DivOccure").style.display = "inline";
                    break;
            }
        }
        //================================================
        function onmouseoutHideShow(obj) {
            obj.className = "";
        }
        //================================================
        function onmouseoverHideShow(obj) {
            obj.className = "HoverShowHidden";
        }
        //=====================================================
        function onclickHideShow(obj, Sign) {

            obj.firstChild.src = obj.firstChild.src == document.getElementById("Link").href ? "..\\..\\App_Utility\\Images\\Icons\\Down3.gif" : document.getElementById("Link").href;
            eval("Div" + Sign + ".style.display=Div" + Sign + ".style.display=='inline'?'none':'inline'");

            if (Sign.substr(0, 2) != "Up") {
                if (eval("Div" + Sign + ".style.display=='inline'"))
                    eval("Div" + Sign.replace("Down", "Up") + ".style.height='120px'");
                else eval("Div" + Sign.replace("Down", "Up") + ".style.height='240px'");
            }
            else {
                if (eval("Div" + Sign + ".style.display=='inline'"))
                    eval("Div" + Sign.replace("Up", "Down") + ".style.height='120px'");
                else eval("Div" + Sign.replace("Up", "Down") + ".style.height='240px'");
            }
        }
        //======================================================   
    setActiveStyleSheet("winter");

    Calendar.setup({
        align: "BR",
        showOthers: true,
        onClose: closed,
        dateType: 'jalali',
        langNumbers: true,
        button: "EnterDate",
        electric: false

    });
    function de() { }
    //========================================
   