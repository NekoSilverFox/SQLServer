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
using System.Diagnostics;

namespace _006___连接池
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnConnection_Click(object sender, EventArgs e)
        {
            String connStr = "Data Source=DESKTOP-HMF772I\\SQLSERVER;Initial Catalog=CZSchool;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();
            MessageBox.Show("数据库链接已创建");

            // 释放连接通道。但其实没有真正的释放这个对象，只是将他的状态关闭，同时将连接字符串清空
            conn.Dispose();
            // 如果需要恢复连接重新将连接字符串赋值即可
            conn.ConnectionString = connStr;

            conn.Close();
            MessageBox.Show("数据库链接已关闭");
        }

        private void btnPool_Click(object sender, EventArgs e)
        {
            // pooling=false 不使用连接池
            String connStr = "Data Source=DESKTOP-HMF772I\\SQLSERVER;Initial Catalog=CZSchool;Integrated Security=True;pooling=false";

            // 秒表
            Stopwatch sw = new Stopwatch();
            sw.Start();
            for (int i = 0; i < 1000; i++)
            {
                SqlConnection conn = new SqlConnection(connStr);
                string sql = "Select * from grade";
                conn.Open();
                SqlCommand comm = new SqlCommand(sql, conn);
                comm.ExecuteNonQuery();
                conn.Close();
            }
            sw.Stop();
            MessageBox.Show(sw.Elapsed.ToString());
        }

        private void btnChange_Click(object sender, EventArgs e)
        {
            String connStr = "Data Source=DESKTOP-HMF772I\\SQLSERVER;Initial Catalog=CZSchool;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);

            conn.StateChange += Conn_StateChange; // += 后按两下 Tab 键自动创建
            conn.Open();
            conn.Close();
            conn.Open();
        }

        // 事件（句柄）
        private void Conn_StateChange(object sender, StateChangeEventArgs e)
        {
            //                  上个事件                    当前事件
            MessageBox.Show(e.OriginalState + " " + e.CurrentState);
        }


    }
}
