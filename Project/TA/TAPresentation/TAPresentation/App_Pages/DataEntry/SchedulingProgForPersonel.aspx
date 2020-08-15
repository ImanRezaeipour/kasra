<%@ Page Title="&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&زمانبندي پرسنل &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="SchedulingProgForPersonel.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.SchedulingProgForPersonel" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc3" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../../App_Utility/ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<%@ Register Src="../../App_Utility/MultiDepartment/MultiDepartment.ascx" TagName="MultiDepartment"
    TagPrefix="uc3" %>
  

<%@ Register src="../../App_Utility/PersonComboBox/PersonComboBox.ascx" tagname="PersonComboBox" tagprefix="uc4" %>
  
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .imageClick
        {
            background-color: Red;
        }
        .StructClick
        {
            background-color: #D3D3E7;
        }
        .StructunClick
        {
            background-color: White;
        }
        .NameOFStruct
        {
            background-color: #83AFE5;
        }
        ul#IntvalUL
        {
            list-style: none;
            padding: 0;
        }
        /*---------------------------------------*/
        .FrozenHeader
        {
            position: relative;
            top: expression(document.getElementById("DivGrid").scrollTop);
            z-index: 10;
        }       
        /*===================================*/
        #arrows
        {
            width: 100px;
            height: 16px;
            background-color: #DFEAF7;
            border: 1px ridge #000000;
            cursor: pointer;
            z-index: 10;
        }
        #arrows UL
        {
            padding-bottom: 0px;
            list-style-type: none;
            margin: 0px;
            padding-left: 0px;
            padding-right: 0px;
            padding-top: 0px;
        }
        #arrows UL LI
        {
            padding: 0px;
            margin: 0px;
            width: 73px;
            display: inline;
            height: 16px;
        }
        #arrows UL LI A
        {
            text-indent: -9000px;
            width: 73px;
            display: block;
            height: 16px;
            font-size: 50em;
            overflow: hidden;
            cursor: pointer;
            margin-right: 5px;
        }
        #arrows UL #arleft A
        {
            background: url(../../App_Utility/images/Icons/RightArrow.png) no-repeat;
        }
        #arrows UL #arright A
        {
            background: url(../../App_Utility/images/Icons/LeftArrow.png) no-repeat;
        }
        /*-------------------------------*/
        #DivIntval
        {
            width: 50px;
            height: 20px;
        }
        #TDIntval
        {
        	width:20px;
        } 
        .SelectedCol
        {
        	background-color:#88C142;
        	/*border-left:1px solid #F03D00;
        	border-right:1px solid #F03D00;*/
        }      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" EnableViewState="true"
    runat="server">     
    <link rel="stylesheet" type="text/css" href="../../App_Utility/Styles/jquery-ui-1.8.custom.css">   
      <script type="text/javascript" src="../../App_Utility/Scripts/jquery-1.6.3.min.js"></script>
    <script type="text/javascript" src="../../App_Utility/Scripts/jquery-ui-1.8.custom.min.js"></script>  
    <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false">
    </asp:ScriptManager> 
    <div id="DivPopupDays" style="display: none; position: absolute" dir="rtl">
        <div onmouseover="this.style.background='gold';" style="border-right: dimgray 1px solid;
            border-top: dimgray 1px solid; border-left: dimgray 1px solid; width: 90px; height: 29px;
            cursor: hand; background-color: #ffffff; font-weight: bold; font-size: 9pt; font-family: 'tahoma Bold'"
            onmouseout="this.style.background='#ffffff';" onclick="onclickChangeShift(0)">
            تغيير ساختار</div>
    </div>    
    <table cellpadding="0" cellspacing="0" width="95%" style="vertical-align: top;">
        <tr align="right">
            <td id="TDMain" colspan="2" valign="top" style="border: 1px ridge #000000" align="right">
                <!----------------------------------------------------آيتم های جستجو------------------------------------->
                <div id="DivMain" style="border: 1px solid #000000; width: 930px; height: 30px; vertical-align: middle;
                    float: right; background-color: #E8F4E8;" onclick="onclickTB()">
                    <table>
                        <tr>
                            <td>
                                &nbsp;&nbsp; دوره:
                            </td>
                            <td>
                                <select id="CmbWorkPeriod" name="CmbWorkPeriod" style="width: 90px" onkeydown="OnKeyEnter(this)"
                                    runat="server" class="TxtControls">
                                    <option></option>
                                </select>
                            </td>
                            <td>
                                ورژن :
                            </td>
                            <td>
                                <select id="CmbVersion" name="CmbVersion" style="width: 90px" runat="server" class="TxtControls">
                                    <option></option>
                                </select>
                            </td>                          
                            <td>                                
                                پرسنل:
                            </td>
                            <td> 
                                <uc2:ComboBox ID="CmbPerson" runat="server" />  
                            </td>
                            <td>
                                <input id="ChkCheck" onkeydown="OnKeyEnter(this)" type="checkbox" runat="server" />کنترل
                                ساختار مرتبط
                            </td>
                            <td>
                                <uc1:ToolBar ID="OToolBar" runat="server" Paging="1" />
                            </td>
                            <td><img id="ImgProgresss" src="../../App_Utility/Images/ProgressImage/loading1.gif" style="display:none"; /></td>
                        </tr>
                    </table>
                </div>
                <!-------------------------------------------------------قسمت گرید اصلی---------------------------------->               
                <div id="DivGrid" style="width: 930px; height: 380px; vertical-align: top; overflow: auto;
                    overflow-x: hidden;" dir="rtl">                   
                    <table dir="rtl" id="XTableDataBase" cellpadding="0" cellspacing="0">
                        <tr>
                            <td id="TDIntval" valign="top" style="width:20px ;">
                                <table id="TBLIntval" cellpadding="0" cellspacing="0" width="20px">
                                    <tr id="TRHIntval" style="width: 20px; display: none">
                                        <td id="TDHIntval" class="CssHeaderStyle" style="width: 20px; border-top-style: solid;
                                            border-right-style: solid; border-bottom-style: solid; border-top-width: 1px;
                                            border-right-width: 1px; border-bottom-width: 1px; border-top-color: #000000;
                                            border-right-color: #000000; border-bottom-color: #000000" align="center" valign="top">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td >
                                            <div style="float: left; width: 20px;">
                                                <ul style="float: left;" id="IntvalUL">
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td valign="top">
                                <table id="XtableHName" cellpadding="0" cellspacing="0" style="border-top-style: solid;
                                    border-right-style: solid; border-bottom-style: solid; border-top-width: 1px;
                                    border-right-width: 1px; border-bottom-width: 1px; border-top-color: #000000;
                                    border-right-color: #000000; border-bottom-color: #000000">
                                </table>
                                <table id="XtableName" cellpadding="0" cellspacing="0">
                                </table>
                            </td>
                            <td id="TDDivData" valign="top">
                                <div id="DivGridData" style="overflow: auto; z-index: 10; width: 100%; overflow-y: hidden;
                                    overflow-x: hidden;">
                                    <table id="XTabTable" cellpadding="0" cellspacing="0" style="border-top-color: #000000;
                                        border-bottom-color: #000000; border-bottom-width: 1px; border-top-width: 1px;
                                        border-top-style: solid; border-bottom-style: solid">
                                    </table>
                                    <table id="XTableData" class="New" cellpadding="0" cellspacing="0">
                                    </table>
                                </div>
                            </td>
                            <td valign="top">
                                <table id="XtableHkarkard" cellpadding="0" cellspacing="0" style="border-top-style: solid;
                                    border-bottom-style: solid; border-left-style: solid; border-top-width: 1px;
                                    border-bottom-width: 1px; border-left-width: 1px; border-top-color: #000000;
                                    border-bottom-color: #000000; border-left-color: #000000">
                                </table>
                                <table id="XtableKarkard" cellpadding="0" cellspacing="0">
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-------------------------------------------------------اسکرول---------------------------------->
                <div id="arrows" style="width: 100%" align="center">
                   
                    <ul>
                        <li id="arleft"><a>چپ</a></li>
                        <li id="arright"><a>راست</a> </li>
                    </ul>                 
                        
                </div>
                <!----------------------------------------------------------قسمت گرید محاسبات------------------------------->
                <div id="DivCount" style="width: 930px; height: 100px; vertical-align: top; overflow: auto;
                    overflow-x: hidden;" dir="rtl">
                    <table dir="rtl" id="TBLCount">
                        <tr>
                            <td valign="top">
                                <table id="XtableStructName" cellpadding="0" cellspacing="1">
                                </table>
                            </td>
                            <td id="TD1" valign="top">
                                <div id="DivBaseCount" style="overflow: auto; z-index: 10; width: 100%; overflow-y: hidden;
                                    overflow-x: hidden;">
                                    <table id="XTableCount" cellpadding="0" cellspacing="1">
                                    </table>                                   
                                </div>
                            </td>
                            <td valign="top">
                                <table id="Table3" cellpadding="0" cellspacing="1">
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <!---------------------------------------------------------------------------------------------->
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />              
        <input type="text" id="TemptxtWP" name="TemptxtWP" runat="server" />
        <input type="text" id="txtIntvals" name="txtIntvals" runat="server" />
        <input type="text" id="txtPCodeTemp" name="txtPCodeTemp" runat="server" />
        <input type="text" id="txtIDTemp" name="txtGroupTemp" runat="server" />
        <input type="text" id="txtDefWp" name="txtDefWp" runat="server" />
        <input type="text" id="WPIDtxt" name="WPIDtxt" runat="server" />
        <input type="text" id="txtForSave" name="txtForSave" runat="server" />
        <input type="text" id="txtDefPID" name="txtDefPID" runat="server" />
        <input type="text" id="txtChk" name="txtChk" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtShowHourlyTime" name="txtShowHourlyTime" runat="server" />
        <input type="text" id="txtDepartment" name="txtDepartment" runat="server" />
        <input type="text" id="txtType" name="txtType" runat="server" />
        <input type="text" id="txtPersonels" name="txtPersonels" runat="server" />
        <input type="text" id="txtVersions" name="txtVersions" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtXmlInfo" name="txtXmlInfo" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtShowCombinStruct" name="txtShowCombinStruct" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
        <asp:HiddenField ID="txtPersonDelete" runat="server" />       
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div style="display: none">
                    <input type="text" id="txtXml" name="txtXml" runat="server" />                    
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                
            </Triggers>
        </asp:UpdatePanel>
       
    </div>     
  
    <script src="../../App_Utility/Scripts/DataEntry/SchedulingProgForPersonel.js" type="text/javascript"></script>      
</asp:Content>
