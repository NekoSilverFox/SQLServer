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
    public partial class FormSignUp : Form
    {
        public FormSignUp()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void btnSignUp_Click(object sender, EventArgs e)
        {
            string connStr = "Data Source=DESKTOP-HMF772I\\SQLSERVER;Initial Catalog=CZSchool;Integrated Security=True";

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                //【重点】这里的 `user`一定要加一个打括号，因为会和SQL中的关键字冲突
                string sql = string.Format("Insert into [user] values(@username,@pass,@email,@phone)");
                SqlParameter[] ps =
                {
                    new SqlParameter("@username", txtClassLogin.Text.Trim()),
                    new SqlParameter("@pass", txtClassPwd.Text.Trim()),
                    new SqlParameter("@email", string.IsNullOrEmpty(txtClassEmail.Text.Trim())? DBNull.Value : (object)txtClassEmail.Text.Trim()),
                    new SqlParameter("@phone", string.IsNullOrEmpty(txtClassTel.Text.Trim())? DBNull.Value : (object)txtClassTel.Text.Trim()),
                };

                //string sql = string.Format("Insert into [user] values('{0}','{1}','{2}','{3}')",
                //    txtClassLogin.Text.Trim(),
                //    txtClassPwd.Text.Trim(),
                //    txtClassEmail.Text.Trim(),
                //    txtClassTel.Text.Trim()
                //    );

                SqlCommand comm = new SqlCommand(sql, conn);
                comm.Parameters.AddRange(ps);

                // 方法的作用不在于可以执行的哪一种命令，而在于只能接受从服务器返回的某种类型的值
                int num = comm.ExecuteNonQuery();

                if (num  == 1)
                {
                    MessageBox.Show("注册成功");
                }
                else
                {
                    MessageBox.Show("注册失败");
                }
            }
        }

        private void btnSignIn_Click(object sender, EventArgs e)
        {
            // 这里的 FormSignIn 就是我们的登录窗口
            FormSignIn formSignIn = new FormSignIn();

            // 将登录窗口显示出来
            formSignIn.Show();
        }
    }
}
