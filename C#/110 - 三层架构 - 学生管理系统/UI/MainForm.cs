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
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void tsmiStudent_Click(object sender, EventArgs e)
        {
            PersonForm personForm = PersonForm.CreateSingle();

            // 指定打开窗体的MDI父容器为当前窗体
            personForm.MdiParent = this;
            personForm.Show();
        }

        private void tsmiClass_Click(object sender, EventArgs e)
        {
            // 使用另一种方式打开唯一的窗体
            ClassForm classForm = null;

            // 所有生成的窗体都保存在了系统的 `Application` 中，可以通过使用 `Application.OpenForms["窗体名"]` 来调用
            if (Application.OpenForms["ClassForm"] == null)
            {
                classForm = new ClassForm();

                // 【重点】这里是首次打开此窗体，所以要设置 MDI 父窗体
                classForm.MdiParent = this;
                classForm.Show();
            }
            else
            {
                Application.OpenForms["ClassForm"].Show();
            }
        }
    }
}
