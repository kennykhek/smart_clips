namespace MobilePhone {
    partial class MainForm {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing) {
            if (disposing && (components != null)) {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Declaration

        private Sample.DataGridViewProgressColumn dataGridViewProgressColumn1;
        private System.Windows.Forms.Button buttonNext;
        private System.Windows.Forms.Button buttonNextPhone;
        private System.Windows.Forms.Button buttonPrev;
        private System.Windows.Forms.Button buttonPrevPhone;
        private System.Windows.Forms.Button buttonRestart;
        private System.Windows.Forms.GroupBox boxMem;
        private System.Windows.Forms.Label labelMem;
        private System.Windows.Forms.Label labelPhase0;
        private System.Windows.Forms.Label labelPhase1;
        private System.Windows.Forms.Label labelPhase2;
        private System.Windows.Forms.Label labelPhase3;
        private System.Windows.Forms.Label labelPhase4;
        private System.Windows.Forms.Label labelResultColor;
        private System.Windows.Forms.Label labelResultPixel;
        private System.Windows.Forms.Label labelResultZoom;
        private System.Windows.Forms.Panel panelMem;
        private System.Windows.Forms.Panel panelPhase0;
        private System.Windows.Forms.Panel panelPhase1;
        private System.Windows.Forms.Panel panelPhase2;
        private System.Windows.Forms.Panel panelPhase3;
        private System.Windows.Forms.Panel panelPhase4;
        private System.Windows.Forms.PictureBox pictureBoxPhone;
        private System.Windows.Forms.RadioButton rbMem1;
        private System.Windows.Forms.RadioButton rbMem2;
        private System.Windows.Forms.RadioButton rbMem3;
        private System.Windows.Forms.RadioButton rbMem4;
        private System.Windows.Forms.RadioButton rbMem5; 
        
        #endregion

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent() {
            this.boxMem = new System.Windows.Forms.GroupBox(); 
            this.buttonNext = new System.Windows.Forms.Button();
            this.buttonNextPhone = new System.Windows.Forms.Button(); 
            this.buttonPrev = new System.Windows.Forms.Button();
            this.buttonPrevPhone = new System.Windows.Forms.Button();
            this.buttonRestart = new System.Windows.Forms.Button();
            this.dataGridViewProgressColumn1 = new Sample.DataGridViewProgressColumn(); 
            this.labelMem = new System.Windows.Forms.Label();
            this.labelPhase0 = new System.Windows.Forms.Label();
            this.labelPhase1 = new System.Windows.Forms.Label();
            this.labelPhase2 = new System.Windows.Forms.Label();
            this.labelPhase3 = new System.Windows.Forms.Label();
            this.labelPhase4 = new System.Windows.Forms.Label(); 
            this.labelResultColor = new System.Windows.Forms.Label();
            this.labelResultPixel = new System.Windows.Forms.Label();
            this.labelResultZoom = new System.Windows.Forms.Label();
            this.panelMem = new System.Windows.Forms.Panel();
            this.panelPhase0 = new System.Windows.Forms.Panel(); 
            this.panelPhase1 = new System.Windows.Forms.Panel();
            this.panelPhase2 = new System.Windows.Forms.Panel();
            this.panelPhase3 = new System.Windows.Forms.Panel(); 
            this.panelPhase4 = new System.Windows.Forms.Panel();
            this.pictureBoxPhone = new System.Windows.Forms.PictureBox(); 
            this.rbMem1 = new System.Windows.Forms.RadioButton();
            this.rbMem2 = new System.Windows.Forms.RadioButton();
            this.rbMem3 = new System.Windows.Forms.RadioButton();
            this.rbMem4 = new System.Windows.Forms.RadioButton();
            this.rbMem5 = new System.Windows.Forms.RadioButton();
            
            this.boxMem.SuspendLayout();
            this.panelMem.SuspendLayout();
            this.panelPhase0.SuspendLayout();
            this.panelPhase1.SuspendLayout();
            this.panelPhase2.SuspendLayout();
            this.panelPhase3.SuspendLayout(); 
            this.panelPhase4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBoxPhone)).BeginInit(); 
            this.SuspendLayout();

            // 
            // dataGridViewProgressColumn1
            // 
            this.dataGridViewProgressColumn1.HeaderText = "Recommendation Weight";
            this.dataGridViewProgressColumn1.Name = "dataGridViewProgressColumn1";
            this.dataGridViewProgressColumn1.ReadOnly = true;
            this.dataGridViewProgressColumn1.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dataGridViewProgressColumn1.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.dataGridViewProgressColumn1.Width = 254;
            // 
            // boxMem
            // 
            this.boxMem.Controls.Add(this.labelMem);
            this.boxMem.Controls.Add(this.panelMem);
            this.boxMem.Location = new System.Drawing.Point(24, 49);
            this.boxMem.Name = "boxMem";
            this.boxMem.Size = new System.Drawing.Size(315, 82);
            this.boxMem.TabIndex = 0;
            this.boxMem.TabStop = false;
            this.boxMem.Text = "Memory preference";			
            // 
            // buttonNext
            // 
            this.buttonNext.Location = new System.Drawing.Point(463, 418);
            this.buttonNext.Name = "buttonNext";
            this.buttonNext.Size = new System.Drawing.Size(59, 23);
            this.buttonNext.TabIndex = 1;
            this.buttonNext.Text = "Next";
            this.buttonNext.UseVisualStyleBackColor = true;
            this.buttonNext.Click += new System.EventHandler(this.OnClickButton);
            // 
            // buttonNextPhone
            // 
            this.buttonNextPhone.Location = new System.Drawing.Point(386, 348);
            this.buttonNextPhone.Name = "buttonNextPhone";
            this.buttonNextPhone.Size = new System.Drawing.Size(97, 20);
            this.buttonNextPhone.TabIndex = 6;
            this.buttonNextPhone.Text = "Next Phone";
            this.buttonNextPhone.UseVisualStyleBackColor = true;
            this.buttonNextPhone.Click += new System.EventHandler(this.OnClickButton);
            // 
            // buttonPrev
            // 
            this.buttonPrev.Location = new System.Drawing.Point(12, 418);
            this.buttonPrev.Name = "buttonPrev";
            this.buttonPrev.Size = new System.Drawing.Size(59, 23);
            this.buttonPrev.TabIndex = 6;
            this.buttonPrev.Text = "Previous";
            this.buttonPrev.UseVisualStyleBackColor = true;
            this.buttonPrev.Click += new System.EventHandler(this.OnClickButton);
            // 
            // buttonPrevPhone
            // 
            this.buttonPrevPhone.Location = new System.Drawing.Point(26, 348);
            this.buttonPrevPhone.Name = "buttonPrevPhone";
            this.buttonPrevPhone.Size = new System.Drawing.Size(97, 20);
            this.buttonPrevPhone.TabIndex = 5;
            this.buttonPrevPhone.Text = "Previous Phone";
            this.buttonPrevPhone.UseVisualStyleBackColor = true;
            this.buttonPrevPhone.Click += new System.EventHandler(this.OnClickButton);			
            // 
            // buttonRestart
            // 
            this.buttonRestart.Location = new System.Drawing.Point(91, 418);
            this.buttonRestart.Name = "buttonRestart";
            this.buttonRestart.Size = new System.Drawing.Size(59, 23);
            this.buttonRestart.TabIndex = 7;
            this.buttonRestart.Text = "Restart";
            this.buttonRestart.UseVisualStyleBackColor = true;
            this.buttonRestart.Click += new System.EventHandler(this.OnClickButton);	
            // 
            // labelMem
            // 
            this.labelMem.AutoSize = true;
            this.labelMem.Location = new System.Drawing.Point(6, 18);
            this.labelMem.Name = "labelMem";
            this.labelMem.Size = new System.Drawing.Size(247, 13);
            this.labelMem.TabIndex = 0;
            this.labelMem.Text = "Rank the importance of memory in your phone";	
            // 
            // labelPhase0
            // 
            this.labelPhase0.AutoSize = true;
            this.labelPhase0.Location = new System.Drawing.Point(14, 12);
            this.labelPhase0.Name = "labelPhase0";
            this.labelPhase0.Size = new System.Drawing.Size(60, 13);
            this.labelPhase0.TabIndex = 0;
            this.labelPhase0.Text = "Phase 0:Hi";			
            // 
            // labelPhase1
            // 
            this.labelPhase1.AutoSize = true;
            this.labelPhase1.Location = new System.Drawing.Point(12, 12);
            this.labelPhase1.Name = "labelPhase1";
            this.labelPhase1.Size = new System.Drawing.Size(142, 13);
            this.labelPhase1.TabIndex = 0;
            this.labelPhase1.Text = "Phase 1: Personality Check";
            // 
            // labelPhase2
            // 
            this.labelPhase2.AutoSize = true;
            this.labelPhase2.Location = new System.Drawing.Point(12, 12);
            this.labelPhase2.Name = "labelPhase2";
            this.labelPhase2.Size = new System.Drawing.Size(111, 13);
            this.labelPhase2.TabIndex = 0;
            this.labelPhase2.Text = "Phase 2: Preferences";			
            // 
            // labelPhase3
            // 
            this.labelPhase3.AutoSize = true;
            this.labelPhase3.Location = new System.Drawing.Point(12, 12);
            this.labelPhase3.Name = "labelPhase3";
            this.labelPhase3.Size = new System.Drawing.Size(156, 13);
            this.labelPhase3.TabIndex = 1;
            this.labelPhase3.Text = "Phase 3: Specify phone specs";
            // 
            // labelPhase4
            // 
            this.labelPhase4.AutoSize = true;
            this.labelPhase4.Location = new System.Drawing.Point(12, 12);
            this.labelPhase4.Name = "labelPhase4";
            this.labelPhase4.Size = new System.Drawing.Size(95, 13);
            this.labelPhase4.TabIndex = 0;
            this.labelPhase4.Text = "Phase 4 : Choices";
            // 
            // labelResultColor
            // 
            this.labelResultColor.AutoSize = true;
            this.labelResultColor.Location = new System.Drawing.Point(283, 100);
            this.labelResultColor.Name = "labelResultColor";
            this.labelResultColor.Size = new System.Drawing.Size(80, 13);
            this.labelResultColor.TabIndex = 3;
            this.labelResultColor.Text = "Phone Color : ";
            // 
            // labelResultPixel
            // 
            this.labelResultPixel.AutoSize = true;
            this.labelResultPixel.Location = new System.Drawing.Point(283, 75);
            this.labelResultPixel.Name = "labelResultPixel";
            this.labelResultPixel.Size = new System.Drawing.Size(80, 13);
            this.labelResultPixel.TabIndex = 2;
            this.labelResultPixel.Text = "Camera Pixel : ";
            // 
            // labelResultZoom
            // 
            this.labelResultZoom.AutoSize = true;
            this.labelResultZoom.Location = new System.Drawing.Point(283, 49);
            this.labelResultZoom.Name = "labelResultZoom";
            this.labelResultZoom.Size = new System.Drawing.Size(86, 13);
            this.labelResultZoom.TabIndex = 1;
            this.labelResultZoom.Text = "Camera Zoom : ";			
            // 
            // panelMem
            // 
            this.panelMem.Controls.Add(this.rbMem4);
            this.panelMem.Controls.Add(this.rbMem5);
            this.panelMem.Controls.Add(this.rbMem3);
            this.panelMem.Controls.Add(this.rbMem1);
            this.panelMem.Controls.Add(this.rbMem2);
            this.panelMem.Location = new System.Drawing.Point(9, 34);
            this.panelMem.Name = "panelMem";
            this.panelMem.Size = new System.Drawing.Size(187, 32);
            this.panelMem.TabIndex = 1;		
            // 
            // panelPhase0
            // 
            this.panelPhase0.Controls.Add(this.labelPhase0);
            this.panelPhase0.Location = new System.Drawing.Point(12, 12);
            this.panelPhase0.Name = "panelPhase0";
            this.panelPhase0.Size = new System.Drawing.Size(510, 400);
            this.panelPhase0.TabIndex = 5;			
            // 
            // panelPhase1
            // 
            this.panelPhase1.Controls.Add(this.labelPhase1);
            this.panelPhase1.Location = new System.Drawing.Point(12, 12);
            this.panelPhase1.Name = "panelPhase1";
            this.panelPhase1.Size = new System.Drawing.Size(510, 400);
            this.panelPhase1.TabIndex = 4;
            // 
            // panelPhase2
            // 
            this.panelPhase2.Controls.Add(this.labelPhase2);
            this.panelPhase2.Controls.Add(this.boxMem);
            this.panelPhase2.Location = new System.Drawing.Point(12, 12);
            this.panelPhase2.Name = "panelPhase2";
            this.panelPhase2.Size = new System.Drawing.Size(510, 400);
            this.panelPhase2.TabIndex = 2;
            // 
            // panelPhase3
            // 
            this.panelPhase3.Controls.Add(this.labelPhase3);
            this.panelPhase3.Location = new System.Drawing.Point(12, 12);
            this.panelPhase3.Name = "panelPhase3";
            this.panelPhase3.Size = new System.Drawing.Size(510, 397);
            this.panelPhase3.TabIndex = 3;	
            // 
            // panelPhase4
            // 
            this.panelPhase4.Controls.Add(this.buttonNextPhone);
            this.panelPhase4.Controls.Add(this.buttonPrevPhone);
            this.panelPhase4.Controls.Add(this.labelResultColor);
            this.panelPhase4.Controls.Add(this.pictureBoxPhone);
            this.panelPhase4.Controls.Add(this.labelResultPixel);
            this.panelPhase4.Controls.Add(this.labelResultZoom);
            this.panelPhase4.Controls.Add(this.labelPhase4);
            this.panelPhase4.Location = new System.Drawing.Point(12, 12);
            this.panelPhase4.Name = "panelPhase4";
            this.panelPhase4.Size = new System.Drawing.Size(510, 400);
            this.panelPhase4.TabIndex = 5;		
            // 
            // pictureBoxPhone
            // 
            this.pictureBoxPhone.Location = new System.Drawing.Point(17, 38);
            this.pictureBoxPhone.Name = "pictureBoxPhone";
            this.pictureBoxPhone.Size = new System.Drawing.Size(249, 296);
            this.pictureBoxPhone.TabIndex = 4;
            this.pictureBoxPhone.TabStop = false;			
            // 
            // rbMem1
            // 
            this.rbMem1.AutoSize = true;
            this.rbMem1.Location = new System.Drawing.Point(3, 8);
            this.rbMem1.Name = "rbMem1";
            this.rbMem1.Size = new System.Drawing.Size(31, 17);
            this.rbMem1.TabIndex = 1;
            this.rbMem1.TabStop = true;
            this.rbMem1.Text = "1";
            this.rbMem1.UseVisualStyleBackColor = true;
            // 
            // rbMem2
            // 
            this.rbMem2.AutoSize = true;
            this.rbMem2.Location = new System.Drawing.Point(37, 8);
            this.rbMem2.Name = "rbMem2";
            this.rbMem2.Size = new System.Drawing.Size(31, 17);
            this.rbMem2.TabIndex = 2;
            this.rbMem2.TabStop = true;
            this.rbMem2.Text = "2";
            this.rbMem2.UseVisualStyleBackColor = true;
            // 
            // rbMem3
            // 
            this.rbMem3.AutoSize = true;
            this.rbMem3.Location = new System.Drawing.Point(74, 8);
            this.rbMem3.Name = "rbMem3";
            this.rbMem3.Size = new System.Drawing.Size(31, 17);
            this.rbMem3.TabIndex = 3;
            this.rbMem3.TabStop = true;
            this.rbMem3.Text = "3";
            this.rbMem3.UseVisualStyleBackColor = true;
            // 
            // rbMem4
            // 
            this.rbMem4.AutoSize = true;
            this.rbMem4.Location = new System.Drawing.Point(111, 8);
            this.rbMem4.Name = "rbMem4";
            this.rbMem4.Size = new System.Drawing.Size(31, 17);
            this.rbMem4.TabIndex = 4;
            this.rbMem4.TabStop = true;
            this.rbMem4.Text = "4";
            this.rbMem4.UseVisualStyleBackColor = true;
            // 
            // rbMem5
            // 
            this.rbMem5.AutoSize = true;
            this.rbMem5.Location = new System.Drawing.Point(148, 8);
            this.rbMem5.Name = "rbMem5";
            this.rbMem5.Size = new System.Drawing.Size(31, 17);
            this.rbMem5.TabIndex = 5;
            this.rbMem5.TabStop = true;
            this.rbMem5.Text = "5";
            this.rbMem5.UseVisualStyleBackColor = true;			
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.buttonNext); 
            this.Controls.Add(this.buttonPrev);
            this.Controls.Add(this.buttonRestart);
            this.Controls.Add(this.panelPhase0);
            this.Controls.Add(this.panelPhase1);
            this.Controls.Add(this.panelPhase2);
            this.Controls.Add(this.panelPhase3); 
            this.Controls.Add(this.panelPhase4);
            
            this.ClientSize = new System.Drawing.Size(534, 453);
            this.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Name = "MainForm";
            this.Text = "MobilePhone";

            this.boxMem.ResumeLayout(false);
            this.boxMem.PerformLayout();
            this.panelPhase0.ResumeLayout(false);
            this.panelPhase0.PerformLayout(); 
            this.panelPhase1.ResumeLayout(false);
            this.panelPhase1.PerformLayout();
            this.panelPhase2.ResumeLayout(false);
            this.panelPhase2.PerformLayout(); 
            this.panelPhase3.ResumeLayout(false);
            this.panelPhase3.PerformLayout();
            this.panelPhase4.ResumeLayout(false);
            this.panelPhase4.PerformLayout(); 
            this.panelMem.ResumeLayout(false);
            this.panelMem.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBoxPhone)).EndInit();
            this.ResumeLayout(false);
        }

        #endregion       
    }
}

