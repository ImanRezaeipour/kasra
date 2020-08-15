using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using KasraDll;


namespace FrmPresentation.App_Utility.ToolBar
{
    public partial class Shortkey : System.Web.UI.UserControl
    {
        private string spName = "Sec.uspGetUserAccess";
        private string StrHtml;
        private int SubSysId=0;
      //  private int SolutionId;
        private string _PageName;
        private int _OnlineUserId;
        private int _PageID;
        private int _Paging;
        private string DivStr = "";

        #region Property
        public string PageName
        {
            get
            {
                return _PageName;
            }
            set
            {
                _PageName = value;
            }
        }

        public int OnlineUserId
        {
            get
            {
                return _OnlineUserId;
            }
            set
            {
                _OnlineUserId = value;
            }
        }

        public int PageID
        {
            get
            {
                return _PageID;
            }
            set
            {
                _PageID = value;
            }
        }

        public int Paging
        {
            get
            {
                return _Paging;
            }
            set
            {
                _Paging = value;
            }
        }

        #endregion
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.SubSysId = Convert.ToInt32(ConfigurationSettings.AppSettings["SubSysId"]);
                CreateShortkey();
                litContent.Text = this.StrHtml;
            }
        }

        #region Method
        private void CreateShortkey()
        {
            string ControlID = this.ID;
            DataSet ods = new DataSet();
            CtrlsDataMask.FillDatasetBySP(CtrlsDataMask.SqlConnectionType.GenCnn, this.spName, ods, new string[] { "OnlineUserPageAccess" }, _OnlineUserId, 2, this.SubSysId, _PageID);
            DataRow[] dr;
            dr = ods.Tables["OnlineUserPageAccess"].Select("");
            if (dr.Length > 0)
            {
                //==============TdPaging                        
                this.StrHtml += " <table border='0'  id='" + ControlID + "_" + "XTableShortkey'  style='width:100%; background-image: url(/FrmPresentation/App_Utility/Images/Icons/new.gif); border-right-color: #A3C1E0; border-right-width: thin; border-right-style: inset; border-left-style: inset; border-left-width: thin; border-left-color: #CBDCED;margin: 0 0 0 0;' cellpadding='0' cellspacing='0'>";
                //this.StrHtml += " <tr  onclick='onclickDivMenue(this)'> ";
                //==============TdMainBtn
                //this.StrHtml += "<td    valign='middle' align='left' style='width:35;' ><div  onmouseover='onMouseOverDiv(this)' onmouseout='onMouseDown(this)' onclick='onclickHidden(" + '"' + ControlID + '"' + ",this);onclickXTableShortkey(this);' style='width:30px;' align='center'><img id='" + ControlID + "_" + "btnHidden' src='/FrmPresentation/App_Utility/Images/Icons/Up3.gif'  style='display:inline; height: 5px;width:8px;' /><img id='" + ControlID + "_" + "btnShow' src='/FrmPresentation/App_Utility/Images/Icons/down3.gif' style='display:none;height: 5px;width:8px;'  /></div></td><td align='right' style='width:75%;height:22px'><input id='" + ControlID + "_" + "txtMsgAlert' runat='server' readonly title='پيغامها' style='background-color:Transparent;border-width: 0px;color:Black; font-size: medium;width:100%;' disabled=true align='middle' dir='rtl'/></td>";
                //this.StrHtml += "<td align='left' style='width:100%' onclick='onclickXTableShortkey(this)' valign='top'>";

                this.StrHtml += CreateCells(dr);
                //====================================================================
                this.StrHtml += "</tr></table></td></tr></table>";
                this.StrHtml += DivStr;
            }
            else
            {
                this.StrHtml += "&nbsp;";
            }
        }

        //==========================================================
        private string CreateCells(DataRow[] dr)
        {
            string StrTemp = "";
            string ControlID = this.ID;
            //DataRow[] dr;
            StrTemp += "</td>";
            //dr = ods.Tables["OnlineUserPageAccess"].Select("");
            //if (dr.Length > 0)
            //{
                
                
                //StrTemp += "<td onclick='onclickXTableShortkey(this)' valign='top'>";
                ////===========================ProgressBar
                //StrTemp += "<table border='0' style='height:5px'><tr><td id='" + ControlID + "_ProgressBar' style='visibility:hidden'>";
                //StrTemp += "<asp:UpdateProgress ID='UpdateProgress1' runat='server' Visible='false'> ";
                //StrTemp += "<ProgressTemplate>";
                //StrTemp += " <img alt='لطفا منتظر بمانيد' src='" + dr[0]["startURL"].ToString() + "App_Utility/Images/ProgressImage/throbber4.gif' width='16px' height='16px'/>";  //indicator7.gif //throbber.gif
                //StrTemp += " </ProgressTemplate>";
                //StrTemp += "</asp:UpdateProgress>";
                //StrTemp += "</td></tr></table>";
                //StrTemp += "</td>";
                //StrTemp += "</tr>";
                StrTemp += " <tr style='background-image: url(/FrmPresentation/App_Utility/Images/Icons/New04.gif);' id='" + ControlID + "_" + "TRBtn' > <td colspan='5' style='width:100%' ><table align='right' border='0' style='background-image: url(/FrmPresentation/App_Utility/Images/Icons/New04.gif);margin: 0 0 0 0;'  cellpadding='0' cellspacing='0'><tr  valign='middle'>";
                for (int i = 0; i < dr.Length; i++)
                {

                    StrTemp += "<td><div id='" + ControlID + "_" + dr[i]["AccessCode"].ToString().Trim() + "' ;OnClick" + dr[i]["AccessCode"].ToString().Trim() + "()' onmouseover='onMouseOverDiv(this)' onmouseout='onMouseDown(this)' style='border-left-style: groove;border-left-color: #FFFFFF; border-left-width: thin;'  align='right' title='" + dr[i]["ShortKey"].ToString() + "   " + dr[i]["ActionAccessDescr"].ToString() + "'>";
                    StrTemp += "<IMG  runat='server' style='height:16px;width:16px; cursor:hand' src='" + dr[i]["startURL"].ToString() + "App_Utility/Images/Icons/" + dr[i]["Icon"].ToString() + "'   title='" + dr[i]["ShortKey"].ToString() + "   " + dr[i]["ActionAccessDescr"].ToString() + "'>"  + dr[i]["AccessName"].ToString();
                    StrTemp += "</div></td>";

                }
                
           //}     

            return StrTemp;
        }
        //==========================================================
        private string GetStartURL()
        {
            DataSet Ods = new DataSet();
            CtrlsDataMask.FillDatasetBySP(CtrlsDataMask.SqlConnectionType.GenCnn, "uspGetInstance", Ods, new string[] { "Instance" });
            string StartURL = Ods.Tables["Instance"].Select("SubSysId=" + this.SubSysId)[0]["StartUrl"].ToString();
            return StartURL;
        }
        //==========================================================
        #endregion
       
    }
}