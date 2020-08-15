<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="DefineStep.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Bank.DefineStep" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 520px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td style="width: 120px">
                            نام Step:
                        </td>
                        <td style="width:100%" align="right"><div align="right">
                            <input id="txtStepName" class="TxtControls" type="text" style="width: 400px" 
                                runat="server" align="right" /></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            نام بانک:
                        </td>
                        <td align="right" ><div align="right">
                            <input id="txtDBName" class="TxtControls" type="text" style="width: 400px" 
                                runat="server" align="right"/></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Command</td>
                        <td style="width:100%;" align="right"><div align="right">
                            <textarea id="txtAreaCommand" class="TxtControls" cols="20" dir="ltr" name="S1" rows="2" style="width:400px;height:300px" runat="server"></textarea></div>
                        </td>                       
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />         
        <input type="text" id="txtXmlStep" name="txtXmlStep" runat="server" />
        <input type="text" id="txtStepID" name="txtStepID" runat="server" />   
         <input type="text" id="txtCount" name="txtCount" runat="server" /> 
         <input type="text" id="txtMode" name="txtMode" runat="server" />   
         <input type="text" id="onSAction" name="onSAction" runat="server" />         
         <input type="text" id="onFAction" name="onFAction" runat="server" />
         <input type="text" id="onSS" name="onSS" runat="server" />   
         <input type="text" id="onFS" name="onFS" runat="server" /> 
         <input type="text" id="RetAt" name="RetAt" runat="server" /> 
         <input type="text" id="MinAt" name="MinAt" runat="server" />  
         <input type="text" id="File" name="File" runat="server" />          
    </div>
 <script language="javascript" type="text/javascript">
     var MasterObj = "ctl00_ContentPlaceHolder1_";
     window.document.title = "Step";
     var Str = "<Root></Root>";
     returnValue = "0#";
     
     
     document.getElementById(MasterObj + "txtStepName").select();
     document.getElementById(MasterObj + "txtStepName").focus();
     if (document.getElementById(MasterObj + "txtMode").value == "Edit") {
         document.getElementById('OToolBar_BtnNew').style.visibility = "hidden";
     }
     //============================================
     function OnClickBtnNew() {
         document.getElementById(MasterObj+ "txtStepName").value = "";
         document.getElementById(MasterObj+"txtDBName").value = "";
         document.getElementById(MasterObj+"txtAreaCommand").value = "";
     }
     //=================================
     function OnClickBtnCancel() {
         window.returnValue = returnValue + Str;
         window.close();
     }
     //=================================
     function OnClickBtnSave() {
         if (NotEmpty()) {
             if (document.getElementById(MasterObj + "txtMode").value == "New") {
                 document.getElementById(MasterObj + "txtCount").value = (parseInt(document.getElementById(MasterObj + "txtCount").value) + 1).toString();
                 var oXml = new ActiveXObject("Microsoft.XMLDOM");
                 oXml.async = "false";
                 oXml.loadXML("<Root><Step><ID>" + document.getElementById(MasterObj + "txtStepID").value + "</ID><Comm>" + document.getElementById(MasterObj + "txtAreaCommand").value + "</Comm><DBName>" + document.getElementById(MasterObj + "txtDBName").value + "</DBName><Name>" + document.getElementById(MasterObj + "txtStepName").value + "</Name><Intval>" + document.getElementById(MasterObj + "txtCount").value + "</Intval><onSAction>1</onSAction><onFAction>2</onFAction><onSS>0</onSS><onFS>0</onFS><RetAt>0</RetAt><MinAt>0</MinAt><File></File></Step></Root>");
                 var XmlNode = oXml.documentElement.selectNodes("Step");                          
             }            
                      
             if (document.getElementById(MasterObj + "txtMode").value == "Edit") {
                 Str = "<Root></Root>";
                 var oXml = new ActiveXObject("Microsoft.XMLDOM");
                 oXml.async = "false";
                 oXml.loadXML("<Root><Step><ID>" + document.getElementById(MasterObj + "txtStepID").value + "</ID><Comm>" + document.getElementById(MasterObj + "txtAreaCommand").value + "</Comm><DBName>" + document.getElementById(MasterObj + "txtDBName").value + "</DBName><Name>" + document.getElementById(MasterObj + "txtStepName").value + "</Name><Intval>" + document.getElementById(MasterObj + "txtCount").value + "</Intval><onSAction>" + document.getElementById(MasterObj + "onSAction").value + "</onSAction><onFAction>" + document.getElementById(MasterObj + "onFAction").value + "</onFAction><onSS>" + document.getElementById(MasterObj + "onSS").value + "</onSS><onFS>" + document.getElementById(MasterObj + "onFS").value + "</onFS><RetAt>" + document.getElementById(MasterObj + "RetAt").value + "</RetAt><MinAt>" + document.getElementById(MasterObj + "MinAt").value + "</MinAt><File>" + document.getElementById(MasterObj + "File").value + "</File></Step></Root>");
                 var XmlNode = oXml.documentElement.selectNodes("Step");                
             }
             
             var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
             oXmlDoc.async = "false";
             oXmlDoc.loadXML(Str);
            
             oXmlDoc.childNodes[0].appendChild(XmlNode.item(0));
             Str = oXmlDoc.xml;
             returnValue = "1#";             
             if (document.getElementById(MasterObj + "txtMode").value == "New") {
                 SetMsg("ذخيره موقت شد");
                 OnClickBtnNew();
             }
             else SetMsg("ويرايش موقت شد");
             document.getElementById(MasterObj + "txtStepName").select();
             document.getElementById(MasterObj + "txtStepName").focus();       
         }  
     }
     //=================================
     function NotEmpty() {
        if(document.getElementById(MasterObj+ "txtStepName").value=="")
        {
            alert("را وارد کنيدStepنام")
            document.getElementById(MasterObj+ "txtStepName").focus();
            return false;
        }
        else
        if(document.getElementById(MasterObj+ "txtDBName").value=="")
        {
            alert("نام بانک را وارد کنيد")
            document.getElementById(MasterObj+ "txtDBName").focus();
            return false;
        }
        else
        if(document.getElementById(MasterObj+ "txtAreaCommand").value=="")
        {
            alert("را وارد کنيدCommand")
            document.getElementById(MasterObj+ "txtAreaCommand").focus();
            return false;
        }
        return true;
    }    
 </script>   
</asp:Content>
