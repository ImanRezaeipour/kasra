<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="DailyReportDesign.aspx.cs" Inherits="FrmPresentation.DailyReportDesign" %>
 <%@ Register Assembly="Stimulsoft.Report.Web, Version=2010.1.700.0, Culture=neutral, PublicKeyToken=ebe6666cba19647a"
    Namespace="Stimulsoft.Report.Web" TagPrefix="cc1" %>
<%--<%@ Register TagPrefix="cc2" Namespace="Stimulsoft.Report.Web" Assembly="Stimulsoft.Report.Web, Version=2009.3.600.0, Culture=neutral, PublicKeyToken=ebe6666cba19647a" %>
--%>
<%@ Register Assembly="Stimulsoft.Report.WebDesign" Namespace="Stimulsoft.Report.Web"
    TagPrefix="cc2" %>
    
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <cc2:StiWebDesigner ID="WebDesigner1" runat="server" OnSaveReport="WebDesigner1_SaveReport"
        OnSaveReportAs="WebDesigner1_SaveReport" OnGetPreviewDataSet="WebDesigner1_GetPreviewDataSet" 
        RenderMode="AjaxWithCache"
        />
        
 <cc1:StiWebViewer ID="StiWebViewer1" runat="server" />    
   
				
    <script language="javascript" type="text/javascript">
        window.name = "ReportDesign"
        aspnetForm.target = "ReportDesign"
        document.body.scroll = "yes"
    </script>
    
<div style="display:none">
    <input id="txtOnlineUser" name="txtOnlineUser" type="text" runat="server"  />
    <input id="txtReportID" name="txtReportID" type="text" runat="server"  />
    <input id="txtXmlParam" name="txtXmlParam" type="text" runat="server"  />
    <input id="txtXmlAdvanceParam" name="txtXmlAdvanceParam" type="text" runat="server"  />
    <input id="txtStrFiledAdvanceFilter" name="txtStrFiledAdvanceFilter" type="text" runat="server"  />
    <input id="txtPageNumber" name="txtPageNumber" type="text" runat="server"  />
    <input id="txtPageSize" name="txtPageSize" type="text" runat="server"  />
    <input id="txtSessionID" name="txtSessionID" type="text" runat="server"  />
    <input id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID" type="text" runat="server"  />    
    <input id="txtRptID" name="txtRptID" type="text" runat="server"  />   
    <input id="txtPersonCodeSearch" name="txtPersonCodeSearch" type="text" runat="server"  /> 
    <input id="txtCreditNeed" name="txtCreditNeed" type="text" runat="server"  /> 
    <input id="SDate" name="SDate" type="text" runat="server"  /> 
    <input id="EDate" name="EDate" type="text" runat="server"  /> 
    <input id="PageID" name="PageID" type="text" runat="server"  />
    <input id="txtRequestID" name="txtRequestID" type="text" runat="server"  />



</div>
</asp:Content>
