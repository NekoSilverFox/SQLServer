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
using System.IO;

namespace _009___数据的导出和导入
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnOutput_Click(object sender, EventArgs e)
        {
            string connStr = "Data Source=DESKTOP-HMF772I\\SQLSERVER;Initial Catalog=CZSchool;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (StreamWriter streamWriter = new StreamWriter("grade.txt"))
                {
                    conn.Open();
                    string sql = "SELECT Classid, ClassName FROM Grade";
                    SqlCommand comm = new SqlCommand(sql, conn);
                    SqlDataReader reader = comm.ExecuteReader();
                    while(reader.Read())
                    {
                        streamWriter.WriteLine(reader["Classid"] + "|" + reader["ClassName"]);
                    }
                    MessageBox.Show("导出成功");
                }
            }


        }

        private void btnInput_Click(object sender, EventArgs e)
        {
            using (StreamReader streamReader = new StreamReader("grade.txt"))
            {
                // 先读出一行
                string line = streamReader.ReadLine();
                // 如果这一行不是空字符串或者null，就做相应的处理
                while (!string.IsNullOrEmpty(line))
                {
                    // 做一个字符串分割
                    string[] split = line.Split('|');

                    // 自己写一个函数方便我们插入
                    InsertClassName(split[1]);

                    // 【重点】一定要记得，读取下一行
                    line = streamReader.ReadLine();
                }

                MessageBox.Show("导入成功");
            }

        }


        void InsertClassName(string classname)
        {
            string connStr = "Data Source=DESKTOP-HMF772I\\SQLSERVER;Initial Catalog=CZSchool;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string sql = "INSERT INTO Grade VALUES(@ClassName)";
                SqlParameter parClassname = new SqlParameter("@ClassName", classname);
                SqlCommand comm = new SqlCommand(sql, conn);
                comm.Parameters.Add(parClassname);
                comm.ExecuteNonQuery();
            }
        }
    }
}
