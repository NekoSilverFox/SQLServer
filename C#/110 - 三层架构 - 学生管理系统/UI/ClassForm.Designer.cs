namespace UI
{
    partial class ClassForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ClassForm));
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.tsbAddClass = new System.Windows.Forms.ToolStripButton();
            this.tsbUpdateClass = new System.Windows.Forms.ToolStripButton();
            this.tsbDelete = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton4 = new System.Windows.Forms.ToolStripSeparator();
            this.tsbOuputToExcel = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton6 = new System.Windows.Forms.ToolStripSeparator();
            this.tsbExit = new System.Windows.Forms.ToolStripButton();
            this.tsbId = new System.Windows.Forms.ToolStripButton();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.gpAddClass = new System.Windows.Forms.GroupBox();
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnAdd = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.txtClassCount = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtClassName = new System.Windows.Forms.TextBox();
            this.dgvClassList = new System.Windows.Forms.DataGridView();
            this.CID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CCount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CAddTime = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnInput = new System.Windows.Forms.Button();
            this.btnOutputPath = new System.Windows.Forms.Button();
            this.txtInput = new System.Windows.Forms.TextBox();
            this.btnOutput = new System.Windows.Forms.Button();
            this.btnPath = new System.Windows.Forms.Button();
            this.txtOutPut = new System.Windows.Forms.TextBox();
            this.toolStrip1.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.gpAddClass.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvClassList)).BeginInit();
            this.SuspendLayout();
            // 
            // toolStrip1
            // 
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsbAddClass,
            this.tsbUpdateClass,
            this.tsbDelete,
            this.toolStripButton4,
            this.tsbOuputToExcel,
            this.toolStripButton6,
            this.tsbExit,
            this.tsbId});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(800, 25);
            this.toolStrip1.TabIndex = 1;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // tsbAddClass
            // 
            this.tsbAddClass.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.tsbAddClass.Image = ((System.Drawing.Image)(resources.GetObject("tsbAddClass.Image")));
            this.tsbAddClass.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbAddClass.Name = "tsbAddClass";
            this.tsbAddClass.Size = new System.Drawing.Size(60, 22);
            this.tsbAddClass.Text = "新增班级";
            // 
            // tsbUpdateClass
            // 
            this.tsbUpdateClass.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.tsbUpdateClass.Image = ((System.Drawing.Image)(resources.GetObject("tsbUpdateClass.Image")));
            this.tsbUpdateClass.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbUpdateClass.Name = "tsbUpdateClass";
            this.tsbUpdateClass.Size = new System.Drawing.Size(60, 22);
            this.tsbUpdateClass.Text = "修改班级";
            // 
            // tsbDelete
            // 
            this.tsbDelete.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.tsbDelete.Image = ((System.Drawing.Image)(resources.GetObject("tsbDelete.Image")));
            this.tsbDelete.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbDelete.Name = "tsbDelete";
            this.tsbDelete.Size = new System.Drawing.Size(36, 22);
            this.tsbDelete.Text = "删除";
            // 
            // toolStripButton4
            // 
            this.toolStripButton4.Name = "toolStripButton4";
            this.toolStripButton4.Size = new System.Drawing.Size(6, 25);
            // 
            // tsbOuputToExcel
            // 
            this.tsbOuputToExcel.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.tsbOuputToExcel.Image = ((System.Drawing.Image)(resources.GetObject("tsbOuputToExcel.Image")));
            this.tsbOuputToExcel.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbOuputToExcel.Name = "tsbOuputToExcel";
            this.tsbOuputToExcel.Size = new System.Drawing.Size(77, 22);
            this.tsbOuputToExcel.Text = "导出到Excel";
            // 
            // toolStripButton6
            // 
            this.toolStripButton6.Name = "toolStripButton6";
            this.toolStripButton6.Size = new System.Drawing.Size(6, 25);
            // 
            // tsbExit
            // 
            this.tsbExit.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.tsbExit.Image = ((System.Drawing.Image)(resources.GetObject("tsbExit.Image")));
            this.tsbExit.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbExit.Name = "tsbExit";
            this.tsbExit.Size = new System.Drawing.Size(36, 22);
            this.tsbExit.Text = "退出";
            // 
            // tsbId
            // 
            this.tsbId.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.tsbId.Image = ((System.Drawing.Image)(resources.GetObject("tsbId.Image")));
            this.tsbId.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsbId.Name = "tsbId";
            this.tsbId.Size = new System.Drawing.Size(25, 22);
            this.tsbId.Text = "ID";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.gpAddClass);
            this.groupBox1.Controls.Add(this.dgvClassList);
            this.groupBox1.Location = new System.Drawing.Point(87, 31);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(626, 388);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "班级列表";
            // 
            // gpAddClass
            // 
            this.gpAddClass.Controls.Add(this.btnCancel);
            this.gpAddClass.Controls.Add(this.btnAdd);
            this.gpAddClass.Controls.Add(this.label1);
            this.gpAddClass.Controls.Add(this.txtClassCount);
            this.gpAddClass.Controls.Add(this.label2);
            this.gpAddClass.Controls.Add(this.txtClassName);
            this.gpAddClass.Location = new System.Drawing.Point(108, 86);
            this.gpAddClass.Name = "gpAddClass";
            this.gpAddClass.Size = new System.Drawing.Size(323, 206);
            this.gpAddClass.TabIndex = 1;
            this.gpAddClass.TabStop = false;
            this.gpAddClass.Text = "新增";
            this.gpAddClass.Visible = false;
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(182, 129);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 2;
            this.btnCancel.Text = "取消";
            this.btnCancel.UseVisualStyleBackColor = true;
            // 
            // btnAdd
            // 
            this.btnAdd.Location = new System.Drawing.Point(62, 129);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(75, 23);
            this.btnAdd.TabIndex = 2;
            this.btnAdd.Text = "确定";
            this.btnAdd.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(29, 32);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 12);
            this.label1.TabIndex = 0;
            this.label1.Text = "班级名称";
            // 
            // txtClassCount
            // 
            this.txtClassCount.Location = new System.Drawing.Point(91, 81);
            this.txtClassCount.Name = "txtClassCount";
            this.txtClassCount.Size = new System.Drawing.Size(181, 21);
            this.txtClassCount.TabIndex = 1;
            this.txtClassCount.Text = "0";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(29, 85);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 12);
            this.label2.TabIndex = 0;
            this.label2.Text = "班级人数";
            // 
            // txtClassName
            // 
            this.txtClassName.Location = new System.Drawing.Point(91, 32);
            this.txtClassName.Name = "txtClassName";
            this.txtClassName.Size = new System.Drawing.Size(181, 21);
            this.txtClassName.TabIndex = 1;
            // 
            // dgvClassList
            // 
            this.dgvClassList.AllowUserToAddRows = false;
            this.dgvClassList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvClassList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.CID,
            this.CName,
            this.CCount,
            this.CAddTime});
            this.dgvClassList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvClassList.Location = new System.Drawing.Point(3, 17);
            this.dgvClassList.MultiSelect = false;
            this.dgvClassList.Name = "dgvClassList";
            this.dgvClassList.RowHeadersVisible = false;
            this.dgvClassList.RowTemplate.Height = 23;
            this.dgvClassList.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvClassList.Size = new System.Drawing.Size(620, 368);
            this.dgvClassList.TabIndex = 0;
            // 
            // CID
            // 
            this.CID.DataPropertyName = "CID";
            this.CID.HeaderText = "班级ID";
            this.CID.Name = "CID";
            this.CID.ReadOnly = true;
            // 
            // CName
            // 
            this.CName.DataPropertyName = "CName";
            this.CName.HeaderText = "班级名称";
            this.CName.Name = "CName";
            this.CName.Width = 180;
            // 
            // CCount
            // 
            this.CCount.DataPropertyName = "CCount";
            this.CCount.HeaderText = "班级人数";
            this.CCount.Name = "CCount";
            // 
            // CAddTime
            // 
            this.CAddTime.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.CAddTime.DataPropertyName = "CAddTime";
            this.CAddTime.HeaderText = "新增日期";
            this.CAddTime.Name = "CAddTime";
            this.CAddTime.ReadOnly = true;
            // 
            // btnInput
            // 
            this.btnInput.Location = new System.Drawing.Point(622, 492);
            this.btnInput.Name = "btnInput";
            this.btnInput.Size = new System.Drawing.Size(75, 23);
            this.btnInput.TabIndex = 12;
            this.btnInput.Text = "导入";
            this.btnInput.UseVisualStyleBackColor = true;
            // 
            // btnOutputPath
            // 
            this.btnOutputPath.Location = new System.Drawing.Point(539, 492);
            this.btnOutputPath.Name = "btnOutputPath";
            this.btnOutputPath.Size = new System.Drawing.Size(75, 23);
            this.btnOutputPath.TabIndex = 11;
            this.btnOutputPath.Text = "选择路径";
            this.btnOutputPath.UseVisualStyleBackColor = true;
            // 
            // txtInput
            // 
            this.txtInput.Location = new System.Drawing.Point(99, 493);
            this.txtInput.Name = "txtInput";
            this.txtInput.Size = new System.Drawing.Size(419, 21);
            this.txtInput.TabIndex = 10;
            // 
            // btnOutput
            // 
            this.btnOutput.Location = new System.Drawing.Point(622, 448);
            this.btnOutput.Name = "btnOutput";
            this.btnOutput.Size = new System.Drawing.Size(75, 23);
            this.btnOutput.TabIndex = 8;
            this.btnOutput.Text = "导出";
            this.btnOutput.UseVisualStyleBackColor = true;
            // 
            // btnPath
            // 
            this.btnPath.Location = new System.Drawing.Point(539, 448);
            this.btnPath.Name = "btnPath";
            this.btnPath.Size = new System.Drawing.Size(75, 23);
            this.btnPath.TabIndex = 9;
            this.btnPath.Text = "选择路径";
            this.btnPath.UseVisualStyleBackColor = true;
            // 
            // txtOutPut
            // 
            this.txtOutPut.Location = new System.Drawing.Point(99, 449);
            this.txtOutPut.Name = "txtOutPut";
            this.txtOutPut.Size = new System.Drawing.Size(419, 21);
            this.txtOutPut.TabIndex = 7;
            // 
            // ClassForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 562);
            this.Controls.Add(this.btnInput);
            this.Controls.Add(this.btnOutputPath);
            this.Controls.Add(this.txtInput);
            this.Controls.Add(this.btnOutput);
            this.Controls.Add(this.btnPath);
            this.Controls.Add(this.txtOutPut);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.toolStrip1);
            this.Name = "ClassForm";
            this.Text = "ClassForm";
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.gpAddClass.ResumeLayout(false);
            this.gpAddClass.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvClassList)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton tsbAddClass;
        private System.Windows.Forms.ToolStripButton tsbUpdateClass;
        private System.Windows.Forms.ToolStripButton tsbDelete;
        private System.Windows.Forms.ToolStripSeparator toolStripButton4;
        private System.Windows.Forms.ToolStripButton tsbOuputToExcel;
        private System.Windows.Forms.ToolStripSeparator toolStripButton6;
        private System.Windows.Forms.ToolStripButton tsbExit;
        private System.Windows.Forms.ToolStripButton tsbId;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox gpAddClass;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtClassCount;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtClassName;
        private System.Windows.Forms.DataGridView dgvClassList;
        private System.Windows.Forms.DataGridViewTextBoxColumn CID;
        private System.Windows.Forms.DataGridViewTextBoxColumn CName;
        private System.Windows.Forms.DataGridViewTextBoxColumn CCount;
        private System.Windows.Forms.DataGridViewTextBoxColumn CAddTime;
        private System.Windows.Forms.Button btnInput;
        private System.Windows.Forms.Button btnOutputPath;
        private System.Windows.Forms.TextBox txtInput;
        private System.Windows.Forms.Button btnOutput;
        private System.Windows.Forms.Button btnPath;
        private System.Windows.Forms.TextBox txtOutPut;
    }
}