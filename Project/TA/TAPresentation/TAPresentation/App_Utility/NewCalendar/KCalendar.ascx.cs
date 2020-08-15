using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Weblib;

namespace TAPresentation.App_Utility.NewCalendar
{
    public partial class KCalendar1 : System.Web.UI.UserControl
    {
        public string value;
        public string reverseValue;
        protected void Page_Load(object sender, EventArgs e)
        {
            string strUserControl = this.ClientID;
            TBMain.Attributes.Add("UserControlID", strUserControl);
            //txt به دست آوردن تاریخ فعلی برای زمانی که کاربر تاریخ را وارد می کند و اصلاح تاریخ طبق مقدار این 
            txtDateNow.Value = Weblib.SHDate.Today();
            SetDate();

        }
        private void SetDate()
        {
            //  مقداردهی شده باشدو چسباندن روز به ته آن request در صورتی که این مقدار با 
            if (value != null && value != "" && value != "//")
            {
                string[] arr = new string[3];
                arr = value.Split('/');
                txtYear.Value = arr[0];
                txtMonth.Value = arr[1];
                txtDay.Value = arr[2];
                SqlConnection cnn = new SqlConnection();
                KasraDll.Connection ConnString = new KasraDll.Connection();
                cnn.ConnectionString = ConnString.GenCnnConnection();

                //SqlConnection cnn = new SqlConnection(ConfigurationSettings.AppSettings["SysConn"]);
                SqlCommand cmd = new SqlCommand();

                cmd.Connection = cnn;
                cmd.CommandText = "select Gnr.GetDOW('" + txtYear.Value.Substring(2, 2) + "/" + txtMonth.Value + "/" + txtDay.Value + "')";
                cmd.CommandType = CommandType.Text;
                cmd.CommandTimeout = 400000000;
                cnn.Open();
                string s = (string)cmd.ExecuteScalar();
                cnn.Close();

                txtCalendar.Text = arr[2] + '/' + arr[1] + '/' + arr[0] + "  " + s;
            }
        }
    }
}