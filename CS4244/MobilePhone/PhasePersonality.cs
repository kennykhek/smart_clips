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
        public void ProcessPersonality()
        {
            //What is your gender?
            foreach (RadioButton control in gender_box.Controls)
            {
                if (control.Checked)
                {
                    //Question: Do you watch movies you downloaded on your phone?
                    if (control.Name.Equals("gender_box_male"))
                    {
                        environment.AssertString("(question (order user_gender) (selection s1)(phase 1))");
                    }
                    else if (control.Name.Equals("gender_box_female"))
                    {
                        environment.AssertString("(question (order user_gender) (selection s2)(phase 1))");
                    }
                }
            }//end gender

            //What is your age?
            foreach (RadioButton control in age_box.Controls)
            {
                if (control.Checked)
                {
                    if (control.Name.Equals("age_box_7"))
                    {
                        environment.AssertString("(question (order user_age) (selection s1)(phase 1))");
                    }
                    else if (control.Name.Equals("age_box_18"))
                    {
                        environment.AssertString("(question (order user_age) (selection s2)(phase 1))");
                    }
                    else if (control.Name.Equals("age_box_30"))
                    {
                        environment.AssertString("(question (order user_age) (selection s3)(phase 1))");
                    }
                    else if (control.Name.Equals("age_box_49"))
                    {
                        environment.AssertString("(question (order user_age) (selection s4)(phase 1))");
                    }
                }
            }//end age

            //Do you look for functionality or design?
            foreach (RadioButton control in function_box.Controls)
            {
                if (control.Checked)
                {
                    if (control.Name.Equals("function_box_functionality"))
                    {
                        environment.AssertString("(question (order prefer_func) (selection s1)(phase 1))");
                    }
                    else if (control.Name.Equals("function_box_design"))
                    {
                        environment.AssertString("(question (order prefer_func) (selection s2)(phase 1))");
                    }
                    else if (control.Name.Equals("function_box_both"))
                    {
                        environment.AssertString("(question (order prefer_func) (selection s3)(phase 1))");
                    }
                }
            }//end function

            //Which do you think you are?
            foreach (RadioButton control in behaviour_box.Controls)
            {
                if (control.Checked)
                {
                    if (control.Name.Equals("behaviour_box_introvert"))
                    {
                        environment.AssertString("(question (order intro_extro) (selection s1)(phase 1))");
                    }
                    else if (control.Name.Equals("behaviour_box_extrovert"))
                    {
                        environment.AssertString("(question (order intro_extro) (selection s2)(phase 1))");
                    }
                }
            }//end behaviour

            //What is your life atitude?
            foreach (RadioButton control in attitude_box.Controls)
            {
                if (control.Checked)
                {
                    if (control.Name.Equals("attitude_box_motivation"))
                    {
                        environment.AssertString("(question (order user_attitude) (selection s1)(phase 1))");
                    }
                    else if (control.Name.Equals("attitude_box_viva"))
                    {
                        environment.AssertString("(question (order user_attitude) (selection s3)(phase 1))");
                    }
                    else if (control.Name.Equals("attitude_box_time"))
                    {
                        environment.AssertString("(question (order user_attitude) (selection s2)(phase 1))");
                    }
                    else if (control.Name.Equals("attitude_box_once"))
                    {
                        environment.AssertString("(question (order user_attitude) (selection s4)(phase 1))");
                    }
                }
            }//end attitude

           //Which category of mobile user do you think you belong to?
            foreach (RadioButton control in category_box.Controls)
            {
                if (control.Checked)
                {
                    if (control.Name.Equals("category_box_uninvolved"))
                    {
                        environment.AssertString("(question (order user_type) (selection s1)(phase 1))");
                    }
                    else if (control.Name.Equals("category_box_intense"))
                    {
                        environment.AssertString("(question (order user_type) (selection s3)(phase 1))");
                    }
                    else if (control.Name.Equals("category_box_harmony"))
                    {
                        environment.AssertString("(question (order user_type) (selection s2)(phase 1))");
                    }
                    else if (control.Name.Equals("category_box_forerunners"))
                    {
                        environment.AssertString("(question (order user_type) (selection s4)(phase 1))");
                    }
                }
            }//end category

            //Pick a saying that describes you best!
            foreach (RadioButton control in saying_box.Controls)
            {
                if (control.Checked)
                {
                    if (control.Name.Equals("saying_box_love"))
                    {
                        environment.AssertString("(question (order user_saying) (selection s1)(phase 1))");
                    }
                    else if (control.Name.Equals("saying_box_constant"))
                    {
                        environment.AssertString("(question (order user_saying) (selection s2)(phase 1))");
                    }
                    else if (control.Name.Equals("saying_box_fashion"))
                    {
                        environment.AssertString("(question (order user_saying) (selection s3)(phase 1))");
                    }
                    else if (control.Name.Equals("saying_box_different"))
                    {
                        environment.AssertString("(question (order user_saying) (selection s4)(phase 1))");
                    }
                    else if (control.Name.Equals("saying_box_quality"))
                    {
                        environment.AssertString("(question (order user_saying) (selection s5)(phase 1))");
                    }
                }
            }//end saying

            //Which statement describes you better in interpersonal communication?
            foreach (RadioButton control in communication_box.Controls)
            {
                if (control.Checked)
                {
                    if (control.Name.Equals("communication_box_real"))
                    {
                        environment.AssertString("(question (order talk_or_sms) (selection s1)(phase 1))");
                    }
                    else if (control.Name.Equals("communication_box_some"))
                    {
                        environment.AssertString("(question (order talk_or_sms) (selection s2)(phase 1))");
                    }
                }
            }//end communication

            //Are you currently studying or serving the nation?
            foreach (RadioButton control in status_box.Controls)
            {
                if (control.Checked)
                {
                    if (control.Name.Equals("status_box_yes"))
                    {
                        environment.AssertString("(question (order is_student) (selection s1)(phase 1))");
                    }
                    else if (control.Name.Equals("status_box_no"))
                    {
                        environment.AssertString("(question (order is_student) (selection s2)(phase 1))");

                    }
                }
            }//end communication
        }
    }
}
