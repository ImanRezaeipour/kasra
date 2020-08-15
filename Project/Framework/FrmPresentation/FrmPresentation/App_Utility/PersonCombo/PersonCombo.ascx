<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PersonCombo.ascx.cs" Inherits="FrmPresentation.App_Utility.PersonCombo.PersonCombo" %>


<style type="text/css">
        
    .CssBtnDown
    {
        width: 20px;
        height: 22px;
        background-color: #CFD3D0;
        border-style: none;
        background-image: url('/FrmPresentation/App_Utility/PersonCombo/Icon/Down.gif');
    }
    .CssBtnDown:hover
    {
        width: 20px;
        height: 22px;
        background-color: #CFD3D0;
        border-style: none;
        background-image: url('/FrmPresentation/App_Utility/PersonCombo/Icon/DownHover.gif');
    }
    .CssText
    {
        width: 120px;
        height: 22px;
        font-family: KasraTahoma;
        font-size: 12px;
        font-weight: bold;
    }
    .CssGridHeader
    {
        filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#BEC6E7, EndColorStr=#3C51A4);
        font-family: KasraTahoma;
        font-size: 12px;
        font-weight: bold;
        height: 30px;
    }
    .CssGridRow
    {
        font-family: KasraTahoma;
        font-size: 13px;
        background-color: Transaprent;
        border: 1px solid #000000;
        height: 20px;
        cursor: pointer;
    }
    .CssGridRow:hover
    {
        font-family: KasraTahoma;
        font-size: 13px;
        background-color: #D3D3D3;
        border: 1px solid #000000;
        height: 20px;
        cursor: pointer;
    }
    .CssGridRowSelected
    {
        font-family: KasraTahoma;
        font-size: 13px;
        background-color: #F8DA9C;
        border: 1px solid #000000;
        height: 20px;
        cursor: pointer;
    }
</style>
<script language="javascript">
    //////////////////////////PageLoad////////////////////////
    var TimeOutID;
    var RowIndex = 0;
    var ThisID;
    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    function BeginRequestHandler(sender, args) {
        RowIndex=1
    }
    function EndRequestHandler(sender, args) {


        if (document.getElementById(ThisID + "_txtSubmit").value == "Search") {

            FillGrdPerson();
            //document.getElementById(ThisID + "_txtPersonCombo").focus();
        }


        document.getElementById(ThisID + "_txtSubmit").value = "";
        //document.getElementById(ThisID + "_txtPersonCombo").focus();
        grdPerson.focus();
    }
    //////////////////////////PageLoad////////////////////////
    function BtnDown_onclick() {
        
        if (window.event != null && event.srcElement != null) {
            this.id = F_GetUserControlID(event.srcElement);
            ThisID=this.id
        }
        if (this.id != undefined) { 
            if (DivPopup.style.display == "inline") {
                DivPopup.style.top = "";
                DivPopup.style.left = "";
                DivPopup.style.display = "none";
            }
            else {
                document.getElementById(ThisID + "_txtSubmit").value = "Search";
                document.getElementById(ThisID + "_BtnSubmit").click();
            }
        }
        
    }

    function F_GetUserControlID(obj) {
        
        try {
            var strUserControlID = "";
            var iCounter = 0;

            while (++iCounter < 20 && obj != null && obj.IsMainTable == null) {
                obj = obj.parentElement;
                
            }
            if (obj != null && obj.IsMainTable != null && obj.IsMainTable == "true")
                strUserControlID = obj.UserControlID;
           
            return strUserControlID;
        }
        catch (e) {
        }

    }

    function FillGrdPerson() {

        RowIndex = 0;
        
        if (document.getElementById(this.id + "_txtXmlPerson").value != "") {
            
            for (var i = 0; i < grdPerson.rows.length; ++i) {
                grdPerson.deleteRow(0);
            }
            
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(document.getElementById(ThisID+"_txtXmlPerson").value)
            var xmlNodes = oXmlDoc.documentElement.selectNodes('/GeneralEntity/GetPersonsUC')
           
            if (xmlNodes.length != 0) {

                for (var j = 0; j < xmlNodes.length; ++j) {

                    grdPerson.insertRow();
                    if (document.getElementById(ThisID+"_txtPersonCombo").value == xmlNodes.item(j).selectSingleNode('PersonCode').text) {
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

                var NewObj = document.getElementById("BtnDown");
                
                var posX = NewObj.offsetLeft;
                var posY = NewObj.offsetTop;

                while (NewObj.offsetParent) {
                    posX = posX + NewObj.offsetParent.offsetLeft;
                    posY = posY + NewObj.offsetParent.offsetTop;
                    if (NewObj == document.getElementsByTagName('body')[0]) { break }
                    else { NewObj = NewObj.offsetParent; }
                }

                DivPopup.style.top = posY + 22;
                DivPopup.style.left = posX;
                DivPopup.style.display = "inline";

//                grdPerson.focus();
            }
        }
        grdPerson.focus();
        //document.getElementById(ThisID + "_txtPersonCombo").focus();
    }

    function GrdPerson_OnClick(obj) {
        grdPerson.rows(RowIndex).className = "CssGridRow";
        RowIndex = obj.rowIndex;
        grdPerson.rows(RowIndex).className = "CssGridRowSelected";

        document.getElementById(ThisID + "_txtPersonCombo").value = grdPerson.rows(RowIndex).cells(0).innerText;
        document.getElementById(ThisID + "_txtPersonCombo").title = grdPerson.rows(RowIndex).cells(1).innerText;
        document.getElementById(ThisID + "_txtPersonCode").value = grdPerson.rows(RowIndex).cells(0).innerText;
        document.getElementById(ThisID + "_TdDisplayName").innerText = grdPerson.rows(RowIndex).cells(1).innerText;
        
        

        DivPopup.style.top = "";
        DivPopup.style.left = "";
        DivPopup.style.display = "none";

        //document.getElementById(ThisID + "_txtPersonCombo").focus();
    }

    function txtPersonCombo_OnKeyUp(obj) {

        if (event.keyCode == 27) {
            
            DivPopup.style.top = "";
            DivPopup.style.left = "";
            DivPopup.style.display = "none";
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
            TimeOutID = setTimeout("txtpersonComboSubmit('" + obj + "')", 1500);
        }

        //document.getElementById(ThisID + "_txtPersonCombo").focus();

    }

    function txtpersonComboSubmit(obj) {

       document.getElementById(ThisID + "_txtSubmit").value = "Search";
       document.getElementById(ThisID + "_BtnSubmit").click();
   }

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
           document.getElementById(ThisID + "_txtPersonCombo").value = grdPerson.rows(RowIndex).cells(0).innerText;
           document.getElementById(ThisID + "_txtPersonCombo").title = grdPerson.rows(RowIndex).cells(1).innerText;
           document.getElementById(ThisID + "_txtPersonCode").value = grdPerson.rows(RowIndex).cells(0).innerText;
           document.getElementById(ThisID + "_TdDisplayName").innerText = grdPerson.rows(RowIndex).cells(1).innerText;
           
           DivPopup.style.top = "";
           DivPopup.style.left = "";
           DivPopup.style.display = "none";
           
       }
       else if (event.keyCode == 27) {
           DivPopup.style.top = "";
           DivPopup.style.left = "";
           DivPopup.style.display = "none";
       
       }

       //document.getElementById(ThisID + "_txtPersonCombo").focus();
   }

   function txtPersonCombo_OnBlur() {
       DivPopup.style.top = "";
       DivPopup.style.left = "";
       DivPopup.style.display = "none";
   }
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table border="0" id="TBMain" IsMainTable="true" runat="server"  dir="rtl" align="right" 
            cellpadding="0" cellspacing="0" style="border: 1px solid #6699FF;width:300px;" >
            <tr>
                <td id="tdText">
                
                    <input id="txtPersonCombo" type="text" runat="server" class="CssText" onkeyup="txtPersonCombo_OnKeyUp(this)" onblur="txtPersonCombo_OnBlur()" />
                    
                </td>
                <td id="tdBtn">
                    <input id="BtnDown" class="CssBtnDown" type="button" onclick="return BtnDown_onclick()" />
                </td>
                <td align="right" id="TdDisplayName" style="width:160px; font-family: KasraTahoma; font-size: 12px; font-weight: bold;" >
                
                </td>
                <td id="tdHidden" style="display:none;">
                    <div style="display:none;">
                        <asp:TextBox ID="txtXmlPerson" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtSubmit" runat="server" ></asp:TextBox>
                        <asp:Button ID="BtnSubmit" runat="server" onclick="BtnSubmit_Click" />
                        <asp:TextBox ID="txtPersonCode" runat="server" ></asp:TextBox>
                    </div>
                    
                </td>
            </tr>
        </table>
        
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
    </ContentTemplate>
        
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="Click" />
    </Triggers>

</asp:UpdatePanel>