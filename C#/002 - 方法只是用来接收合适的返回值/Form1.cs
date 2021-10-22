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

namespace _002___方法只是用来接收合适的返回值
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // 1. 创建连接字符串
            string connStr = "server=DESKTOP-HMF772I\\SQLSERVER;uid=sa;pwd=123;database=CZSchool";

            // 2. 创建连接通道
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // 3. 打开连接
                conn.Open();

                // 4. 创建命令语句
                string sql = string.Format("insert into grade values('{0}'); select count(*) from grade;", txtCName.Text.Trim());

                // 5. 创建命令“执行”对象：只是一个传递命令的对象同时接受从服务器返回的值
                SqlCommand command = new SqlCommand(sql, conn);

                // 6.让对象命令执行方法。
                // 【重点】命令语句不是由命令对象而执行的，因为命令语句是由服务器执行的。服务器会执行传递过来的所有命令，同时也会返回所有的返回值。
                // 但是方法只能返回某一种值。意味着方法的本质作用是：接收某一用户需要返回的值
                //int num = command.ExecuteNonQuery();
                //MessageBox.Show(num == 1 ? "ok" : "no"); 返回 ok

                string str = command.ExecuteScalar().ToString();
                MessageBox.Show(str);

            }
        }
    }
}
