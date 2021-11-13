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
    public partial class PersonForm : Form
    {
        // 将他设置为 private 以便使用单例模式
        private PersonForm()
        {
            InitializeComponent();
        }

        /// <summary>
        /// 单例模式生成唯一的当前窗口
        /// </summary>
        static PersonForm personForm = null;
        public static PersonForm CreateSingle()
        {
            // 如果窗体为空或者被释放就打开新的窗体
            if ((personForm == null) || personForm.IsDisposed)
            {
                personForm = new PersonForm();
            }
            return personForm;
        }


        private void PersonForm_Load(object sender, EventArgs e)
        {

        }

    }
}
