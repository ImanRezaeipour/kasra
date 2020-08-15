<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="CustomErrorPage.aspx.cs" Inherits="FrmPresentation.App_Pages.ErrorLog.CustomErrorPage" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
                
         .fieldsetStyle
        {
            width: 400px;
            border-right: lightblue thin inset;
            border-top: #78BED6 thin solid;
            border-left: #78BED6 thin outset;
            border-bottom: #78BED6 thin solid;
            height: 43px;
        }
        .VertGradientBlue1
        {
	        FILTER:progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#e7eeff, EndColorStr=#91b7df);BORDER-RIGHT: #346fa4 2px solid;BORDER-TOP: lightsteelblue 2px solid; BORDER-LEFT: lightsteelblue 2px solid; BORDER-BOTTOM: #346fa4 2px solid;
	        cursor : pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br /><br /><br /><br />
     <fieldset dir="rtl" class="fieldsetStyle"  align="bottom">
     <table class="fieldsetStyle"><tr><td class="VertGradientBlue1" ><IMG id="ImgError" alt="" src="../../App_Utility/Images/Icons/attention.gif" name="ImgError"
													align="middle"></td></tr>
        <tr><td>
             <P><font color="maroon" size="3">لطفا با مدير سيستم تماس بگيريد</font></P>
             <br />
             <br /></td></tr>
        </table>
        </fieldset>
    <div style="DISPLAY: none">
      <cc1:MySecurity ID="OnLineUser1" runat="server">
                        </cc1:MySecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID" runat="server" />        
    </div>

</asp:Content>
