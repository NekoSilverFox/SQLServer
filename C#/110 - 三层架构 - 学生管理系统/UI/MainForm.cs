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

        }
    }
}
