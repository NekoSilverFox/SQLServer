namespace _009___数据的导出和导入
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
            this.btnOutput = new System.Windows.Forms.Button();
            this.btnInput = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnOutput
            // 
            this.btnOutput.Location = new System.Drawing.Point(111, 57);
            this.btnOutput.Name = "btnOutput";
            this.btnOutput.Size = new System.Drawing.Size(140, 23);
            this.btnOutput.TabIndex = 0;
            this.btnOutput.Text = "导出 grade";
            this.btnOutput.UseVisualStyleBackColor = true;
            this.btnOutput.Click += new System.EventHandler(this.btnOutput_Click);
            // 
            // btnInput
            // 
            this.btnInput.Location = new System.Drawing.Point(111, 129);
            this.btnInput.Name = "btnInput";
            this.btnInput.Size = new System.Drawing.Size(140, 23);
            this.btnInput.TabIndex = 0;
            this.btnInput.Text = "导入 grade";
            this.btnInput.UseVisualStyleBackColor = true;
            this.btnInput.Click += new System.EventHandler(this.btnInput_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(366, 215);
            this.Controls.Add(this.btnInput);
            this.Controls.Add(this.btnOutput);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnOutput;
        private System.Windows.Forms.Button btnInput;
    }
}

