namespace UI
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.tsmiUpPwd = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiUpUserName = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiClass = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiStudent = new System.Windows.Forms.ToolStripMenuItem();
            this.tmiFeedBack = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiWindow = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiExit = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmiUpPwd,
            this.tsmiUpUserName,
            this.tsmiClass,
            this.tsmiStudent,
            this.tmiFeedBack,
            this.tsmiWindow,
            this.tsmiExit});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.MdiWindowListItem = this.tsmiWindow;
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(977, 25);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // tsmiUpPwd
            // 
            this.tsmiUpPwd.Name = "tsmiUpPwd";
            this.tsmiUpPwd.Size = new System.Drawing.Size(68, 21);
            this.tsmiUpPwd.Text = "修改密码";
            // 
            // tsmiUpUserName
            // 
            this.tsmiUpUserName.Name = "tsmiUpUserName";
            this.tsmiUpUserName.Size = new System.Drawing.Size(80, 21);
            this.tsmiUpUserName.Text = "修改用户名";
            // 
            // tsmiClass
            // 
            this.tsmiClass.Name = "tsmiClass";
            this.tsmiClass.Size = new System.Drawing.Size(68, 21);
            this.tsmiClass.Text = "班级管理";
            // 
            // tsmiStudent
            // 
            this.tsmiStudent.Name = "tsmiStudent";
            this.tsmiStudent.Size = new System.Drawing.Size(68, 21);
            this.tsmiStudent.Text = "学员管理";
            // 
            // tmiFeedBack
            // 
            this.tmiFeedBack.Name = "tmiFeedBack";
            this.tmiFeedBack.Size = new System.Drawing.Size(92, 21);
            this.tmiFeedBack.Text = "反馈信息管理";
            // 
            // tsmiWindow
            // 
            this.tsmiWindow.Name = "tsmiWindow";
            this.tsmiWindow.Size = new System.Drawing.Size(44, 21);
            this.tsmiWindow.Text = "窗口";
            // 
            // tsmiExit
            // 
            this.tsmiExit.Name = "tsmiExit";
            this.tsmiExit.Size = new System.Drawing.Size(44, 21);
            this.tsmiExit.Text = "退出";
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(977, 487);
            this.Controls.Add(this.menuStrip1);
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menuStrip1;
            this.MinimizeBox = false;
            this.Name = "MainForm";
            this.Text = "Form2";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem tsmiUpPwd;
        private System.Windows.Forms.ToolStripMenuItem tsmiUpUserName;
        private System.Windows.Forms.ToolStripMenuItem tsmiClass;
        private System.Windows.Forms.ToolStripMenuItem tsmiStudent;
        private System.Windows.Forms.ToolStripMenuItem tmiFeedBack;
        private System.Windows.Forms.ToolStripMenuItem tsmiWindow;
        private System.Windows.Forms.ToolStripMenuItem tsmiExit;
    }
}