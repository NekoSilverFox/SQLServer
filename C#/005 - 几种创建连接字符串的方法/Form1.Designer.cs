namespace _005___几种创建连接字符串的方法
{
    partial class Form1
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
            this.btnConnStr = new System.Windows.Forms.Button();
            this.SqlConnectStringBuilder = new System.Windows.Forms.Button();
            this.btnGet = new System.Windows.Forms.Button();
            this.propertyGrid1 = new System.Windows.Forms.PropertyGrid();
            this.SuspendLayout();
            // 
            // btnConnStr
            // 
            this.btnConnStr.Location = new System.Drawing.Point(219, 147);
            this.btnConnStr.Name = "btnConnStr";
            this.btnConnStr.Size = new System.Drawing.Size(362, 23);
            this.btnConnStr.TabIndex = 0;
            this.btnConnStr.Text = "创建连接";
            this.btnConnStr.UseVisualStyleBackColor = true;
            this.btnConnStr.Click += new System.EventHandler(this.btnConnStr_Click);
            // 
            // SqlConnectStringBuilder
            // 
            this.SqlConnectStringBuilder.Location = new System.Drawing.Point(219, 219);
            this.SqlConnectStringBuilder.Name = "SqlConnectStringBuilder";
            this.SqlConnectStringBuilder.Size = new System.Drawing.Size(362, 23);
            this.SqlConnectStringBuilder.TabIndex = 1;
            this.SqlConnectStringBuilder.Text = "SqlConnectStringBuilder";
            this.SqlConnectStringBuilder.UseVisualStyleBackColor = true;
            this.SqlConnectStringBuilder.Click += new System.EventHandler(this.SqlConnectStringBuilder_Click);
            // 
            // btnGet
            // 
            this.btnGet.Location = new System.Drawing.Point(219, 299);
            this.btnGet.Name = "btnGet";
            this.btnGet.Size = new System.Drawing.Size(362, 23);
            this.btnGet.TabIndex = 2;
            this.btnGet.Text = "通过属性面板设置";
            this.btnGet.UseVisualStyleBackColor = true;
            this.btnGet.Click += new System.EventHandler(this.btnGet_Click);
            // 
            // propertyGrid1
            // 
            this.propertyGrid1.Location = new System.Drawing.Point(219, 359);
            this.propertyGrid1.Name = "propertyGrid1";
            this.propertyGrid1.Size = new System.Drawing.Size(930, 498);
            this.propertyGrid1.TabIndex = 3;
            this.propertyGrid1.Click += new System.EventHandler(this.propertyGrid1_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1192, 936);
            this.Controls.Add(this.propertyGrid1);
            this.Controls.Add(this.btnGet);
            this.Controls.Add(this.SqlConnectStringBuilder);
            this.Controls.Add(this.btnConnStr);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnConnStr;
        private System.Windows.Forms.Button SqlConnectStringBuilder;
        private System.Windows.Forms.Button btnGet;
        private System.Windows.Forms.PropertyGrid propertyGrid1;
    }
}

