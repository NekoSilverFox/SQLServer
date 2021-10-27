namespace _008___读取器的使用
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
            this.listViewSubject = new System.Windows.Forms.ListView();
            this.colId = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.colName = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.colTime = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.colClassId = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.SuspendLayout();
            // 
            // listViewSubject
            // 
            this.listViewSubject.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.colId,
            this.colName,
            this.colTime,
            this.colClassId});
            this.listViewSubject.FullRowSelect = true;
            this.listViewSubject.GridLines = true;
            this.listViewSubject.HideSelection = false;
            this.listViewSubject.Location = new System.Drawing.Point(12, 12);
            this.listViewSubject.MultiSelect = false;
            this.listViewSubject.Name = "listViewSubject";
            this.listViewSubject.Size = new System.Drawing.Size(517, 484);
            this.listViewSubject.TabIndex = 0;
            this.listViewSubject.UseCompatibleStateImageBehavior = false;
            this.listViewSubject.View = System.Windows.Forms.View.Details;
            // 
            // colId
            // 
            this.colId.Text = "科目ID";
            this.colId.Width = 109;
            // 
            // colName
            // 
            this.colName.Text = "科目名称";
            this.colName.Width = 117;
            // 
            // colTime
            // 
            this.colTime.Text = "课时";
            this.colTime.Width = 109;
            // 
            // colClassId
            // 
            this.colClassId.Text = "班级ID";
            this.colClassId.Width = 109;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(541, 571);
            this.Controls.Add(this.listViewSubject);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ListView listViewSubject;
        private System.Windows.Forms.ColumnHeader colId;
        private System.Windows.Forms.ColumnHeader colName;
        private System.Windows.Forms.ColumnHeader colTime;
        private System.Windows.Forms.ColumnHeader colClassId;
    }
}

