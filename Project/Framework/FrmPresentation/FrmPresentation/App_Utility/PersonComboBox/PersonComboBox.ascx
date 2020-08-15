<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PersonComboBox.ascx.cs" 
    Inherits="FrmPresentation.App_Utility.PersonComboBox.PersonComboBox" %>
    
    <style type="text/css">
        
    .CssBtnDown
    {
        width: 20px;
        height: 22px;
        background-color: #CFD3D0;
        border-style: none;
        background-image: url('/FrmPresentation/App_Utility/PersonComboBox/Icon/Down.gif');
        cursor:pointer;
    }
    .CssBtnDown:hover
    {
        width: 20px;
        height: 22px;
        background-color: #CFD3D0;
        border-style: none;
        background-image: url('/FrmPresentation/App_Utility/PersonComboBox/Icon/DownHover.gif');
        cursor:pointer;
    }
    .CssText
    {
        width: 120px;
        height: 22px;
        font-family: Tahoma;
        font-size: 12px;
        font-weight: bold;
    }
    .CssGridHeader
    {
        filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#BEC6E7, EndColorStr=#3C51A4);
        font-family: Tahoma;
        font-size: 12px;
        font-weight: bold;
        height: 30px;
    }
    .CssGridRow
    {
        font-family: Tahoma;
        font-size: 13px;
        background-color: Transaprent;
        border: 1px solid #000000;
        height: 20px;
        cursor: pointer;
    }
    .CssGridRow:hover
    {
        font-family: Tahoma;
        font-size: 13px;
        background-color: #D3D3D3;
        border: 1px solid #000000;
        height: 20px;
        cursor: pointer;
    }
    .CssGridRowSelected
    {
        font-family: Tahoma;
        font-size: 13px;
        background-color: #F8DA9C;
        border: 1px solid #000000;
        height: 20px;
        cursor: pointer;
    }
</style>

    <script language="javascript">
        var RowIndex = 0;
        var ThisID = null;
        var TimeOutID;
        
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            
            RowIndex = 1
//            PersonCode = document.getElementById(ThisID + "_txtPersonCombo").value
//            document.getElementById(ThisID + "_txtTempPersonCode").value = PersonCode
            
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        function EndRequestHandler(sender, args) {

            if (ThisID != null && ThisID != undefined) {
                if (document.getElementById(ThisID + "_txtSubmit").value == "Search") {

                    FillGrdPerson();

                }
                else {
                    LoadPersonName()
                }


                document.getElementById(ThisID + "_txtSubmit").value = "";

                try {
                    grdPerson.focus();
                }
                catch (e) {

                } 
            }
            
            //alert(3)
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        function LoadPersonName() {
            if (document.getElementById(this.id + "_txtXmlPerson").value != "" && document.getElementById(ThisID + "_txtInnerText").value!="") {

                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(document.getElementById(ThisID + "_txtXmlPerson").value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/GeneralEntity/GetPersonsUC[PersonCode=' + document.getElementById(ThisID + "_txtInnerText").value + ']')
                if (xmlNodes.length != 0) {

                    document.getElementById(ThisID + "_txtInnerText").title = xmlNodes.item(0).selectSingleNode('DisplayName').text;
                    document.getElementById(ThisID + "_txtDisplayName").innerText = xmlNodes.item(0).selectSingleNode('DisplayName').text;
                }
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        function FillGrdPerson() {
            RowIndex = 0;

            if (document.getElementById(this.id + "_txtXmlPerson").value != "") {

                for (var i = 0; i < grdPerson.rows.length; ++i) {
                    grdPerson.deleteRow(0);
                }

                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(document.getElementById(ThisID + "_txtXmlPerson").value)
                var xmlNodes = oXmlDoc.documentElement.selectNodes('/GeneralEntity/GetPersonsUC')

                if (xmlNodes.length != 0) {

                    for (var j = 0; j < xmlNodes.length; ++j) {

                        grdPerson.insertRow();
                        if (document.getElementById(ThisID + "_txtInnerText").value == xmlNodes.item(j).selectSingleNode('PersonCode').text) {
                            RowIndex = j;
                        }
                        else
                            grdPerson.rows(j).className = "CssGridRow";

                        grdPerson.rows(j).setAttribute('onclick', 'GrdPerson_OnClick(this)');

                        grdPerson.rows(j).insertCell();
                        grdPerson.rows(j).insertCell();

                        grdPerson.rows(j).cells(0).style.width = "100px";
                        grdPerson.rows(j).cells(1).style.width = "200px";

                        grdPerson.rows(j).cells(0).align = "center";
                        grdPerson.rows(j).cells(1).align = "right";

                        grdPerson.rows(j).cells(0).innerText = xmlNodes.item(j).selectSingleNode('PersonCode').text;
                        grdPerson.rows(j).cells(1).innerText = xmlNodes.item(j).selectSingleNode('DisplayName').text;
                    }


                    grdPerson.rows(RowIndex).className = "CssGridRowSelected";

                    ShowDivPopup();
                    
                }
            }



        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        function HideDivPopup() {
            DivPopup.style.top = "";
            DivPopup.style.left = "";
            DivPopup.style.display = "none";

//            try {
//                document.getElementById(ThisID + "_txtInnerText").focus();
//            }
//            catch (e) {

//            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        function ShowDivPopup() {

            
            var NewObj = document.getElementById(ThisID + "_txtDisplayName");

            var posX = NewObj.offsetLeft;
            var posY = NewObj.offsetTop;

            while (NewObj.offsetParent) {
                posX = posX + NewObj.offsetParent.offsetLeft;
                posY = posY + NewObj.offsetParent.offsetTop;
                if (NewObj == document.getElementsByTagName('body')[0]) { break }
                else { NewObj = NewObj.offsetParent; }
            }

            DivPopup.style.top = posY + 22;
            DivPopup.style.left = posX-2;
            DivPopup.style.display = "inline";

            try {
                grdPerson.focus();
            }
            catch (e) {

            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        function BtnDown_onclick() {
            
            if (window.event != null && event.srcElement != null) {
                this.id = F_GetUserControlID(event.srcElement);
                ThisID = this.id
            }
            
            if (this.id != undefined) {
                if (DivPopup.style.display == "inline") {
                    HideDivPopup()
                }
                else {

                    document.getElementById(ThisID + "_txtSubmit").value = "Search";
                    document.getElementById(ThisID + "_BtnSubmitPersonCombo").click();
                    
                }
            }
         }
         ///////////////////////////////////////////////////////////////////////////////////////////////////////////
         function F_GetUserControlID(obj) {
            
             try {
                 var strUserControlID = "";
                 var iCounter = 0;

                 while (++iCounter < 20 && obj != null && obj.IsMainTable == null) {
                     obj = obj.parentElement;
                     
                 }
                 if (obj != null && obj.IsMainTable != null && obj.IsMainTable == "true") {
                     strUserControlID = obj.UserControlID;
                     
                 }
                 return strUserControlID;
             }
             catch (e) {
             }
         }
         ///////////////////////////////////////////////////////////////////////////////////////////////////////////
         function GrdPerson_OnClick(obj) {
            
             grdPerson.rows(RowIndex).className = "CssGridRow";
             RowIndex = obj.rowIndex;
             grdPerson.rows(RowIndex).className = "CssGridRowSelected";

             document.getElementById(ThisID + "_txtInnerText").value = grdPerson.rows(RowIndex).cells(0).innerText;
             document.getElementById(ThisID + "_txtInnerText").title = grdPerson.rows(RowIndex).cells(1).innerText;
             document.getElementById(ThisID + "_txtDisplayName").innerText = grdPerson.rows(RowIndex).cells(1).innerText;



             HideDivPopup();
         }
         ///////////////////////////////////////////////////////////////////////////////////////////////////////////
         function GrdPerson_OnKeyDown(obj) {

             if (event.keyCode == 38) {
                 if (RowIndex > 0) {
                     grdPerson.rows(RowIndex).className = "CssGridRow";
                     --RowIndex;
                     grdPerson.rows(RowIndex).className = "CssGridRowSelected";
                 }

             }
             else if (event.keyCode == 40) {
                 if (RowIndex < grdPerson.rows.length - 1) {
                     grdPerson.rows(RowIndex).className = "CssGridRow";
                     ++RowIndex;
                     grdPerson.rows(RowIndex).className = "CssGridRowSelected";
                 }
             }
             else if (event.keyCode == 13) {
                 document.getElementById(ThisID + "_txtInnerText").value = grdPerson.rows(RowIndex).cells(0).innerText;
                 document.getElementById(ThisID + "_txtInnerText").title = grdPerson.rows(RowIndex).cells(1).innerText;
                 document.getElementById(ThisID + "_txtDisplayName").innerText = grdPerson.rows(RowIndex).cells(1).innerText;

                 HideDivPopup();

             }
             else if (event.keyCode == 27) {
                HideDivPopup();

             }


         }
         ///////////////////////////////////////////////////////////////////////////////////////////////////////////
         function txtInnerTextOnKeyDown(obj) {
             if (event.keyCode == 27) {

                 HideDivPopup();
             }
             if (event.keyCode == 38) {
                 if (RowIndex > 0) {
                     grdPerson.rows(RowIndex).className = "CssGridRow";
                     --RowIndex;
                     grdPerson.rows(RowIndex).className = "CssGridRowSelected";
                 }

             }
             else if (event.keyCode == 40) {
                 if (RowIndex < grdPerson.rows.length - 1) {
                     grdPerson.rows(RowIndex).className = "CssGridRow";
                     ++RowIndex;
                     grdPerson.rows(RowIndex).className = "CssGridRowSelected";
                 }
             }
             else {

                 if (window.event != null && event.srcElement != null) {
                     this.id = F_GetUserControlID(event.srcElement);
                     ThisID = this.id
                 }

                 if (TimeOutID != undefined)
                     clearTimeout(TimeOutID)
                 TimeOutID = setTimeout("txtInnerTextChanged('" + obj + "')", 1000);
             }
         }
         ///////////////////////////////////////////////////////////////////////////////////////////////////////////
         function txtInnerTextChanged(obj) {
             if (document.getElementById(ThisID + "_txtInnerText").value != "") {
                 document.getElementById(ThisID + "_txtSubmit").value = "Search";
                 document.getElementById(ThisID + "_BtnSubmitPersonCombo").click();
             }
             else {
                 document.getElementById(ThisID + "_txtInnerText").value = "";
                 document.getElementById(ThisID + "_txtInnerText").title = "";
                 document.getElementById(ThisID + "_txtDisplayName").innerText = "";
                HideDivPopup()
             }
         }
         ///////////////////////////////////////////////////////////////////////////////////////////////////////////
         function txtInnerTextOnBlur() {
             HideDivPopup()
         }
    </script>


<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table border="0" id="TBMain" IsMainTable="true" runat="server"  dir="rtl" align="right" 
                cellpadding="0" cellspacing="0" style="border: 1px solid #6699FF;width:300px;">
                <tr>
                    <td id="tdText">
                        <asp:TextBox CssClass="CssText" ID="txtInnerText" runat="server" onkeydown="txtInnerTextOnKeyDown(this)" onblur="txtInnerTextOnBlur()"></asp:TextBox>
                    </td>
                    <td id="tdBtn">
                        <input id="BtnDown" runat="server" type="button" onclick="return BtnDown_onclick()" />
                    </td>
                    <td runat="server" id="tdDisplayName" align="right" style="width:160px; font-family: Tahoma; font-size: 12px; font-weight: bold;">
                        <asp:TextBox ID="txtDisplayName" runat="server" ReadOnly="true" Width="90%" Height="100%" BorderStyle="None" BackColor="Transparent" Font-Names="Tahoma" Font-Size="12px" Font-Bold="True" ForeColor="#006600"></asp:TextBox>
                    </td>
                </tr>
        
        </table>
        <div style="display:none;">
            <asp:TextBox ID="txtXmlPerson" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtSubmit" runat="server" ></asp:TextBox>
            
        </div>
        <div id="DivPopup" dir="rtl" style="border: 2px solid #858585; width: 300px; height: 300px; background-color: #EBEBEB; position: absolute; display: none; overflow: auto;">
            <table id="grdPerson_Header" style="width: 100%" border="0" cellpadding="0" 
                cellspacing="0">
                <tr>
                    <td align="center" style="width: 90px" class="CssGridHeader">
                        كد پرسنلي</td>
                    <td align="center" style="width: 210px" class="CssGridHeader">
                        نام خانوادگي و نام</td>
                </tr>
            </table>
            <div dir="rtl" style="width: 100%; height: 90%; overflow: auto">
                <table id="grdPerson" style="width: 100%" border="0" cellpadding="0" 
                    cellspacing="0" onkeydown="GrdPerson_OnKeyDown(this)">
                    <tr>
                        <td align="center" style="width: 90px">
                            &nbsp;</td>
                        <td align="center" style="width: 210px">
                            &nbsp;</td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="display:none;">
            <asp:Button ID="BtnSubmitPersonCombo" runat="server" onclick="BtnSubmitPersonCombo_Click" />
        </div>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="BtnSubmitPersonCombo" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>


    
