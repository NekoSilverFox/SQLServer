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
                /*                string sql = string.Format("Select count(*) from [user] where username='{0}' and pass='{1}'",
                                    txtClassLogin.Text.Trim(),
                                    txtClassPwd.Text.Trim());

                                SqlCommand comm = new SqlCommand(sql, conn);*/


                // 1. 定义参数占位 `@`参数相当于在 SQL 中创建的一个变量，所以也不需要使用 `'单引号'` 包含
                string sql = "Select count(*) from [user] where username=@UserName and pass=@Password";
                // 2. 在 C# 中创建对应的参数对象，参数名称不区分大小写
                SqlParameter username = new SqlParameter("@UserName", txtClassLogin.Text.Trim());
                SqlParameter password = new SqlParameter("@Password", txtClassPwd.Text.Trim());
                // 3. 将创建好的参数传递给服务器让其使用。所以让 command 对象将参数一起传递进去
                SqlCommand comm = new SqlCommand(sql, conn);
                comm.Parameters.Add(username);
                comm.Parameters.Add(password);


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
