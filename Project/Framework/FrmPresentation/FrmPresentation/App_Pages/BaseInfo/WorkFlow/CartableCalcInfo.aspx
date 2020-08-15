<%@ Page Title="-----------------------اطلاعات محاسباتي--------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="CartableCalcInfo.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.WorkFlow.CartableCalcInfo" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .linkClass
        {
            text-decoration:underline;
            text-align:center;
            color:Blue;
            cursor:pointer;
        }
        .TableStyle
        {
            border: thin groove #000000; 
            background-color: #C5D5E9;
            scrollbar-hightlight-color: white;
            overflow: auto; 
            scrollbar-arrow-color: black; 
            scrollbar-base-color: #B1D3FF;
           
            clear: right; 
            clip: rect(auto, auto, auto, auto);
            vertical-align: top; 
            float: right;
            width:400px;
            height:150px;
        }
        .TDStyle
        {
            font-size:14;
            color:black;
            text-align:right;
            background-color:White;
            padding:10;
            background-color:white
        }
    </style>
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="1800" runat="server">
    </asp:ScriptManager>
    <div align="center" id="DicDocGrd" style="vertical-align:top" >
        <table id="TblDocGrd" class="TableStyle" >
        </table>
    </div>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtDocID" name="txtDocID" runat="server" />
        <input type="text" id="txtDocTypeID" name="txtDocTypeID" runat="server" />
        <input type="text" id="txtXmlGrd" name="txtXmlGrd" runat="server" />
        <input type="text" id="txtActionXml" name="txtActionXml" runat="server" />
    </div>
    <script type="text/javascript" src="../../../App_Utility/Scripts/jquery-1.4.1.min.js"></script>
    <script>
        document.body.style.overflowY = "hidden";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var newrowindex = 0, StrChk = "";
        CreateGrid();
        //===============================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        //--------------------------------------------------------------------------------------------
        function BeginRequestHandler(sender, args) {
        }
        //--------------------------------------------------------------------------------------------
        function EndRequestHandler(sender, args) {
        }
        //===============================================================================================
        function CreateGrid() {
            //-----------------------------Xml Grid------------------------------
            var xmlDocGrd = new ActiveXObject("MICROSOFT.XMLDOM")
            xmlDocGrd.async = "false"
            xmlDocGrd.loadXML(document.getElementById(MasterObj + "txtXmlGrd").value)
            //---------------------------------------------------------------------------
            if (($("#" + MasterObj + "txtXmlGrd").val()) != "<BaseInfoEntity />") {
                var XmlNodes = xmlDocGrd.documentElement.selectNodes("/BaseInfoEntity/GrdDocs")
                if (XmlNodes.length > 0) {
                    var len = XmlNodes.length
                    ClearGrd(TblDocGrd)
                    for (var i = 0; i < len; i++)
                        AddRowGrd(TblDocGrd, XmlNodes.item(i), i, xmlDocGrd);
                }
            }

        }
        //===============================================================================================
        function AddRowGrd(oGrid, item, row, xmlDocGrd) {
            var ColType, ColName, ColTitle, isTitle, Name, Title, Width;
            var oRow = oGrid.insertRow();

            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).cells(0).innerText = item.selectSingleNode("Descr").text;
            oGrid.rows(newrowindex).cells(0).className = "TDStyle";
            oGrid.rows(newrowindex).align = "center"
            newrowindex = newrowindex + 1
        }
        //===============================================================================================
        function ClearGrd(obj) {
            var j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
            newrowindex = 0
        }
        //===============================================================================================
    </script>
</asp:Content>
