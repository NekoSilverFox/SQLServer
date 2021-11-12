using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UI
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string name = this.txtUserName.Text.Trim();
            string pwd = this.txtPwd.Text.Trim();

            BLL.PersonManager personManager = new BLL.PersonManager();
            MODEL.Person person = personManager.Login(name);
            if (person == null)
            {
                MessageBox.Show("用户名不存在");
            }
            else
            {
                if(person.PPwd == pwd)
                {
                    MessageBox.Show("登陆成功\n" +
                        "欢迎您：" + person.PPYName);
                }
                else
                {
                    MessageBox.Show("密码错误");
                }
            }
        }
    }
}
