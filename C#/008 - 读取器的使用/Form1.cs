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

namespace _008___读取器的使用
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            string connStr = "Data Source=DESKTOP-HMF772I\\SQLSERVER;Initial Catalog=CZSchool;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // 【重点】不要用 `*` 因为它的效率非常低，而且容易出错
                string sql = "SELECT SubjectId, SubjectName, ClassHour, ClassId FROM Subject";
                SqlCommand comm = new SqlCommand(sql, conn);

                // 创建这个对象，相当于向服务器请求数据，服务器会响应，将数据存储到服务器缓存中。
                // 你还需要用某种方式来将他读取出来
                SqlDataReader reader = comm.ExecuteReader();
                // .Read()先判断有无下一行记录，有的话就将指针移动到下一行记录，同时将这一行记录的数据读取到 reader 对象的 _data[] 数组，此数组是一个私有数组，通过方法或者索引器进行访问
                while (reader.Read())
                {
                    // 先创建主项，再为主项添加子项
                    ListViewItem listViewItem = new ListViewItem(reader["SubjectId"].ToString());
                    listViewItem.SubItems.AddRange(new string[] {
                        reader["SubjectName"].ToString(),
                        reader["ClassHour"].ToString(),
                        reader["ClassId"].ToString()
                    });
                    this.listViewSubject.Items.Add(listViewItem);
                }
            }
        }
    }
}
