using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

// 当我们创建的对象里面有 sql 三个字的就要引入这个命名空间
using System.Data.SqlClient;


namespace _001___增加班级信息
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        /*
         * 1. 创建数据库链接（服务器名称 身份验证）
         * 2. 点击链接打开数据库链接
         * 3. 切换当前操作的数据库
         * 4. 创建SQL命令
         * 5. 点击 “执行” --> 返回值
         * 6. 判断
         * 7. 关闭链接
         */
        private void btnAdd_Click(object sender, EventArgs e)
        {
            // 1. 创建连接通道
            SqlConnection conn = new SqlConnection();

            // 2. 告诉连接通道具体如何进行连接
            string connStr = "server=DESKTOP-HMF772I\\SQLSERVER;uid=sa;pwd=123;database=CZSchool";

            // 3. 指定连接通道如何进行连接
            conn.ConnectionString = connStr;

            // 4. 因为连接的是一个对象，还需要打开
            conn.Open();

            // 5. 创建你需要执行的SQL命令
            //string sql = "insert into grade values('"+txtClassName.Text.Trim()+"')";
            string sql = string.Format("insert into grade values('{0}')", textClassName.Text.Trim());

            // 6. 创建命令 "执行" 对象：这只是一个命令的传递者，告诉他：去哪里，做什么
            SqlCommand comm = new SqlCommand();

            // 7. 指定命令怎么走
            comm.Connection = conn;

            // 8. 指定要传递的命令语句
            comm.CommandText = sql;

            // 9. 让命令对象“执行”命令，同时接收从服务器返回的值
            int num = comm.ExecuteNonQuery();

            // 10. 对返回的值进行判断
            if (num == 1)
            {
                MessageBox.Show("增加成功");
            }
            else
            {
                MessageBox.Show("增加失败");
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
