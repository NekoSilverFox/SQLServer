namespace _006___连接池
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
            this.btnConnection = new System.Windows.Forms.Button();
            this.btnPool = new System.Windows.Forms.Button();
            this.btnChange = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnConnection
            // 
            this.btnConnection.Location = new System.Drawing.Point(214, 110);
            this.btnConnection.Name = "btnConnection";
            this.btnConnection.Size = new System.Drawing.Size(295, 23);
            this.btnConnection.TabIndex = 0;
            this.btnConnection.Text = "第一个对象 Connection";
            this.btnConnection.UseVisualStyleBackColor = true;
            this.btnConnection.Click += new System.EventHandler(this.btnConnection_Click);
            // 
            // btnPool
            // 
            this.btnPool.Location = new System.Drawing.Point(214, 186);
            this.btnPool.Name = "btnPool";
            this.btnPool.Size = new System.Drawing.Size(295, 23);
            this.btnPool.TabIndex = 1;
            this.btnPool.Text = "连接池";
            this.btnPool.UseVisualStyleBackColor = true;
            this.btnPool.Click += new System.EventHandler(this.btnPool_Click);
            // 
            // btnChange
            // 
            this.btnChange.Location = new System.Drawing.Point(214, 259);
            this.btnChange.Name = "btnChange";
            this.btnChange.Size = new System.Drawing.Size(295, 23);
            this.btnChange.TabIndex = 2;
            this.btnChange.Text = "触发事件";
            this.btnChange.UseVisualStyleBackColor = true;
            this.btnChange.Click += new System.EventHandler(this.btnChange_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnChange);
            this.Controls.Add(this.btnPool);
            this.Controls.Add(this.btnConnection);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnConnection;
        private System.Windows.Forms.Button btnPool;
        private System.Windows.Forms.Button btnChange;
    }
}

