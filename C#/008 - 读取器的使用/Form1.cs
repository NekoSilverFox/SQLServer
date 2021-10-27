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

        private void listViewSubject_Click(object sender, EventArgs e)
        {
            // 判断有没有选中一行数据
            if (this.listViewSubject.SelectedItems.Count == 0)
            {
                return;
            }

            // Subitems 项的值会从第0项开始计算，也包含主控件的
            listViewSubject.Tag = this.listViewSubject.SelectedItems[0].SubItems[0].Text; // listViewSubject 是那个窗体中我们生成的表格
            txtBoxSubName.Text = this.listViewSubject.SelectedItems[0].SubItems[1].Text;
            txtBoxSubTime.Text = this.listViewSubject.SelectedItems[0].SubItems[2].Text;
            txtBoxClassName.Text = this.listViewSubject.SelectedItems[0].SubItems[3].Text;
        }

        private void 删除ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // 判断有没有选中一行数据
            if (this.listViewSubject.SelectedItems.Count == 0)
            {
                return;
            }

            // 重点是得到一个 ID 号，Parse是进行类型转换
            int id = int.Parse(this.listViewSubject.SelectedItems[0].SubItems[0].Text);

            string connStr = "Data Source=DESKTOP-HMF772I\\SQLSERVER;Initial Catalog=CZSchool;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string sql = string.Format("DELETE FROM Subject where subjectid='{0}'", id);
                SqlCommand comm = new SqlCommand(sql, conn);
                int isSucc = comm.ExecuteNonQuery();

                if (isSucc == 1)
                {
                    MessageBox.Show("删除成功");

                    //【重点】 注意，删除后记得刷新一下，两种方法都可以
                    //this.listViewSubject.Items.Remove(this.listViewSubject.SelectedItems[0]); // Remove 直接删除项
                    this.listViewSubject.Items.RemoveAt(this.listViewSubject.SelectedItems[0].Index);   // RemoveAt 根据索引值删除
                }
                else
                {
                    MessageBox.Show("删除失败");
                }
            }

        }
    }
}
