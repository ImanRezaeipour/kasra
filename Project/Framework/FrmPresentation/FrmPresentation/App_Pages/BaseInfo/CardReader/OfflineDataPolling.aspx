<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="OfflineDataPolling.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.OfflineDataPolling"
    ValidateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript" src="../../../App_Utility/Scripts/Maskdiv.js"></script>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        window.name = "OfflineDataPolling.aspx"
        aspnetForm.target = window.name;
        //-------------------------------------------
    </script>

    <table style="width: 55%">
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td align="center">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 343px">
                    <tr>
                        <td align="right" dir="rtl">
                            مدل
                        </td>
                        <td align="right">
                            <select id="cmbModel" name="D2" runat="server" onchange="OnChangeCmbModel(this)" style="width: 110px">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            شماره کارتخوان
                        </td>
                        <td align="right">
                            <select id="cmbCardNo" name="cmbCardNo" runat="server" style="width: 110px">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            فايل مورد نظر
                        </td>
                        <td align="right">
                            <asp:FileUpload ID="FileUpload1" runat="server" Width="207px" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
        <input id="txtSessionID" maxlength="10" runat="server" name="txtSessionID" type="text" />
        <input id="txtXmlCardNo" runat="server" name="txtXmlCardNo" type="text" />
        <input id="txtOnLineUser" maxlength="10" runat="server" name="txtOnLineUser" type="text" />
        <input type="text" id="txtSaveData" name="txtSaveData" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtAlert" name="txtAlert" runat="server" />
        <input type="text" id="txtCardReaderID" name="txtCardReaderID" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" />
        <input id="txtPath" type="text" name="txtPath" runat="server" />
    </div>

    <script language="javascript" type="text/javascript">
        OnLoad()
        //-----------------------------------------------------
        function OnLoad() {
            if (document.getElementById(MasterObj + "txtAlert").value != "") {
                if (document.getElementById(MasterObj + "txtAlert").value == "0")
                    alert('خطا در ذخیره سازی قسمتی از اطلاعات')
                else
                    alert('ذخیره با موفقیت انجام شد')
                    
                document.getElementById(MasterObj + "txtAlert").value = ""
            }
        }
        function OnClickBtnCancel() {
            window.close()
        }
        function OnChangeCmbModel(obj) {
            if (obj.value == "" || obj.value == 0)
                return
            var cmbCardNo = document.getElementById(MasterObj + "cmbCardNo")

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlCardNo").value);
            var XmlNodes = oXmlDoc.documentElement.selectNodes("Lcombo[CardReaderModelID=" + document.getElementById(MasterObj + "cmbModel").value + "]");

            cmbCardNo.innerHTML = ""
            var optionEl;
            optionEl = document.createElement("OPTION")
            cmbCardNo.options.add(optionEl)
            cmbCardNo.all(0).innerText = "انتخاب نشده";
            cmbCardNo.all(0).value = 0;

            for (var i = 0; i < XmlNodes.length; i++) {
                optionEl = document.createElement("OPTION")
                cmbCardNo.options.add(optionEl)
                cmbCardNo.all(i + 1).innerText = XmlNodes.item(i).selectSingleNode('Title').text;
                cmbCardNo.all(i + 1).value = XmlNodes.item(i).selectSingleNode('Val').text;
            }
        }
        function OnClickBtnSave() {
            if ((document.getElementById(MasterObj + "cmbCardNo").value == 0 && document.getElementById(MasterObj + "cmbModel").value == 0)
                || (document.getElementById(MasterObj + "cmbCardNo").value == "" && document.getElementById(MasterObj + "cmbModel").value == "")
                ) {
                alert('لطفا اطلاعات را کامل کنید')
                return
            }
            var location = document.getElementById(MasterObj + "FileUpload1").value
            var fileFormat = location.split('.')
            var fStr= fileFormat[fileFormat.length-1].toLowerCase()
            if (location != "" && (fStr == "txt")) {
                document.getElementById(MasterObj + "txtSubmit").value = "Save"
                document.getElementById(MasterObj + "BtnSubmit").click()

            }
            else if (location != "")
                alert("فرمت فايل نادرست است")
        }
    </script>

</asp:Content>
