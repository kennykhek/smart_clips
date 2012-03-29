using Mommosoft.ExpertSystem;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace MobilePhone
{
    public partial class MainForm : Form
    {
        public void ProcessPhasePreferences()
        {
            /*
              * For each of the question asked in phase 2, the for loop is the same, just note the box name is
              * different
              * @kwanghock
           */
            //Assert the weightage of the attributes related to the question here
            //Question 1
            // foreach (RadioButton control in grp_box_q1.Controls) //Throw error here as grp_box_q1 has label as well @kwanghock 11march2012
            foreach (RadioButton control in rbBoxQns1.Controls)
            {
                if (control.Checked)
                {
                    //Question: Do you watch movies you downloaded on your phone?
                    if (control.Name.Equals("q1_yes"))
                    {
                        environment.AssertString("(question (order watch_movie) (selection yes)(phase 3))");
                    }
                    else if (control.Name.Equals("q1_no"))
                    {
                        environment.AssertString("(question (order watch_movie) (selection no)(phase 3))");
                    }
                }
            }
            //Question 2
            //foreach (RadioButton control in grp_box_q2.Controls)
            foreach (RadioButton control in rbBoxQns2.Controls)
            {
                if (control.Checked)
                {
                    //Question: Do you listen to music on your phone?
                    if (control.Name.Equals("q2_yes"))
                    {
                        environment.AssertString("(question (order listen_music) (selection yes)(phase 3))");
                    }
                    else if (control.Name.Equals("q2_no"))
                    {
                        environment.AssertString("(question (order listen_music) (selection no)(phase 3))");
                    }

                }
            }

            //Question 3
            // foreach (RadioButton control in grp_box_q3.Controls)
            foreach (RadioButton control in rbBoxQns3.Controls)
            {
                if (control.Checked)
                {
                    //Question: Do you view pictures you downloaded on your phone?
                    if (control.Name.Equals("q3_yes"))
                    {
                        environment.AssertString("(question (order view_picture) (selection yes)(phase 3))");
                    }
                    else if (control.Name.Equals("q3_no"))
                    {
                        environment.AssertString("(question (order view_picture) (selection no)(phase 3))");
                    }
                }
            }

            //Question 4
            // foreach (RadioButton control in grp_box_q4.Controls)
            foreach (RadioButton control in rbBoxQns4.Controls)
            {
                if (control.Checked)
                {
                    //Question: Do you play online or Internet browsing on your phone?
                    if (control.Name.Equals("q4_yes"))
                    {
                        environment.AssertString("(question (order game_internet) (selection yes)(phase 3))");
                    }
                    else if (control.Name.Equals("q4_no"))
                    {
                        environment.AssertString("(question (order game_internet) (selection no)(phase 3))");
                    }
                }
            }

            //Question 5
            // foreach (RadioButton control in grp_box_q5.Controls)
            foreach (RadioButton control in rbBoxQns5.Controls)
            {
                if (control.Checked)
                {
                    //Question: Do you use phone as your personal and only camera? 
                    if (control.Name.Equals("q5_yes"))
                    {
                        environment.AssertString("(question (order use_camera) (selection yes)(phase 3))");
                    }
                    else if (control.Name.Equals("q5_no"))
                    {
                        environment.AssertString("(question (order use_camera) (selection no)(phase 3))");
                    }
                }
            }

            //Question 6
            // foreach (RadioButton control in grp_box_q6.Controls)
            foreach (RadioButton control in rbBoxQns6.Controls)
            {
                if (control.Checked)
                {
                    //Question: Do you often take night picture/video using your phone
                    if (control.Name.Equals("q6_yes"))
                    {
                        environment.AssertString("(question (order use_camera_night) (selection yes)(phase 3))");
                    }
                    else if (control.Name.Equals("q6_no"))
                    {
                        environment.AssertString("(question (order use_camera_night) (selection no)(phase 3))");
                    }
                }
            }
            environment.Run();        
        }
    }
}
