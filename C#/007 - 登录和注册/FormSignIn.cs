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

namespace _007___登录和注册
{
    public partial class FormSignIn : Form
    {
        public FormSignIn()
        {
            InitializeComponent();
        }

        private void btnSignIn_Click(object sender, EventArgs e)
        {
            string connStr = "Data Source=DESKTOP-HMF772I\\SQLSERVER;Initial Catalog=CZSchool;Integrated Security=True";

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string sql = string.Format("Select count(*) from [user] where username='{0}' and pass='{1}'",
                    txtClassLogin.Text.Trim(),
                    txtClassPwd.Text.Trim());

                SqlCommand comm = new SqlCommand(sql, conn);
                int isSucc = (int)comm.ExecuteScalar();
                if (isSucc > 0)
                {
                    MessageBox.Show("登陆成功");
                }
                else
                {
                    MessageBox.Show("登陆失败");
                }
            }
        }
    }
}
