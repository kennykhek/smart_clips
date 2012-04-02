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
           */
            //Assert the weightage of the attributes related to the question here
            //Question 1
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

        public void InitDataGrid()
        {
            string evalStr = "(get_weightagephone_list)";

            MultifieldValue mv = (MultifieldValue)environment.Eval(evalStr);

            DataTable testdt = new DataTable();
            phase3Results.Clear();
            for (int i = 0; i < mv.Count; i++)
            {
                String sModel = "";
                float fWeightage = 0;
                FactAddressValue fv = (FactAddressValue)mv[i];

                /*
                 * Because the function returns a list of weightage_phone and phone facts so getting the fact slot brand
                 * will throw exception for weightage_phone facts, once thrown will catch and actually assign the model and 
                 * weightage values
                 * Hence those weightage_phone facts will be shown on the grid instead.
                 */
                try
                {
                    String sCehck = (String)(SymbolValue)fv.GetFactSlot("brand");
                    continue;
                }
                catch (Exception exception)
                {
                    if ((fv.GetFactSlot("model").GetType().ToString()).Equals("Mommosoft.ExpertSystem.SymbolValue"))
                        sModel = (String)(SymbolValue)fv.GetFactSlot("model");
                    else if ((fv.GetFactSlot("model").GetType().ToString()).Equals("Mommosoft.ExpertSystem.IntegerValue"))
                        sModel = ((int)(IntegerValue)fv.GetFactSlot("model")).ToString();

                    fWeightage = (float)(FloatValue)fv.GetFactSlot("normalizedWeightage");
                }


                MobilePhoneRecommendation a = new MobilePhoneRecommendation();
                a.sModel = sModel;
                a.fWeightage = fWeightage;
                String sAttributeModel = "(model " + a.sModel + ")";
                String sAttributeWeightage = "(weightage " + a.fWeightage.ToString() + ")";

                String sFact = "(weightage_phone " + sAttributeModel + sAttributeWeightage + ")";

                MobileResultDisplay addon = new MobileResultDisplay();
                addon.fWeightage = a.fWeightage;
                addon.sModel = a.sModel;
                phase3Results.Add(addon);

            }

            //Convert binding list to list. Sort by weightage in descending order.
            List<MobileResultDisplay> listConvert = phase3Results.ToList();
            listConvert = listConvert.OrderByDescending(x => x.fWeightage).ToList();
            phase3Results.Clear();

            for (int i = 0; i < listConvert.Count; i++)
            {
                phase3Results.Add(listConvert.ElementAt(i));
            }

            dataGridView.DataSource = phase3Results;
        }
    }
}
