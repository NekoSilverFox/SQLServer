﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace _004___创建读取器对象读取数据
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void lvVlasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            string connStr = "Data Source=DESKTOP-HMF772I\\SQLSERVER;Initial Catalog=CZSchool;User ID=sa;Password=123";

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string sql = "Select classid, classname from grade";

                // 创建命令对象
                SqlCommand comm = new SqlCommand(sql, conn);

                // 创建一个读取器对象，这个对象可以从服务器中每次读取出一行数据
                SqlDataReader reader = comm.ExecuteReader();

                // 循环读取数据
                // 先判断有没有下一行记录，如果有的话就将读取指针移动到下一行记录。
                // 而且还将数据读取到读取器对象 private SqlBuffer[] _data; 数组中
                while(reader.Read())
                {
                    // 先添加主项，再为主项添加子项
                    ListViewItem lv = new ListViewItem(reader[0].ToString());

                    // 为主项添加子项
                    lv.SubItems.Add(reader["classname"].ToString());

                    // 将主项添加到控件的 Items 集合
                    lvClasses.Items.Add(lv);
                }
            }
        }
    }
}
