<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="AttendanceMonitoring.aspx.cs" Inherits="TAPresentation.App_Pages.Reports.AttendanceMonitoring" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .tdbold
        {
            color: Black;
            font-weight: bold;
        }
	  
		.fieldsetStyleForTdEnter
        {
            border-right: #3e7b08 thin inset;
            border-top: #3e7b08 thin solid; 
            border-left: #3e7b08 thin outset; 
            border-bottom: #3e7b08 20px solid;
        }	
		
		.fieldsetStyleForTdExit
        {
            border-right: #df0404 thin inset;
            border-top: #df0404 thin solid; 
            border-left: #df0404 thin outset; 
            border-bottom: #df0404 20px solid;
        }		
		
		.fieldsetStyleForTD
        {
            border-right: lightblue thin inset;
            border-top: #78BED6 thin solid; 
            border-left: #78BED6 thin outset; 
            border-bottom: #78BED6 20px solid;
        }	
			
    </style>
    <%--
			#div2{ position:absolute; z-index:2; }
			#div3{ position:absolute; z-index:2; }	  
			#div4{ position:absolute; z-index:2; }
			#div5{ position:absolute; z-index:2; }--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 90%">
        <tr>
            <td width="890px" align="center">
                <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="1800">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td>
               <div id="DivCardReader">
                <fieldset dir="rtl" class="fieldsetStyle" align="middle">
                    <legend class="legendStyle">انتخاب کارتخوان</legend>
                    <div>
                        کارتخوان :
                        <img alt='کارتخوان' src='/FrmPresentation/App_Utility/Images/Icons/select.png' style='cursor: pointer'
                            onclick='OnClickBtnSelectCardReader()' />
                        <asp:Label runat="server" ID="lblCardReader" class="TxtControls"></asp:Label>
                    </div>
                </fieldset>
               </div>
            </td>
        </tr>
        <tr>
            <td class="fieldsetStyle">
                <table style="width: 100%">
                    <tr>
                        <td style="width: 30%" valign="top">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div id="div1">
                                        <table style="width: 100%" id="tb1">
                                            <tr>
                                                <td id="tdF1" class="fieldsetStyleForTD" valign="top" style="height: 230px">
                                                    <img alt="" id="img1" style="width: 300px; height: 300px;" src="" />
                                                    <%--<asp:Image id ="img1" runat="server"/>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="fieldsetStyle" style="height: 230px" valign="top">
                                                    <table width="100%">
                                                        <tr>
                                                            <td style="width: 43%">
                                                                پرسنلی:
                                                            </td>
                                                            <td class="tdbold" style="width: 57%">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                سمت:
                                                            </td>
                                                            <td class="tdbold">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                زمان:
                                                            </td>
                                                            <td class="tdbold">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                مشخصات کارتخوان:
                                                            </td>
                                                            <td class="tdbold">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                کارت کد:
                                                            </td>
                                                            <td class="tdbold">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                مجوزهای درخواستی:
                                                            </td>
                                                            <td class="tdbold">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <input type="text" id="LastRowGridXml" name="LastRowGridXml" runat="server" style="display: none" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td style="width: 70%" valign="top">
                            <table style="width: 100%">
                                <tr>
                                    <td valign="top">
                                        <div id="div2">
                                            <table style="width: 100%" valign="top">
                                                <tr>
                                                    <td  id="tdF2" class="fieldsetStyleForTD" valign="top" style="width: 20%; height: 110px">
                                                        <img alt="" id="img2" style="width: 100px" height="100px" src="" />
                                                    </td>
                                                    <td class="fieldsetStyle" style="width: 80%" valign="top">
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="width: 10%">
                                                                    پرسنلی:
                                                                </td>
                                                                <td style="width: 40%" class="tdbold">
                                                                </td>
                                                                <td style="width: 10%">
                                                                    سمت:
                                                                </td>
                                                                <td style="width: 40%" class="tdbold">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    زمان:
                                                                </td>
                                                                <td class="tdbold">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    کارتخوان:
                                                                </td>
                                                                <td class="tdbold">
                                                                </td>
                                                                <td>
                                                                    کارت کد:
                                                                </td>
                                                                <td class="tdbold">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    مجوزهای درخواستی:
                                                                </td>
                                                                <td class="tdbold" colspan="2">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <div id="div3">
                                            <table style="width: 100%" valign="top">
                                                <tr>
                                                    <td  id="tdF3"  class="fieldsetStyleForTD" valign="top" style="width: 20%; height: 110px">
                                                        <img alt="" id="img3" style="width: 100px" height="100px" src="" />
                                                    </td>
                                                    <td class="fieldsetStyle" style="width: 80%" valign="top">
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="width: 10%">
                                                                    پرسنلی:
                                                                </td>
                                                                <td style="width: 40%" class="tdbold">
                                                                </td>
                                                                <td style="width: 10%">
                                                                    سمت:
                                                                </td>
                                                                <td style="width: 40%" class="tdbold">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    زمان:
                                                                </td>
                                                                <td class="tdbold">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    کارتخوان:
                                                                </td>
                                                                <td class="tdbold">
                                                                </td>
                                                                <td>
                                                                    کارت کد:
                                                                </td>
                                                                <td class="tdbold">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    مجوزهای درخواستی:
                                                                </td>
                                                                <td class="tdbold" colspan="2">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <div id="div4">
                                            <table style="width: 100%" valign="top">
                                                <tr>
                                                    <td id="tdF4" class="fieldsetStyleForTD" valign="top" style="width: 20%; height: 110px">
                                                        <img alt="" id="img4" style="width: 100px" height="100px" src="" />
                                                    </td>
                                                    <td class="fieldsetStyle" style="width: 80%" valign="top">
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="width: 10%">
                                                                    پرسنلی:
                                                                </td>
                                                                <td style="width: 40%" class="tdbold">
                                                                </td>
                                                                <td style="width: 10%">
                                                                    سمت:
                                                                </td>
                                                                <td style="width: 40%" class="tdbold">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    زمان:
                                                                </td>
                                                                <td class="tdbold">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    کارتخوان:
                                                                </td>
                                                                <td class="tdbold">
                                                                </td>
                                                                <td>
                                                                    کارت کد:
                                                                </td>
                                                                <td class="tdbold">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    مجوزهای درخواستی:
                                                                </td>
                                                                <td class="tdbold" colspan="2">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <div id="div5">
                                            <table style="width: 100%" valign="top">
                                                <tr>
                                                    <td id="tdF5" class="fieldsetStyleForTD" valign="top" style="width: 20%; height: 110px">
                                                        <img alt="" id="img5" style="width: 100px" height="100px" src="" />
                                                    </td>
                                                    <td class="fieldsetStyle" style="width: 80%" valign="top">
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="width: 10%">
                                                                    پرسنلی:
                                                                </td>
                                                                <td style="width: 40%" class="tdbold">
                                                                </td>
                                                                <td style="width: 10%">
                                                                    سمت:
                                                                </td>
                                                                <td style="width: 40%" class="tdbold">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    زمان:
                                                                </td>
                                                                <td class="tdbold">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    کارتخوان:
                                                                </td>
                                                                <td class="tdbold">
                                                                </td>
                                                                <td>
                                                                    کارت کد:
                                                                </td>
                                                                <td class="tdbold">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    مجوزهای درخواستی:
                                                                </td>
                                                                <td class="tdbold" colspan="2">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: none">
                    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                </div>
                <div style="display: none">
                    <cc1:MySecurity ID="OnLineUser" runat="server">
                    </cc1:MySecurity>
                    <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                        runat="server" />
                    <input type="text" id="txtXmlCardReader" name="txtXmlCardReader" runat="server" />
                    <input type="text" id="GridXml" name="GridXml" runat="server" />
                    <input type="text" id="XmlDiv1" name="XmlDiv1" runat="server" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                    <input type="text" id="txtRegInOutPic" name="txtRegInOutPic" runat="server" />
                </div>
                <div style="display: none" id="tempLastPerson">
                </div>
            </td>
        </tr>
    </table>
    <script type="text/javascript" src="../../App_Utility/Scripts/jquery.xmlDom.js"></script>
    <script src="../../App_Utility/Scripts/Reports/AttendanceMonitoring.js?v=4.4" type="text/javascript"></script>
</asp:Content>
