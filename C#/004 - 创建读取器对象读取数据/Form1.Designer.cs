namespace _004___创建读取器对象读取数据
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
            this.btnUpdate = new System.Windows.Forms.Button();
            this.txtClassName = new System.Windows.Forms.TextBox();
            this.lvClasses = new System.Windows.Forms.ListView();
            this.lable1 = new System.Windows.Forms.Label();
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.SuspendLayout();
            // 
            // btnUpdate
            // 
            this.btnUpdate.Location = new System.Drawing.Point(543, 536);
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(75, 23);
            this.btnUpdate.TabIndex = 0;
            this.btnUpdate.Text = "修改";
            this.btnUpdate.UseVisualStyleBackColor = true;
            // 
            // txtClassName
            // 
            this.txtClassName.Location = new System.Drawing.Point(299, 536);
            this.txtClassName.Name = "txtClassName";
            this.txtClassName.Size = new System.Drawing.Size(219, 21);
            this.txtClassName.TabIndex = 1;
            // 
            // lvClasses
            // 
            this.lvClasses.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1,
            this.columnHeader2});
            this.lvClasses.FullRowSelect = true;
            this.lvClasses.GridLines = true;
            this.lvClasses.HideSelection = false;
            this.lvClasses.Location = new System.Drawing.Point(31, 35);
            this.lvClasses.Name = "lvClasses";
            this.lvClasses.Size = new System.Drawing.Size(744, 481);
            this.lvClasses.TabIndex = 2;
            this.lvClasses.UseCompatibleStateImageBehavior = false;
            this.lvClasses.View = System.Windows.Forms.View.Details;
            this.lvClasses.SelectedIndexChanged += new System.EventHandler(this.lvVlasses_SelectedIndexChanged);
            // 
            // lable1
            // 
            this.lable1.AutoSize = true;
            this.lable1.Location = new System.Drawing.Point(239, 539);
            this.lable1.Name = "lable1";
            this.lable1.Size = new System.Drawing.Size(29, 12);
            this.lable1.TabIndex = 3;
            this.lable1.Text = "名称";
            // 
            // columnHeader1
            // 
            this.columnHeader1.Text = "班级ID";
            this.columnHeader1.Width = 176;
            // 
            // columnHeader2
            // 
            this.columnHeader2.Text = "班级名称";
            this.columnHeader2.Width = 195;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 622);
            this.Controls.Add(this.lable1);
            this.Controls.Add(this.lvClasses);
            this.Controls.Add(this.txtClassName);
            this.Controls.Add(this.btnUpdate);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnUpdate;
        private System.Windows.Forms.TextBox txtClassName;
        private System.Windows.Forms.ListView lvClasses;
        private System.Windows.Forms.Label lable1;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private System.Windows.Forms.ColumnHeader columnHeader2;
    }
}

