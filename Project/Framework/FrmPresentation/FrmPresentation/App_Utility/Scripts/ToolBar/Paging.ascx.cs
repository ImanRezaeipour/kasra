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
    public partial class Paging : System.Web.UI.UserControl
    {
        private string spName = "Sec.uspGetUserPaging";
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

        

        #endregion
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.SubSysId = Convert.ToInt32(ConfigurationSettings.AppSettings["SubSysId"]);
                CreatePaging();
                litContent.Text = this.StrHtml;
            }
        }

        #region Method
        private void CreatePaging()
        {
            string ControlID = this.ID;
            DataSet ods = new DataSet();
            CtrlsDataMask.FillDatasetBySP(CtrlsDataMask.SqlConnectionType.GenCnn, this.spName, ods, new string[] { "Paging" }, this.SubSysId, _PageID);
            DataRow[] dr;

            dr = ods.Tables["Paging"].Select("");
            if (dr.Length > 0)
            {
                //==============TdPaging                        
                this.StrHtml += " <table border='0'  id='" + ControlID + "_" + "XTableToolBar'  style='width:100%; background-image: url(/FrmPresentation/App_Utility/Images/Icons/new.gif); border-right-color: #A3C1E0; border-right-width: thin; border-right-style: inset; border-left-style: inset; border-left-width: thin; border-left-color: #CBDCED;margin: 0 0 0 0;' cellpadding='0' cellspacing='0'>";
               
                this.StrHtml += "<tr><td  style='width:100%'  valign='top'>";
                this.StrHtml += CreateCells(dr);
                //====================================================================
                this.StrHtml += "</td></tr></table>";
                this.StrHtml += DivStr;
            }
        }

        //==========================================================
        private string CreateCells(DataRow[] dr)
        {
            string StrTemp = "";
            string ControlID = this.ID;
            
                    StrTemp += " <table style='height:10px'  border='0' cellpadding='0' cellspacing='0'><tr>";
                    StrTemp += "<td style='vertical-align:top;'><input align='center' type='text' id='" + ControlID + "_" + "txtFromData' runat='server' readonly style='text-align:center;width: 50px;border-width: 0px;background-color:transparent' align='middel'/></td><td>تا</td>";

                    StrTemp += "<td style='vertical-align:top;'><input align='center' type='text' id='" + ControlID + "_" + "txtToData' runat='server' readonly  style='text-align:center;width: 50px;background-color: transparent;border-width: 0px;' align='middel'/></td><td>از</td>";

                    StrTemp += "<td style='vertical-align:top;'><input align='center' type='text' id='" + ControlID + "_" + "txtTotalData' runat='server' readonly  style='text-align:center;width: 50px;background-color: transparent;border-width: 0px;' align='middel'/></td>";

                    StrTemp += "<td style='vertical-align:top;'>&nbsp;<IMG id='" + ControlID + "_" + "BtnLast' runat='server' title='آخرين' onclick='onclickXTableToolBar(this);OnClickBtnLast()' src='" + dr[0]["startURL"].ToString() + "//App_Utility/Images/Icons/paging-last.gif' style='cursor:hand'   /></td>";

                    StrTemp += "<td style='vertical-align:top;' align='center'>&nbsp;<IMG id='" + ControlID + "_" + "BtnNext' runat='server' title='بعدي' onclick='onclickXTableToolBar(this);OnClickBtnNext()' src='" + dr[0]["startURL"].ToString() + "//App_Utility/Images/Icons/paging-next.gif' style='cursor:hand'  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>";

                    StrTemp += "<td><input type='text' id='" + ControlID + "_" + "txtCurPage' runat='server' title='صفحه'  style='text-align:center;width: 40px;' onblur='OnBlurtxtCurPage()' onkeydown='OnKeyDownInt(this)' value=''/>&nbsp;&nbsp;&nbsp;</td><td> از </td>";

                    StrTemp += "<td style='vertical-align:top;'><input align='center' type='text' id='" + ControlID + "_" + "txtTotalPage' runat='server' readonly title='تعداد کل صفحات' style='text-align:center;width: 40px;background-color: transparent;border-width: 0px;' align='middel'/></td>";

                    StrTemp += "<td style='vertical-align:top;' >&nbsp;<IMG id='" + ControlID + "_" + "BtnPrv' runat='server' title='قبلي' onclick='onclickXTableToolBar(this);OnClickBtnPrv()' src='" + dr[0]["startURL"].ToString() + "//App_Utility/Images/Icons/paging-prev.gif' style='cursor:hand'   /></td>";

                    StrTemp += "<td style='vertical-align:top;'>&nbsp;<IMG id='" + ControlID + "_" + "BtnFirst' runat='server' title='اولين' onclick='onclickXTableToolBar(this);OnClickBtnFirst()' src='" + dr[0]["startURL"].ToString() + "//App_Utility/Images/Icons/paging-first.gif' style='cursor:hand'  /></td>";

                    StrTemp += "</tr></table>";
               
                
                
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