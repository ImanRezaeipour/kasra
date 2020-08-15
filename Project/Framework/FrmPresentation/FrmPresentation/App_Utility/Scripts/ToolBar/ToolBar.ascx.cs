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


namespace FrmPresentation.App_Utility.Search
{
    public partial class ToolBar : System.Web.UI.UserControl
    {
        private string spName = "Sec.uspGetOnlineUserPageAccess";
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
                CreateToolBar();
                litContent.Text = this.StrHtml;
            }
        }

        #region Method
        private void CreateToolBar()
        {
            string ControlID = this.ID;
            DataSet ods = new DataSet();
            CtrlsDataMask.FillDatasetBySP(CtrlsDataMask.SqlConnectionType.GenCnn, this.spName, ods, new string[] { "OnlineUserPageAccess" }, _OnlineUserId, _PageName, this.SubSysId, _PageID);

            //==============TdPaging                        
            this.StrHtml += " <table border='0'  id='" + ControlID + "_" + "XTableToolBar'  style='width:100%; background-image: url(/FrmPresentation/App_Utility/Images/Icons/new.gif); border-right-color: #A3C1E0; border-right-width: thin; border-right-style: inset; border-left-style: inset; border-left-width: thin; border-left-color: #CBDCED;margin: 0 0 0 0;' cellpadding='0' cellspacing='0'>";
            this.StrHtml += " <tr  onclick='onclickDivMenue(this)'> ";
            //==============TdMainBtn
            this.StrHtml += "<td    valign='middle' align='left' style='width:35;' ><div  onmouseover='onMouseOverDiv(this)' onmouseout='onMouseDown(this)' onclick='onclickHidden(this);onclickXTableToolBar(this);' style='width:30px;' align='center'><img id='" + ControlID + "_" + "btnHidden' src='/FrmPresentation/App_Utility/Images/Icons/Up3.gif'  style='display:inline; height: 5px;width:8px;' /><img id='" + ControlID + "_" + "btnShow' src='/FrmPresentation/App_Utility/Images/Icons/down3.gif' style='display:none;height: 5px;width:8px;'  /></div></td><td align='right' style='width:100%;height:22px'><input id='" + ControlID + "_" + "txtMsgAlert' runat='server' readonly title='پيغامها' style='background-color:Transparent;border-width: 0px;color:Black; font-size: medium;width:100%;' disabled=true align='middle' dir='rtl'/></td>";
            this.StrHtml += "<td align='left' style='width:100%' onclick='onclickXTableToolBar(this)' valign='top'>";
            this.StrHtml += CreateCells(3, ods);
            this.StrHtml += "</td>";
            this.StrHtml += "<td onclick='onclickXTableToolBar(this)' valign='top'>";
            this.StrHtml += CreateCells(4, ods);
            this.StrHtml += "</td>";
            this.StrHtml += "</tr>";
            //==============TdSpecial
            this.StrHtml += " <tr style='background-image: url(/FrmPresentation/App_Utility/Images/Icons/New04.gif);' id='" + ControlID + "_" + "TRBtn' > <td colspan='4' style='width:100%' ><table align='right' border='0' style='background-image: url(/FrmPresentation/App_Utility/Images/Icons/New04.gif);margin: 0 0 0 0;'  cellpadding='0' cellspacing='0'><tr  valign='middle'>";
            this.StrHtml += CreateCells(1, ods);
            this.StrHtml += CreateCells(2, ods);
            ////==============TdPaging
            //this.StrHtml += "<td align='left' style='width:100%' onclick='onclickXTableToolBar(this)'>";
            //this.StrHtml += CreateCells(3, ods);
            //this.StrHtml += "</td>";
            //this.StrHtml += "<td onclick='onclickXTableToolBar(this)'>";
            //this.StrHtml += CreateCells(4, ods);
            //this.StrHtml += "</td>";
            //====================================================================
            this.StrHtml += "</tr></table></td></tr></table>";
            this.StrHtml += DivStr;
        }

        //==========================================================
        private string CreateCells(int AccessType, DataSet ods)
        {
            string StrTemp = "";
            string ControlID = this.ID;
            DataRow[] dr;
            if (AccessType != 4)
            {
                dr = ods.Tables["OnlineUserPageAccess"].Select("ActionAccessType=" + AccessType.ToString());
                if (dr.Length > 0)
                {
                    if (AccessType == 3)
                    {
                        StrTemp += " <table runat='server' id='" + ControlID + "_Paging' style='height:10px'  border='0' cellpadding='0' cellspacing='0'><tr>";
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
                    }
                    else if (AccessType.ToString() == "1" || AccessType.ToString() == "2")
                    {
                        DataRow[] dr1;
                        dr1 = ods.Tables["OnlineUserPageAccess"].Select("(ParentID=0 or ParentID=-1) And (ActionAccessType=" + AccessType.ToString() + ")");
                        for (int i = 0; i < dr1.Length; i++)
                        {
                            StrTemp += " <td  style='vertical-align:top;'>";

                            int len = dr1[i]["AccessName"].ToString().Length;
                            bool flag = true;

                            DataRow[] dr2;
                            dr2 = ods.Tables["OnlineUserPageAccess"].Select("ParentID=" + dr1[i]["ActionCode"].ToString().Trim() + " And ParentID<>0 ");
                            if (len > 6)
                                flag = false;
                            if (len < 8)
                                len = 60;
                            else if (len < 9)
                                len = 70;
                            else if (len < 10)
                                len = 80;
                            else if (len < 11)
                                len = 90;
                            else if (len < 14)
                                len = 100;

                            else len = 100 + (len - 14) * 4;

                            if (dr1[i]["AccessName"].ToString().Length == 0)
                                len = 30;
                            if (dr2.Length == 0)
                            {
                                if (dr1[i]["ParentID"].ToString() != "-1")
                                {
                                    StrTemp += "<div id='" + ControlID + "_" + dr1[i]["AccessCode"].ToString().Trim() + "' onclick='onclickXTableToolBar(this," + len.ToString() + ");OnClick" + dr1[i]["AccessCode"].ToString().Trim() + "()' onmouseover='onMouseOverDiv(this)' onmouseout='onMouseDown(this)' style='border-left-style: groove;border-left-color: #FFFFFF; border-left-width: thin;'  align='right' title='" + dr1[i]["ShortKey"].ToString() + "   " + dr1[i]["ActionAccessDescr"].ToString() + "'>";
                                    StrTemp += "<IMG  runat='server' style='height:16px;width:16px; cursor:hand' src='" + dr1[i]["startURL"].ToString() + "App_Utility/Images/Icons/" + dr1[i]["Icon"].ToString() + "'   title='" + dr1[i]["ShortKey"].ToString() + "   " + dr1[i]["ActionAccessDescr"].ToString() + "'>" + (flag == true ? "&nbsp;&nbsp;" : "") + dr1[i]["AccessName"].ToString();
                                    StrTemp += "</div>";

                                }
                            }
                            else
                            {
                                int len2 = 0;
                                for (int j = 0; j < dr2.Length; j++)
                                {
                                    len2 = Math.Max(len2, dr2[j]["AccessName"].ToString().Length);
                                }
                                if (len2 > 6)
                                    flag = false;
                                if (len2 < 8)
                                    len2 = 60;
                                else if (len2 < 9)
                                    len2 = 70;
                                else if (len2 < 10)
                                    len2 = 80;
                                else if (len2 < 11)
                                    len2 = 90;
                                else if (len2 < 12)
                                    len2 = 100;

                                else len2 = 100 + (len2 - 12) * 4;

                                StrTemp += "<table  border='0' style='border-left-style: groove;border-left-color: #FFFFFF; border-left-width: thin;height:10px;' cellpadding='0' cellspacing='0'><tr>";
                                StrTemp += "<td  id='" + ControlID + "_" + dr1[i]["AccessCode"].ToString().Trim() + "' onclick='onclickXTableToolBar(this," + len2.ToString() + ",0);OnClick" + dr1[i]["AccessCode"].ToString().Trim() + "()' onmouseover='onMouseOverDiv(this)' onmouseout='onMouseDown(this)'  align='right' title='" + dr1[i]["ShortKey"].ToString() + "   " + dr1[i]["ActionAccessDescr"].ToString() + "'>";
                                StrTemp += "<IMG   runat='server' style='height:16px;width:16px; cursor:hand' src='" + dr1[i]["startURL"].ToString() + "App_Utility/Images/Icons/" + dr1[i]["Icon"].ToString() + "'   title='" + dr1[i]["ActionAccessDescr"].ToString() + "'/>" + (flag == true ? "&nbsp;&nbsp;" : "") + dr1[i]["AccessName"].ToString();
                                StrTemp += "</td>";
                                StrTemp += "<td  subMenue='" + ControlID + "_" + dr1[i]["AccessCode"].ToString().Trim() + "_Div' onclick='onclickXTableToolBar(this," + len.ToString() + ",0);' onmouseover='onMouseOverDiv(this)' onmouseout='onMouseDown(this)' style='width:11px; '  align='center' title='" + dr1[i]["ActionAccessDescr"].ToString() + "'>";
                                StrTemp += "<img  src='" + dr1[i]["startURL"].ToString() + "App_Utility/Images/Icons/Down2.gif' style='width:11px;heigth:11px' />";
                                StrTemp += "</td></tr></table>";
                                DivStr += "<div   id='" + ControlID + "_" + dr1[i]["AccessCode"].ToString().Trim() + "_Div' style='width:" + Math.Max(len, len2).ToString() + ";display:none;position:absolute;background-image: url(\"" + dr[i]["startURL"].ToString() + "//App_Utility/Images/Icons/New04.gif\");'>";

                                //-------------------------------------------زیر منو
                                DivStr += "<div id='" + ControlID + "_" + dr1[i]["AccessCode"].ToString().Trim() + "' onclick='onclickSubMenue(this);OnClick" + dr1[i]["AccessCode"].ToString().Trim() + "()' onmouseover='onMouseOverDiv(this)' onmouseout='onMouseDown(this)' style='width:" + Math.Max(len, len2).ToString() + "px; ;border: thin outset #9CB5DA;display:inline;' align='right'  title='" + dr1[i]["ShortKey"].ToString() + "   " + dr1[i]["ActionAccessDescr"].ToString() + "'>";
                                DivStr += "<IMG   runat='server' style='height:16px;width:16px; cursor:hand' src='" + dr1[i]["startURL"].ToString() + "App_Utility/Images/Icons/" + dr1[i]["Icon"].ToString() + "'   title='" + dr1[i]["ActionAccessDescr"].ToString() + "'/>" + dr1[i]["AccessName"].ToString();
                                DivStr += "</div>";
                                for (int j = 0; j < dr2.Length; j++)
                                {
                                    DivStr += "<div align='right' id='" + ControlID + "_" + dr2[j]["AccessCode"].ToString().Trim() + "' onclick='onclickSubMenue(this);OnClick" + dr2[j]["AccessCode"].ToString().Trim() + "()' onmouseover='onMouseOverDiv(this)' onmouseout='onMouseDown(this)'  style='width:" + Math.Max(len, len2).ToString() + ";border: thin outset #9CB5DA;display:inline;' title='" + dr2[j]["ShortKey"].ToString() + "   " + dr2[j]["ActionAccessDescr"].ToString() + "'>";
                                    DivStr += "<IMG  runat='server' style='height:16px;width:16px;cursor:hand' src='" + dr2[j]["startURL"].ToString() + "App_Utility/Images/Icons/" + dr2[j]["Icon"].ToString() + "'   title='" + dr2[j]["ActionAccessDescr"].ToString() + "'/>" + dr2[j]["AccessName"].ToString();
                                    DivStr += "</div>";
                                }
                                DivStr += "</div>";
                                //---------------------------------------
                            }
                            StrTemp += "</td>";
                        }
                    }
                }
            }
            else if (AccessType.ToString() == "4")
            {
                dr = ods.Tables["OnlineUserPageAccess"].Select();
                if (dr.Length > 0)
                {
                    //===========================ProgressBar
                    StrTemp += "<table border='0' style='height:5px'><tr><td id='" + ControlID + "_ProgressBar' style='visibility:hidden'>";
                    StrTemp += "<asp:UpdateProgress ID='UpdateProgress1' runat='server' Visible='false'> ";
                    StrTemp += "<ProgressTemplate>";
                    StrTemp += " <img alt='لطفا منتظر بمانيد' src='" + dr[0]["startURL"].ToString() + "App_Utility/Images/ProgressImage/throbber4.gif' width='16px' height='16px'/>";  //indicator7.gif //throbber.gif
                    StrTemp += " </ProgressTemplate>";
                    StrTemp += "</asp:UpdateProgress>";
                    StrTemp += "</td></tr></table>";
                }
            }

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