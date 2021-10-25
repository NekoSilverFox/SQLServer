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


namespace _003___获取标识列
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void txtClassName_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            string connStr = "server=DESKTOP-HMF772I\\SQLSERVER;uid=sa;pwd=123;database=CZSchool";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // select @@IDENTITY
                String sql = string.Format("insert into grade values('{0}'); select @@IDENTITY", txtClassName.Text.Trim());

                SqlCommand comm = new SqlCommand(sql, conn);
                string str = comm.ExecuteScalar().ToString();

                MessageBox.Show("标识列值是：" + str);

            }
        }
    }
}
