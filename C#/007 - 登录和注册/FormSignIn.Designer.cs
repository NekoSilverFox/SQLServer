namespace _007___登录和注册
{
    partial class FormSignIn
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
            this.btnSignIn = new System.Windows.Forms.Button();
            this.labelPwd = new System.Windows.Forms.Label();
            this.labelLogin = new System.Windows.Forms.Label();
            this.txtClassPwd = new System.Windows.Forms.TextBox();
            this.txtClassLogin = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // btnSignIn
            // 
            this.btnSignIn.Location = new System.Drawing.Point(215, 219);
            this.btnSignIn.Name = "btnSignIn";
            this.btnSignIn.Size = new System.Drawing.Size(93, 23);
            this.btnSignIn.TabIndex = 7;
            this.btnSignIn.Text = "登录";
            this.btnSignIn.UseVisualStyleBackColor = true;
            this.btnSignIn.Click += new System.EventHandler(this.btnSignIn_Click);
            // 
            // labelPwd
            // 
            this.labelPwd.AutoSize = true;
            this.labelPwd.Location = new System.Drawing.Point(117, 157);
            this.labelPwd.Name = "labelPwd";
            this.labelPwd.Size = new System.Drawing.Size(29, 12);
            this.labelPwd.TabIndex = 5;
            this.labelPwd.Text = "密码";
            // 
            // labelLogin
            // 
            this.labelLogin.AutoSize = true;
            this.labelLogin.Location = new System.Drawing.Point(117, 106);
            this.labelLogin.Name = "labelLogin";
            this.labelLogin.Size = new System.Drawing.Size(29, 12);
            this.labelLogin.TabIndex = 6;
            this.labelLogin.Text = "登录";
            // 
            // txtClassPwd
            // 
            this.txtClassPwd.Location = new System.Drawing.Point(180, 154);
            this.txtClassPwd.Name = "txtClassPwd";
            this.txtClassPwd.Size = new System.Drawing.Size(128, 21);
            this.txtClassPwd.TabIndex = 3;
            // 
            // txtClassLogin
            // 
            this.txtClassLogin.Location = new System.Drawing.Point(180, 103);
            this.txtClassLogin.Name = "txtClassLogin";
            this.txtClassLogin.Size = new System.Drawing.Size(128, 21);
            this.txtClassLogin.TabIndex = 4;
            // 
            // FormSignIn
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(473, 413);
            this.Controls.Add(this.btnSignIn);
            this.Controls.Add(this.labelPwd);
            this.Controls.Add(this.labelLogin);
            this.Controls.Add(this.txtClassPwd);
            this.Controls.Add(this.txtClassLogin);
            this.Name = "FormSignIn";
            this.Text = "FormSignUp";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnSignIn;
        private System.Windows.Forms.Label labelPwd;
        private System.Windows.Forms.Label labelLogin;
        private System.Windows.Forms.TextBox txtClassPwd;
        private System.Windows.Forms.TextBox txtClassLogin;
    }
}