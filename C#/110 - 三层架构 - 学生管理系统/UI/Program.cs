using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UI
{
    static class Program
    {
        /// <summary>
        /// 应用程序的主入口点。
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            // 【起始窗体】form1 就是 LoginForm，form1重命名的时候忘记配置自动修改了。。。
            Form1 loginForm = new Form1();

            // 打开的窗体会返回一个 DialogResult 值
            if (loginForm.ShowDialog() == DialogResult.OK)
            {
                Application.Run(new MainForm());    // 【主窗体】

            }
        }
    }
}
