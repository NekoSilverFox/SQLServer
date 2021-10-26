using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.Data.SqlClient;

namespace _005___几种创建连接字符串的方法
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnConnStr_Click(object sender, EventArgs e)
        {
            // SLQ 身份验证
            string connStr1 = "Data Source=DESKTOP-HMF772I\\SQLSERVER;Initial Catalog=CZSchool;User ID=sa;Password=***********";

            // Windows 身份验证
            string connStr2 = "Data Source=DESKTOP-HMF772I\\SQLSERVER;Initial Catalog=CZSchool;Integrated Security=True";
        }

        private void SqlConnectStringBuilder_Click(object sender, EventArgs e)
        {
            SqlConnectionStringBuilder ssb = new SqlConnectionStringBuilder();
            ssb.DataSource = "DESKTOP-HMF772I\\SQLSERVER";
            ssb.InitialCatalog = "CZSchool";
            ssb.IntegratedSecurity = true;

            // 通过内置的属性获取连接字符串
            String connStr = ssb.ConnectionString;

            MessageBox.Show(connStr);
        }

        private void btnGet_Click(object sender, EventArgs e)
        {
            SqlConnectionStringBuilder ssb = new SqlConnectionStringBuilder();
            propertyGrid1.SelectedObject = ssb;
        }

        private void propertyGrid1_Click(object sender, EventArgs e)
        {

        }
    }
}
