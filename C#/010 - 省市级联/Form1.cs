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


namespace _010___省市级联
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        // 点击空白处跳转至此，我们首先要加载省的值
        private void Form1_Load(object sender, EventArgs e)
        {
            LoadData("0", cboProvience);
            // 通过循环添加下拉列表项，那么下拉列表不会默认选择第一项
            cboProvience.SelectedIndex = 0;


        }

        #region 自己写的，加载下拉列表数据 +void LoadData(string id, ComboBox cbo)
        /// <summary>
        ///  自己写的，加载下拉列表数据
        /// </summary>
        /// <param name="id"></param>
        /// <param name="cbo"></param>
        void LoadData(string id, ComboBox cbo)
        {
            string connSrt = "Data Source=DESKTOP-HMF772I\\SQLSERVER;Initial Catalog=CZSchool;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connSrt))
            {
                conn.Open();
                string sql = "SELECT aid, aname FROM Areas WHERE APid=@id";
                SqlParameter p = new SqlParameter("@id", id);
                SqlCommand comm = new SqlCommand(sql, conn);
                comm.Parameters.Add(p);
                SqlDataReader reader = comm.ExecuteReader();
                while (reader.Read())
                {
                    cbo.Items.Add(reader["aname"]);
                }
            }
        }
        #endregion

        // 获取省市所对应的Aid
        string GetAid(string aname)
        {
            string connStr = "Data Source=DESKTOP-HMF772I\\SQLSERVER;Initial Catalog=CZSchool;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string sql = "SELECT AID FROM Areas WHERE aname=@name";
                SqlParameter p = new SqlParameter("@name", aname);
                SqlCommand comm = new SqlCommand(sql, conn);
                comm.Parameters.Add(p);
                return comm.ExecuteScalar().ToString();
            }
        }

        // 当下拉列表选项发生改变时，触发事件
        private void cboProvience_SelectedIndexChanged(object sender, EventArgs e)
        {
            // MessageBox.Show("触发事件");
            string name = cboProvience.SelectedItem.ToString();
            string id = GetAid(name);
            // MessageBox.Show(id);
            this.cboCity.Items.Clear();     // 【重点】先清空！！！

            LoadData(id, cboCity);
            this.cboCity.SelectedIndex = 0; // 【重点】是SelectedIndex 不是 SelectedItem！！

        }
    }
}
