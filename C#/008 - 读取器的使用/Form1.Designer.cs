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
            this.components = new System.ComponentModel.Container();
            this.listViewSubject = new System.Windows.Forms.ListView();
            this.colId = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.colName = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.colTime = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.colClassId = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.label1 = new System.Windows.Forms.Label();
            this.txtBoxSubName = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtBoxSubTime = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtBoxClassName = new System.Windows.Forms.TextBox();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnModify = new System.Windows.Forms.Button();
            this.tsmiDelete = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.删除ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiDelete.SuspendLayout();
            this.SuspendLayout();
            // 
            // listViewSubject
            // 
            this.listViewSubject.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.colId,
            this.colName,
            this.colTime,
            this.colClassId});
            this.listViewSubject.ContextMenuStrip = this.tsmiDelete;
            this.listViewSubject.FullRowSelect = true;
            this.listViewSubject.GridLines = true;
            this.listViewSubject.HideSelection = false;
            this.listViewSubject.Location = new System.Drawing.Point(12, 12);
            this.listViewSubject.MultiSelect = false;
            this.listViewSubject.Name = "listViewSubject";
            this.listViewSubject.Size = new System.Drawing.Size(517, 290);
            this.listViewSubject.TabIndex = 0;
            this.listViewSubject.UseCompatibleStateImageBehavior = false;
            this.listViewSubject.View = System.Windows.Forms.View.Details;
            this.listViewSubject.Click += new System.EventHandler(this.listViewSubject_Click);
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
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(47, 355);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 12);
            this.label1.TabIndex = 1;
            this.label1.Text = "科目名称";
            // 
            // txtBoxSubName
            // 
            this.txtBoxSubName.Location = new System.Drawing.Point(104, 352);
            this.txtBoxSubName.Name = "txtBoxSubName";
            this.txtBoxSubName.Size = new System.Drawing.Size(128, 21);
            this.txtBoxSubName.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(287, 358);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(29, 12);
            this.label2.TabIndex = 1;
            this.label2.Text = "课时";
            // 
            // txtBoxSubTime
            // 
            this.txtBoxSubTime.Location = new System.Drawing.Point(344, 355);
            this.txtBoxSubTime.Name = "txtBoxSubTime";
            this.txtBoxSubTime.Size = new System.Drawing.Size(128, 21);
            this.txtBoxSubTime.TabIndex = 2;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(47, 421);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(53, 12);
            this.label3.TabIndex = 1;
            this.label3.Text = "班级名称";
            // 
            // txtBoxClassName
            // 
            this.txtBoxClassName.Location = new System.Drawing.Point(104, 418);
            this.txtBoxClassName.Name = "txtBoxClassName";
            this.txtBoxClassName.Size = new System.Drawing.Size(128, 21);
            this.txtBoxClassName.TabIndex = 2;
            // 
            // btnAdd
            // 
            this.btnAdd.Location = new System.Drawing.Point(289, 421);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(75, 23);
            this.btnAdd.TabIndex = 3;
            this.btnAdd.Text = "增加";
            this.btnAdd.UseVisualStyleBackColor = true;
            // 
            // btnModify
            // 
            this.btnModify.Location = new System.Drawing.Point(397, 421);
            this.btnModify.Name = "btnModify";
            this.btnModify.Size = new System.Drawing.Size(75, 23);
            this.btnModify.TabIndex = 3;
            this.btnModify.Text = "修改";
            this.btnModify.UseVisualStyleBackColor = true;
            // 
            // tsmiDelete
            // 
            this.tsmiDelete.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.删除ToolStripMenuItem});
            this.tsmiDelete.Name = "tsmiDelete";
            this.tsmiDelete.Size = new System.Drawing.Size(181, 48);
            // 
            // 删除ToolStripMenuItem
            // 
            this.删除ToolStripMenuItem.Name = "删除ToolStripMenuItem";
            this.删除ToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.删除ToolStripMenuItem.Text = "删除";
            this.删除ToolStripMenuItem.Click += new System.EventHandler(this.删除ToolStripMenuItem_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(541, 474);
            this.Controls.Add(this.btnModify);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.txtBoxClassName);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtBoxSubTime);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtBoxSubName);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.listViewSubject);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.tsmiDelete.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListView listViewSubject;
        private System.Windows.Forms.ColumnHeader colId;
        private System.Windows.Forms.ColumnHeader colName;
        private System.Windows.Forms.ColumnHeader colTime;
        private System.Windows.Forms.ColumnHeader colClassId;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtBoxSubName;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtBoxSubTime;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtBoxClassName;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnModify;
        private System.Windows.Forms.ContextMenuStrip tsmiDelete;
        private System.Windows.Forms.ToolStripMenuItem 删除ToolStripMenuItem;
    }
}

