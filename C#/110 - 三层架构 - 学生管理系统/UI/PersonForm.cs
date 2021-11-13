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
        /// <summary>
        /// 全局的 Person 表业务层处理对象
        /// </summary>
        BLL.PersonManager personManager = new BLL.PersonManager();


        // 将他设置为 private 以便使用单例模式
        private PersonForm()
        {
            InitializeComponent();

            // 如果没有绑定的列不会自动生成显示
            this.dgvList.AutoGenerateColumns = false;
        }

        #region 单例模式生成唯一的当前窗口 + public static PersonForm CreateSingle()
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
        #endregion


        /// <summary>
        /// 窗体加载，显示 dgv 控件的显示
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void PersonForm_Load(object sender, EventArgs e)
        {
            this.dgvList.DataSource = personManager.GetAllPersonList(false);
        }

    }
}
