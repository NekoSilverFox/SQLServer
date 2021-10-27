namespace _007___登录和注册
{
    partial class FormSignUp
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要修改
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.txtClassLogin = new System.Windows.Forms.TextBox();
            this.labelLogin = new System.Windows.Forms.Label();
            this.txtClassPwd = new System.Windows.Forms.TextBox();
            this.labelPwd = new System.Windows.Forms.Label();
            this.txtClassEmail = new System.Windows.Forms.TextBox();
            this.txtClassTel = new System.Windows.Forms.TextBox();
            this.labelEmail = new System.Windows.Forms.Label();
            this.labelTel = new System.Windows.Forms.Label();
            this.btnSignUp = new System.Windows.Forms.Button();
            this.btnSignIn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // txtClassLogin
            // 
            this.txtClassLogin.Location = new System.Drawing.Point(169, 65);
            this.txtClassLogin.Name = "txtClassLogin";
            this.txtClassLogin.Size = new System.Drawing.Size(128, 21);
            this.txtClassLogin.TabIndex = 0;
            // 
            // labelLogin
            // 
            this.labelLogin.AutoSize = true;
            this.labelLogin.Location = new System.Drawing.Point(106, 68);
            this.labelLogin.Name = "labelLogin";
            this.labelLogin.Size = new System.Drawing.Size(29, 12);
            this.labelLogin.TabIndex = 1;
            this.labelLogin.Text = "登录";
            // 
            // txtClassPwd
            // 
            this.txtClassPwd.Location = new System.Drawing.Point(169, 116);
            this.txtClassPwd.Name = "txtClassPwd";
            this.txtClassPwd.Size = new System.Drawing.Size(128, 21);
            this.txtClassPwd.TabIndex = 0;
            // 
            // labelPwd
            // 
            this.labelPwd.AutoSize = true;
            this.labelPwd.Location = new System.Drawing.Point(106, 119);
            this.labelPwd.Name = "labelPwd";
            this.labelPwd.Size = new System.Drawing.Size(29, 12);
            this.labelPwd.TabIndex = 1;
            this.labelPwd.Text = "密码";
            // 
            // txtClassEmail
            // 
            this.txtClassEmail.Location = new System.Drawing.Point(169, 172);
            this.txtClassEmail.Name = "txtClassEmail";
            this.txtClassEmail.Size = new System.Drawing.Size(128, 21);
            this.txtClassEmail.TabIndex = 0;
            // 
            // txtClassTel
            // 
            this.txtClassTel.Location = new System.Drawing.Point(169, 223);
            this.txtClassTel.Name = "txtClassTel";
            this.txtClassTel.Size = new System.Drawing.Size(128, 21);
            this.txtClassTel.TabIndex = 0;
            // 
            // labelEmail
            // 
            this.labelEmail.AutoSize = true;
            this.labelEmail.Location = new System.Drawing.Point(106, 175);
            this.labelEmail.Name = "labelEmail";
            this.labelEmail.Size = new System.Drawing.Size(29, 12);
            this.labelEmail.TabIndex = 1;
            this.labelEmail.Text = "邮箱";
            // 
            // labelTel
            // 
            this.labelTel.AutoSize = true;
            this.labelTel.Location = new System.Drawing.Point(106, 226);
            this.labelTel.Name = "labelTel";
            this.labelTel.Size = new System.Drawing.Size(29, 12);
            this.labelTel.TabIndex = 1;
            this.labelTel.Text = "电话";
            // 
            // btnSignUp
            // 
            this.btnSignUp.Location = new System.Drawing.Point(99, 274);
            this.btnSignUp.Name = "btnSignUp";
            this.btnSignUp.Size = new System.Drawing.Size(93, 23);
            this.btnSignUp.TabIndex = 2;
            this.btnSignUp.Text = "注册";
            this.btnSignUp.UseVisualStyleBackColor = true;
            this.btnSignUp.Click += new System.EventHandler(this.btnSignUp_Click);
            // 
            // btnSignIn
            // 
            this.btnSignIn.Location = new System.Drawing.Point(227, 274);
            this.btnSignIn.Name = "btnSignIn";
            this.btnSignIn.Size = new System.Drawing.Size(93, 23);
            this.btnSignIn.TabIndex = 2;
            this.btnSignIn.Text = "登录";
            this.btnSignIn.UseVisualStyleBackColor = true;
            this.btnSignIn.Click += new System.EventHandler(this.btnSignIn_Click);
            // 
            // FormSignUp
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(425, 354);
            this.Controls.Add(this.btnSignIn);
            this.Controls.Add(this.btnSignUp);
            this.Controls.Add(this.labelTel);
            this.Controls.Add(this.labelPwd);
            this.Controls.Add(this.labelEmail);
            this.Controls.Add(this.labelLogin);
            this.Controls.Add(this.txtClassTel);
            this.Controls.Add(this.txtClassEmail);
            this.Controls.Add(this.txtClassPwd);
            this.Controls.Add(this.txtClassLogin);
            this.Name = "FormSignUp";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtClassLogin;
        private System.Windows.Forms.Label labelLogin;
        private System.Windows.Forms.TextBox txtClassPwd;
        private System.Windows.Forms.Label labelPwd;
        private System.Windows.Forms.TextBox txtClassEmail;
        private System.Windows.Forms.TextBox txtClassTel;
        private System.Windows.Forms.Label labelEmail;
        private System.Windows.Forms.Label labelTel;
        private System.Windows.Forms.Button btnSignUp;
        private System.Windows.Forms.Button btnSignIn;
    }
}

