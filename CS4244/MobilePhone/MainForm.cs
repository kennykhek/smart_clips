using Mommosoft.ExpertSystem;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;


namespace MobilePhone {
    public partial class MainForm : Form {

        /*
         * MobilePhoneRecommendation Class
         * If need to add in more attributes can just add in
         * @kwanghock
         */

        private int UIState;

        //keep track of all the personality details at phase personality @kwanghock
        private List<String> personalityDetails;
        private List<MobilePhoneRecommendation> personalityPhoneList;

        //keep track of the preferences at phase preferences @kwanghock
        private List<String> preferencesDetails;
        private List<MobilePhoneRecommendation> preferencesPhoneList;

        //keep track of all the details at phase details @kwanghock
        private List<String> phoneSpecsDetails;
        private List<MobilePhoneRecommendation> phoneSpecsPhoneList;

        //Results at the end
        private List<MobilePhoneRecommendation> results;
        int iResultIterate;

        private class MobilePhoneRecommendation
        {
            public int iCameraZoom { get; set; }
            public int iCameraPixel { get; set; }
            public string sColor { get; set; }
            public int iWeight { get; set; }
            public int iWeightage { get; set; }
            public String sFact { get; set; }
        }

        private Mommosoft.ExpertSystem.Environment environment;

        public MainForm() {

            //Initializing of all variables needed
            InitializeComponent();
            environment = new Mommosoft.ExpertSystem.Environment();

            environment.Load("mobilephone.clp");

            UIState = 0;
            SetUIState(Defintions.PhaseStart);
            this.buttonRestart.Visible = false;

            preferencesDetails      = new List<String>();
            preferencesPhoneList    = new List<MobilePhoneRecommendation>();
            phoneSpecsDetails       = new List<String>();
            phoneSpecsPhoneList     = new List<MobilePhoneRecommendation>();
            personalityDetails      = new List<String>();
            personalityPhoneList    = new List<MobilePhoneRecommendation>();

            results = new List<MobilePhoneRecommendation>();
            iResultIterate = 0;

            /*
             * Watching of facts is done in output window. So make sure when build output window is shown
             * WactchItem is an enum.
             * @kwanghock
             */
            environment.Watch(WatchItem.Facts);
            environment.Reset();

            //assert test input to check everything ran correctly. @kwanghock
            testInput();
            
            environment.Run();

            //Test by getting all the facts see whether reflect correctly @kwanghock
            test();
        }

        private void testInput()
        {
            /* 
             * Insert Initial Facts here
             */
            
            // environment.AssertString("(FACTS HERE)");
            // environment.AssertString("(FACTS HERE)");
        }

        private void test()
        {
            /*
             * evalStr is the function that i called to test to get all facts about phone
             * (get-mobilephone-list) is the function in the clips file that finds all facts for phone
             * @kwanghock
             */
            string evalStr = "(get-mobilephone-list)";
            MultifieldValue mv = (MultifieldValue)environment.Eval(evalStr);

            //For now put in a list and see how we can display it to show
            List<MobilePhoneRecommendation> rList = new List<MobilePhoneRecommendation>();

            /*
             * FactAddressValue is the fact itself. So to get a specific slot of the fact, just .GetFactSlot.
             * Make sure cast to correct type can already
             * @kwanghock
             */
            FactAddressValue fv = (FactAddressValue)mv[0];

            int iCameraZoom = (int)(IntegerValue)fv.GetFactSlot("camera-zoom");
            int iCameraPixel = (int)(IntegerValue)fv.GetFactSlot("camera-pixel");
            String sColor = (String)(SymbolValue)fv.GetFactSlot("color");
            int iWeight = (int)(IntegerValue)fv.GetFactSlot("weight");
            int iWeightage = (int)(IntegerValue)fv.GetFactSlot("weightage");
            
           // rList.Add(new MobilePhoneRecommendation() { iCameraZoom, iCameraPixel, sColor, iWeight, iWeightage });
        }

        private void OnClickButton(object sender, EventArgs e)
        {
            Button button = sender as Button;
            if ((button.Name.CompareTo("buttonNext") == 0) )
            {
                if (panelPhase0.Visible)
                {
                    ProcessPhase(Defintions.PhaseStart);
                }
                if (panelPhase1.Visible)
                {
                    ProcessPhase(Defintions.PhasePersonality);
                }
                if (panelPhase2.Visible)
                {
                    ProcessPhase(Defintions.PhasePreferences);
                }
                if (panelPhase3.Visible)
                {
                    ProcessPhase(Defintions.PhaseDetails);
                }
                if (panelPhase4.Visible)
                {
                    ProcessPhase(Defintions.PhaseResults);
                }
                SetUIState(++UIState);
            }
            else if (button.Name.CompareTo("buttonPrev") == 0)
            {
                if (panelPhase0.Visible)
                {
                    ResetPhase(Defintions.PhaseStart);
                }
                else if (panelPhase1.Visible)
                {
                    ResetPhase(Defintions.PhasePersonality);
                }
                else if (panelPhase2.Visible)
                {
                    ResetPhase(Defintions.PhasePreferences);
                }
                else if (panelPhase3.Visible)
                {
                    ResetPhase(Defintions.PhaseDetails);
                }
                else if (panelPhase4.Visible)
                {
                    ResetPhase(Defintions.PhaseResults);
                }
                //Have to reset to the previous state
                SetUIState(--UIState);
               
            }
            else if (button.Name.CompareTo("buttonRestart") == 0)
            {
                SetUIState(Defintions.PhaseStart);
                UIState = Defintions.PhaseStart;
                ResetPhase(Defintions.PhaseStart); //@kwanghock 05/03/2012 restart button dont reset properly
            }
            else if (button.Name.CompareTo("buttonNextPhone") == 0)
            {
                buttonNextPhone.Visible = true;
                buttonPrevPhone.Visible = true;
                if (++iResultIterate < results.Count)
                {
                    UpdateResult(iResultIterate);
                    if (iResultIterate == results.Count - 1)
                    {
                        buttonNextPhone.Visible = false;
                        buttonPrevPhone.Visible = true;
                    }
                }
            }
            else if (button.Name.CompareTo("buttonPrevPhone") == 0)
            {
                buttonNextPhone.Visible = true;
                buttonPrevPhone.Visible = true;
                if (--iResultIterate >= 0)
                {
                    UpdateResult(iResultIterate);
                    if(iResultIterate==0)
                        buttonPrevPhone.Visible = false;
                }
            }
        }

        private void UpdateResult(int iResultIterate)
        {
            //Display the results of the phone chosen.
            labelResultZoom.Text = "Camera Zoom : X" + results.ElementAt(iResultIterate).iCameraZoom; 
            labelResultPixel.Text = "Camera Pixel : " + results.ElementAt(iResultIterate).iCameraPixel + " pixels";
            labelResultColor.Text = "Number " + (iResultIterate + 1) + " Phone Color : " + results.ElementAt(iResultIterate).sColor;
            //testing iamge
            pictureBoxPhone.ImageLocation = "http://image.made-in-china.com/2f0j00ZMTtpbjWCwqR/Mobile-Phone-Laptop.jpg";
            pictureBoxPhone.SizeMode = PictureBoxSizeMode.StretchImage;
        }

        private void ResetPhase(int iPhase)
        {
            switch (iPhase)
            {
                case Defintions.PhaseStart:
                    {
                        //Nothing to reset to @kwanghock 05/03/2012
                        environment.Reset();
                    }
                    break;
                case Defintions.PhasePersonality:
                    {
                        //Nothing to reset to. It will go back to phaseStart @kwanghock
                        environment.Reset();
                    }
                    break;
                case Defintions.PhasePreferences:
                    {
                        /*
                         * If we are implementing phasePersonality, we will retract all the personality facts
                         * we asserted here.
                         */
                        environment.Reset();
                    }
                    break;
                case Defintions.PhaseDetails:
                    {
                        /*
                         * Retract all the preference facts that we asserted here
                         * Since there is no way we can use this to retract,
                         * do a reset and assert back the facts that were determined at the personality phase
                         */
                        environment.Reset();
                        for (int i = 0; i < personalityDetails.Count; i++)
                            environment.AssertString(personalityDetails.ElementAt(i));

                        //Clear the preferences details and clear the phoneList updated at the preferences phase
                        preferencesDetails.Clear();
                        preferencesPhoneList.Clear();
                    }
                    break;
                case Defintions.PhaseResults:
                    {
                        /*
                         * Retract all the details facts that we asserted here
                         * Since there is no way we can use this to retract details about the phone
                         * do a reset and assert back the facts that were determined at the preferences phase and the personality phase
                         */
                        environment.Reset();
                        for (int i = 0; i < personalityDetails.Count; i++)
                            environment.AssertString(personalityDetails.ElementAt(i));
                        for (int i = 0; i < preferencesDetails.Count; i++)
                            environment.AssertString(preferencesDetails.ElementAt(i));

                        //Clear the specifications details and hte phonelist updated at the specifications phase
                        phoneSpecsPhoneList.Clear();
                        phoneSpecsDetails.Clear();
                    }
                    break;
            }
        }

        private void ProcessPhase(int iPhase)
        {
            switch (iPhase)
            {
                case Defintions.PhaseStart:
                {
                      //Just some basic introduction of the whole thing
                }
                break;
                case Defintions.PhasePersonality:
                {
                    //personality questions
                    //update personality attributes


                    //update phoneList for this phasePersonality
                    UpdatePhoneList(personalityPhoneList);
                }
                break;
                case Defintions.PhasePreferences:
                {
                    /*
                      * For each of the question asked in phase 2, the for loop is the same, just note the box name is
                      * different
                      * @kwanghock
                      */
                    //Assert the weightage of the attributes related to the question here
                    //Question 1
                    foreach (RadioButton control in grp_box_q1.Controls)
                    {
                        if (control.Checked)
                        {
                            //Question: Do you watch movies you downloaded on your phone?
                            if (control.Name.Equals("q1_yes"))
                            {

                            }
                            else if(control.Name.Equals("q1_no"))
                            {

                            }
                            /*
                            String sRequirementName = "(requirement-name memory)";
                            String sRequirementValue = "(requirement-value " + control.Text + ")";
                            String sRequirementWeightage = "(requirement-weightage " + control.Text + ")";
                           
                            environment.AssertString("(requirement " + sRequirementName + sRequirementValue + sRequirementWeightage + ")");
                            preferencesDetails.Add("(requirement " + sRequirementName + sRequirementValue + sRequirementWeightage + ")");
                            */
                             }
                    }
                    //Question 2
                    foreach (RadioButton control in grp_box_q2.Controls)
                    {
                        if (control.Checked)
                        {
                            //Question: Do you listen to music on your phone?
                            if (control.Name.Equals("q2_yes"))
                            {

                            }
                            else if (control.Name.Equals("q2_no"))
                            {

                            }
                        }
                    }

                    //Question 3
                    foreach (RadioButton control in grp_box_q3.Controls)
                    {
                        if (control.Checked)
                        {
                            //Question: Do you watch movies you downloaded on your phone?
                            if (control.Name.Equals("q3_yes"))
                            {

                            }
                            else if (control.Name.Equals("q3_no"))
                            {

                            }
                        }
                    }

                    //Question 4
                    foreach (RadioButton control in grp_box_q4.Controls)
                    {
                        if (control.Checked)
                        {
                            //Question: Do you watch movies you downloaded on your phone?
                            if (control.Name.Equals("q4_yes"))
                            {

                            }
                            else if (control.Name.Equals("q4_no"))
                            {

                            }
                        }
                    }

                    //Question 5
                    foreach (RadioButton control in grp_box_q5.Controls)
                    {
                        if (control.Checked)
                        {
                            //Question: Do you use phone as your personal and only camera? 
                            if (control.Name.Equals("q5_yes"))
                            {

                            }
                            else if (control.Name.Equals("q5_no"))
                            {

                            }
                        }
                    }

                    //Question 6
                    foreach (RadioButton control in grp_box_q6.Controls)
                    {
                        if (control.Checked)
                        {
                            //Question: Do you use phone as your personal and only camera? 
                            if (control.Name.Equals("q6_yes"))
                            {

                            }
                            else if (control.Name.Equals("q6_no"))
                            {

                            }
                        }
                    }
                    //Update phonelist for this PhasePreferences
                    UpdatePhoneList(preferencesPhoneList);
                }
                break;
                case Defintions.PhaseDetails:
                {
                    //Ask for specifications of the phones
                    //Update the specfications


                    //Update phoneList for this PhaseDetails
                   
                    UpdatePhoneList(phoneSpecsPhoneList);
                }
                break;
                case Defintions.PhaseResults:
                {
                    UpdatePhoneList(results);

                    //Sort according to overall weightage
                    results = results.OrderBy(m=>m.iWeightage).ToList<MobilePhoneRecommendation>();

                    //Display the results of the phone chosen.
                    UpdateResult(0);
                }
                break;
            }
        }

        private static int WeightageSort(int x, int y)
        {
            return 0;
        }

        private void UpdatePhoneList(List<MobilePhoneRecommendation> PhoneList)
        {
            string evalStr = "(get-mobilephone-list)";
            MultifieldValue mv = (MultifieldValue)environment.Eval(evalStr);

            for (int i = 0; i < mv.Count; i++)
            {
                FactAddressValue fv = (FactAddressValue)mv[i];

                int iCameraZoom = (int)(IntegerValue)fv.GetFactSlot("camera-zoom");
                int iCameraPixel = (int)(IntegerValue)fv.GetFactSlot("camera-pixel");
                String sColor = (String)(SymbolValue)fv.GetFactSlot("color");
                int iWeight = (int)(IntegerValue)fv.GetFactSlot("weight");
                int iWeightage = (int)(IntegerValue)fv.GetFactSlot("weightage");

                MobilePhoneRecommendation a = new MobilePhoneRecommendation();
                a.iCameraPixel = iCameraPixel;
                a.iCameraZoom = iCameraZoom;
                a.sColor = sColor;
                a.iWeight = iWeight;
                a.iWeightage = iWeightage;
                a.sFact = "(phone (camera-zoom "+ iCameraZoom + ")" + "(camera-pixel "+iCameraPixel + ")" + "(color " + sColor + ")" +"(weight "+iWeight + ")" + "(weightage "+ iWeightage +"))";
                PhoneList.Add(a);
            }
        }

        private void SetUIState(int iPhase)
        {
            if (iPhase == Defintions.PhaseStart)
            {
                panelPhase0.Visible = true;
                panelPhase1.Visible = false;
                panelPhase2.Visible = false;
                panelPhase3.Visible = false;
                panelPhase4.Visible = false;
                this.buttonPrev.Visible = false;
                this.buttonRestart.Visible = false;
                this.buttonNext.Visible = true;
            }
            else if (iPhase == Defintions.PhasePersonality)
            {
                panelPhase0.Visible = false;
                panelPhase1.Visible = true;
                panelPhase2.Visible = false;
                panelPhase3.Visible = false;
                panelPhase4.Visible = false;
                this.buttonPrev.Visible = true;
                this.buttonRestart.Visible = false;
            }
            else if (iPhase == Defintions.PhasePreferences)
            {
                panelPhase0.Visible = false;
                panelPhase1.Visible = false;
                panelPhase2.Visible = true;
                panelPhase3.Visible = false;
                panelPhase4.Visible = false;
                this.buttonRestart.Visible = false;
            }
            else if (iPhase == Defintions.PhaseDetails)
            {
                panelPhase0.Visible = false;
                panelPhase1.Visible = false;
                panelPhase2.Visible = false;
                panelPhase3.Visible = true;
                panelPhase4.Visible = false;
                this.buttonNext.Visible = true;
                this.buttonRestart.Visible = false;
            }
            else if (iPhase == Defintions.PhaseResults)
            {
                panelPhase0.Visible = false;
                panelPhase1.Visible = false;
                panelPhase2.Visible = false;
                panelPhase3.Visible = false;
                panelPhase4.Visible = true;
                this.buttonNext.Visible = false;
                this.buttonRestart.Visible = true;
                this.buttonPrevPhone.Visible = false;
                ProcessPhase(Defintions.PhaseResults);
            }
        }   
    }
}
