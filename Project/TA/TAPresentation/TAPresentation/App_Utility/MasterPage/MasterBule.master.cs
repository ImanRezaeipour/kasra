using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
namespace TAPresentation.App_Utility.MasterPage
{
    public partial class MasterBule : System.Web.UI.MasterPage
    {
        string PageID = "0";
        string OnLineUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            CreateShortKey();

        }
        #region "ShortKey"
        private void CreateShortKey()
        {
            try
            {
                ContentPlaceHolder mpContentPlaceHolder;
                HtmlInputControl otxtPageID, otxtOnLineUser;
                mpContentPlaceHolder = (ContentPlaceHolder)this.FindControl("ContentPlaceHolder1");
                if (mpContentPlaceHolder != null)
                {
                    otxtPageID = (HtmlInputControl)mpContentPlaceHolder.FindControl("txtPageID");
                    otxtOnLineUser = (HtmlInputControl)mpContentPlaceHolder.FindControl("txtOnLineUser");
                    if (otxtPageID != null && otxtOnLineUser != null)
                    {
                        PageID = otxtPageID.Value;
                        OnLineUser = otxtOnLineUser.Value;
                        GenerateScript();
                    }
                }
            }
            catch (Exception)
            {

            }
        }
        private void GenerateScript()
        {
            TADAL.App_Classes.GeneralDAL ODAL = new TADAL.App_Classes.GeneralDAL();

            TACommon.App_Entities.GeneralEntity OdsSurveyAccess = new TACommon.App_Entities.GeneralEntity();
            OdsSurveyAccess = ODAL.SurveyAccessShortKeys(Convert.ToInt32(OnLineUser), Convert.ToInt32(PageID));

            //=======================
            string StrJs = "", StrJsFunc = "", ShortKey = "", tmpStr1 = "", tmpStr2 = "",StrMainKeyCode="";
            int rLen = OdsSurveyAccess.ShortKeys.Rows.Count;
            if (rLen == 0)
                return;
            //------------------------------------------
            //Generate Array Like This
            /*
             var arrDefaultShortKeys = {
                0: ["Shift + F2", "ايجاد"],
                1: ["Shift + F4", "ذخيره"],
                2: ["Shift + F8", "فيلتر"],
                3: ["Shift + F7", "جستجو"],
                4: ["Shift + F9", "نمايش همه"],
                5: ["Shift + Delete", "حذف"]
             };
             */
            
            StrJs += @"var arrMyShortKey ={" + Convert.ToChar(13);

            for (int i = 0; i < rLen; i++)
            {
                if (i != 0)
                    StrJs += "," + Convert.ToChar(13);
                tmpStr1 = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(OdsSurveyAccess.ShortKeys.Rows[i]["MainKey"].ToString());
                tmpStr2 = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(OdsSurveyAccess.ShortKeys.Rows[i]["Key"].ToString());
                StrMainKeyCode = GetKeyCode(OdsSurveyAccess.ShortKeys.Rows[i]["MainKey"].ToString());
                ShortKey = tmpStr1 + " + " + tmpStr2;
                StrJs += i.ToString() + ": ['" + ShortKey + "','";
                StrJs += OdsSurveyAccess.ShortKeys.Rows[i]["Name"].ToString() + "']";

            }
            StrJs += "};";
            //------------------------------------------
            //Set Main KeyCode
            StrJs += " MainKey="+StrMainKeyCode;
            //------------------------------------------
            //Create function Master_onkeydown()
            StrJsFunc += " {0} function Master_onkeydown()  OpenB {0}";
            StrJsFunc += @" key = window.event.keyCode {0}"
                    + " if (key == MainKey) {0}"
                    + " isMain = true; {0}";

            //Pressing First To Show ShortKet Table
            StrJsFunc += " if (key == Help && isMain == true)  OpenB {0}";
            StrJsFunc += " ShowPopUp_Master() {0}";
            StrJsFunc += " isMain = false {0}";
            StrJsFunc += "  return false;{0} ColoseB {0}";

            for (int i = 0; i < rLen; i++)
            {
                StrJsFunc += " if (key == {1} && isMain == true) OpenB  {0}";
                StrJsFunc += " if (typeof OnClick{2} == 'function') OpenB {0}";
                StrJsFunc += " OnClick{2}() {0}";
                StrJsFunc += " window.focus() {0} ColoseB";
                StrJsFunc += " isMain = false {0} return false;{0} ColoseB {0}";
                StrJsFunc = String.Format(StrJsFunc
                    , Convert.ToChar(13),GetKeyCode(OdsSurveyAccess.ShortKeys.Rows[i]["Key"].ToString())
                    , OdsSurveyAccess.ShortKeys.Rows[i]["AccessCode"].ToString()
                    );
            }
            //------------------------------------------
            //Fix Str JavaScript
            StrJsFunc = StrJsFunc.Replace("OpenB", "{");
            StrJsFunc = StrJsFunc.Replace("ColoseB", "}");
            StrJsFunc += "}";
            //------------------------------------------
            ScriptManager.RegisterStartupScript(this, this.GetType(), "starScript", StrJs + StrJsFunc, true);

        }
        private string GetKeyCode(string ipt)
        {
            string resualt = "";
            ipt = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(ipt);
            char t;
            if (ipt.Length == 1)
            {
                t = Convert.ToChar(ipt.Substring(0, 1));
                if (Char.IsLetter(t))
                    resualt = (Char.ConvertToUtf32(char.ToUpper(t).ToString(), 0)).ToString();
            }
            else
            {
                switch (ipt)
                {
                    case "F1":
                        resualt = "112";
                        break;
                    case "F2":
                        resualt = "113";
                        break;
                    case "F3":
                        resualt = "114";
                        break;
                    case "F4":
                        resualt = "115";
                        break;
                    case "F5":
                        resualt = "116";
                        break;
                    case "F6":
                        resualt = "117";
                        break;
                    case "F7":
                        resualt = "118";
                        break;
                    case "F8":
                        resualt = "119";
                        break;
                    case "F9":
                        resualt = "120";
                        break;
                    case "F10":
                        resualt = "121";
                        break;
                    case "F11":
                        resualt = "122";
                        break;
                    case "F12":
                        resualt = "123";
                        break;
                    case "Shift":
                        resualt = "16";
                        break;
                    case "Ctrl":
                        resualt = "17";
                        break;
                    case "Alt":
                        resualt = "18";
                        break;
                    case "Escape":
                        resualt = "27";
                        break;
                    case "Delete":
                        resualt = "46";
                        break;
                }
            }
            return resualt;
        }
        #endregion
    }
}
