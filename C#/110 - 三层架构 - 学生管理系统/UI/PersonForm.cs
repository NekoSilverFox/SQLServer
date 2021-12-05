using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

// 正则表达式
using System.Text.RegularExpressions;

namespace UI
{
    public partial class PersonForm : Form
    {
        /// <summary>
        /// 全局的 Person 表业务层处理对象
        /// </summary>
        BLL.PersonManager personManager = new BLL.PersonManager();

        /// <summary>
        /// 全局的班级表业务层处理对象
        /// </summary>
        BLL.ClassesManager classesManager = new BLL.ClassesManager();

        // 将他设置为 private 以便使用单例模式
        private PersonForm()
        {
            InitializeComponent();

            // 如果没有绑定的列不会自动生成显示
            this.dgvList.AutoGenerateColumns = false;

            // 绑定班级下拉列表数据
            this.cboClasses.DisplayMember = "cname";    // 显示的值
            this.cboClasses.ValueMember = "cid";    // 注意这里，绑定实际的值
            this.cboClasses.DataSource = classesManager.getAllClassesList(false);   // 绑定集合
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

        #region 显示新增学员面板 + void tsmiAddStudent_Click(object sender, EventArgs e)
        /// <summary>
        /// 显示新增学员面板
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tsmiAddStudent_Click(object sender, EventArgs e)
        {
            gpAdd.Visible = true;
        }
        #endregion

        private void cboClasses_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void gpAdd_Enter(object sender, EventArgs e)
        {

        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            // 先判断输入内容是否合法
            if (ValidataUser() == false)
            {
                return;
            }

            MODEL.Person newPerson = new MODEL.Person();

            /*
             一般有 2 种方式取出下拉列表中存储的 ID号：
                1. 通过 SelectedValue，前提是你之前设置了 ValueMember 值
                2. 可以通过绑定项（SelectItem）
                    如果数据源是表，那么 SelectedItem 就是 DataRowView，
                    如果数据源是集合，那么 SelectedItem 就是对象
             */
            newPerson.PCID = (this.cboClasses.SelectedItem as MODEL.Classes).CID;
            newPerson.PCName = this.txtName.Text.Trim();
            newPerson.PType = this.cboIdentity.SelectedIndex + 1;
            newPerson.PLoginName = txtLoginName.Text.Trim();
            newPerson.PPYName = ""; // 以后再处理
            newPerson.PPwd = txtPwd2.Text.Trim();
            newPerson.PGender = rdoMale.Checked;
            newPerson.PEmail = txtEmail.Text.Trim();
            newPerson.PAreas = ""; // 以后再处理

            if (personManager.InsertPerson(newPerson) == 1)
            {
                MessageBox.Show("添加成功！");

                // 【重点】添加成功后记得刷新！！！！也就是重新加载一下
                this.dgvList.DataSource = personManager.GetAllPersonList(false);
            }
            else
            {
                MessageBox.Show("添加失败！");
            }
        }

        #region
        /// <summary>
        /// 用户信息输入检测
        /// </summary>
        /// <returns></returns>
        bool ValidataUser()
        {
            // 如果为空，或者有非法字符
            if (string.IsNullOrEmpty(this.txtName.Text.Trim()) || Regex.IsMatch(txtName.Text.Trim(), @"\W"))
            {
                MessageBox.Show("请输入合法的用户名");

                // 【重点】定位光标
                txtName.Focus();
                return false;
            }

            // 如果为空，或者有非法字符
            if (string.IsNullOrEmpty(this.txtLoginName.Text.Trim()) || Regex.IsMatch(txtLoginName.Text.Trim(), @"\W"))
            {
                MessageBox.Show("请输入合法的登录名");

                // 【重点】定位光标
                txtLoginName.Focus();
                return false;
            }

            // 如果为空，或者有非法字符
            if (string.IsNullOrEmpty(this.txtPwd.Text.Trim()) || this.txtPwd.Text.Trim() != this.txtPwd2.Text.Trim())
            {
                MessageBox.Show("请输入两次一致的密码");

                // 【重点】定位光标
                txtPwd2.Focus();
                return false;
            }

            // 填了邮箱就判断邮箱格式是否正确
            if (!string.IsNullOrEmpty(this.txtEmail.Text.Trim()))
            {
                if (!Regex.IsMatch(txtEmail.Text.Trim(), @"\w+[@]\w+[.]\w+"))
                {
                    MessageBox.Show("请输入合法的电子邮箱");
                    txtEmail.Focus();
                    return false;
                }
            }

            return true;
        }
        #endregion

    }
}
