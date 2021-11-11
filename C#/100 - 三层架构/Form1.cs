using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _100___三层架构
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            // 收集用户数据
            string userName = txtBoxLogin.Text.Trim();
            string userPwd = txtBoxPassword.Text.Trim();
            _101___BLL___初识Business_Logic_Layer.PersonManager pm = new _101___BLL___初识Business_Logic_Layer.PersonManager();
            if (pm.Login(userName, userPwd))
            {
                MessageBox.Show("ok");
            }
            else
            {
                MessageBox.Show("no");
            }
        }
    }
}
