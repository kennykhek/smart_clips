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

        private BindingList<MobileResultDisplay> phase3Results;

        private class MobileResultDisplay
        {

            public String sModel { get; set; }
            public float fWeightage { get; set; }
        }

        private class PlanResultDisplay
        {
            public String sModel { set; get; }
            public String sPlan { set; get; }
            public float fprice { set; get; }
        }

        private class MobilePhoneRecommendation
        {
            public String sModel { get; set; }
            public float fPrice { get; set; }

            //Specs
            public String sBrand { get; set; }
            public String sColor { get; set; }
            public float fScreen { get; set; }
            public float fWeight { get; set; }
            public int iMemory { get; set; }

            //Features
            public String sOS { get; set; }
            public String sBluetooth { get; set; }
            public String sWifi { get; set; }
            public String sFM { get; set; }

            //Camera
            public int iZoom { get; set; }
            public float fPixel { get; set; }
            public String sFlash { get; set; }
            public String sVideoHD { get; set; }
            public float fWeightage { get; set; }

            //Fact itself

            public String sFact { get; set; }
        }

        private Mommosoft.ExpertSystem.Environment environment;

        public MainForm() {

            //Initializing of all variables needed
            InitializeComponent();
            environment = new Mommosoft.ExpertSystem.Environment();

            //Load the clips file
            environment.Load("mobilephone.clp");



            //Set initial stage
            UIState = 0;
            SetUIState(Defintions.PhaseStart);
            this.buttonRestart.Visible = false;

            //Initializing lists of information to be stored at each phase
            preferencesDetails      = new List<String>();
            preferencesPhoneList    = new List<MobilePhoneRecommendation>();
            phoneSpecsDetails       = new List<String>();
            phoneSpecsPhoneList     = new List<MobilePhoneRecommendation>();
            personalityDetails      = new List<String>();
            personalityPhoneList    = new List<MobilePhoneRecommendation>();

            results = new List<MobilePhoneRecommendation>();
            iResultIterate = 0;

            phase3Results = new BindingList<MobileResultDisplay>();

            /*
             * Watching of facts is done in output window. So make sure when build output window is shown
             * WactchItem is an enum.
             * @kwanghock
             */

            environment.Watch(WatchItem.Facts);
            environment.Reset();

            //assert test input to check everything ran correctly. @kwanghock
            //testInput();
            
            environment.Run();

            //Load the dropdown values for PhaseDetails
            LoadPhaseDetailsDropdown();

            //Load dropdown values for mobile plans
            LoadPhasePlanDropdown();

            //Test by getting all the facts see whether reflect correctly @kwanghock
            //test();
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

           /* int iCameraZoom = (int)(IntegerValue)fv.GetFactSlot("camera-zoom");
            int iCameraPixel = (int)(IntegerValue)fv.GetFactSlot("camera-pixel");
            String sColor = (String)(SymbolValue)fv.GetFactSlot("color");
            int iWeight = (int)(IntegerValue)fv.GetFactSlot("weight");
            int iWeightage = (int)(IntegerValue)fv.GetFactSlot("weightage");*/
            
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
                    //Before processing modify the correct stage at clips side
                    environment.Eval("(next_phase 1)");

                    ProcessPhase(Defintions.PhasePersonality);
                }
                if (panelPhase2.Visible)
                {
                    //Before processing modify the correct stage
                    environment.Eval("(next_phase 3)");

                    ProcessPhase(Defintions.PhasePreferences);
                }
                if (panelPhase3.Visible)
                {
                    //Before processing modify the correct stage
                    environment.Eval("(next_phase 5)");

                    ProcessPhase(Defintions.PhaseDetails);
                }
                if (panelPhase4.Visible) 
                {
                    ProcessPhase(Defintions.PhaseMobilePlan);
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
                    environment.Eval("(prev_phase 0)");
                }
                else if (panelPhase3.Visible)
                {
                    ResetPhase(Defintions.PhaseDetails);
                    environment.Eval("(prev_phase 5)");
                }
                else if (panelPhase4.Visible)
                {
                    ResetPhase(Defintions.PhaseMobilePlan);
                    environment.Eval("(prev_phase 5)");
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
            environment.Run();
        }

        private void UpdateResult(int iResultIterate)
        {
           /* //Display the results of the phone chosen.
            labelResultZoom.Text = "Camera Zoom : X" + results.ElementAt(iResultIterate).iCameraZoom; 
            labelResultPixel.Text = "Camera Pixel : " + results.ElementAt(iResultIterate).iCameraPixel + " pixels";
            labelResultColor.Text = "Number " + (iResultIterate + 1) + " Phone Color : " + results.ElementAt(iResultIterate).sColor;
            //testing iamge
            pictureBoxPhone.ImageLocation = "http://image.made-in-china.com/2f0j00ZMTtpbjWCwqR/Mobile-Phone-Laptop.jpg";
            pictureBoxPhone.SizeMode = PictureBoxSizeMode.StretchImage;*/
        }

        private void ResetPhase(int iPhase)
        {
            switch (iPhase)
            {
                case Defintions.PhaseStart:
                    {
                        //Nothing to reset to @kwanghock 05/03/2012
                        //environment.Reset();
                    }
                    break;
                case Defintions.PhasePersonality:
                    {
                        //Nothing to reset to. It will go back to phaseStart @kwanghock
                        //environment.Reset();
                    }
                    break;
                case Defintions.PhasePreferences:
                    {
                        /*
                         * If we are implementing phasePersonality, we will retract all the personality facts
                         * we asserted here.
                         */
                        //environment.Reset();
                    }
                    break;
                case Defintions.PhaseDetails:
                    {
                        /*
                         * Retract all the preference facts that we asserted here
                         * Since there is no way we can use this to retract,
                         * do a reset and assert back the facts that were determined at the personality phase
                         */
                        
                       /* environment.Reset();
                        for (int i = 0; i < personalityDetails.Count; i++)
                            environment.AssertString(personalityDetails.ElementAt(i));
                        
                        //Clear the preferences details and clear the phoneList updated at the preferences phase
                        preferencesDetails.Clear();
                        preferencesPhoneList.Clear();*/

                       // environment.Eval("reset_requirements_column_one");
                        ResetDropDownDef();
                    }
                    break;
                case Defintions.PhaseMobilePlan:
                    {
                        /*
                         * Retract all the details facts that we asserted here
                         * Since there is no way we can use this to retract details about the phone
                         * do a reset and assert back the facts that were determined at the preferences phase and the personality phase
                         */
                       /* environment.Reset();
                        for (int i = 0; i < personalityDetails.Count; i++)
                            environment.AssertString(personalityDetails.ElementAt(i));
                        for (int i = 0; i < preferencesDetails.Count; i++)
                            environment.AssertString(preferencesDetails.ElementAt(i));

                        //Assert phase fact again to trigger calculate weightage rule after preferences are chosen.
                        environment.AssertString("(phase (stage 3))");

                        //Clear the specifications details and hte phonelist updated at the specifications phase
                        phoneSpecsPhoneList.Clear();
                        phoneSpecsDetails.Clear();*/
                    }
                    break;
            }
            environment.Run();
        }

        private void ProcessPhase(int iPhase)
        {
            switch (iPhase)
            {
                case Defintions.PhaseStart:
                {
                      //Nothing to be done here @kwanghock
                }
                break;
                case Defintions.PhasePersonality:
                {
                    //personality questions
                    //update personality attributes
                    ProcessPersonality();

                    //Removed @kwanghock
                    //update phoneList for this phasePersonality
                    //UpdatePhoneList(personalityPhoneList);
                }
                break;
                case Defintions.PhasePreferences:
                {
                    //Method in PhasePreferences.cs to process
                    ProcessPhasePreferences();

                    //removed @kwanghock
                    //Update phonelist for this PhasePreferences
                    //UpdatePhoneList(preferencesPhoneList);
                }
                break;
                case Defintions.PhaseDetails:
                {
                    //Ask for specifications of the phones
                    //Update the specfications
                    ProcessPhoneSpecs();

                    //Update phoneList for this PhaseDetails
                   
                    //UpdatePhoneList(phoneSpecsPhoneList);
                    //dataGridView.DataSource = pha;
                }
                break;
                case Defintions.PhaseMobilePlan:
                {
                    ProcessMobilePlan();
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
            string evalStr = "(get_mobilephone_list)";
            MultifieldValue mv = (MultifieldValue)environment.Eval(evalStr);

            for (int i = 0; i < mv.Count; i++)
            {
                FactAddressValue fv = (FactAddressValue)mv[i];

                String sModel = "" ;
                if ((fv.GetFactSlot("model").GetType().ToString()).Equals("Mommosoft.ExpertSystem.SymbolValue"))
                    sModel = (String)(SymbolValue)fv.GetFactSlot("model");
                else if ((fv.GetFactSlot("model").GetType().ToString()).Equals("Mommosoft.ExpertSystem.IntegerValue"))
                    sModel = ((int)(IntegerValue)fv.GetFactSlot("model")).ToString();
                    
                float fPrice = (float)(FloatValue)fv.GetFactSlot("price");
                
                //Specs
                String sBrand = (String)(SymbolValue)fv.GetFactSlot("brand");
                String sColor = (String)(SymbolValue)fv.GetFactSlot("color");
                float fScreen=(float)(FloatValue)fv.GetFactSlot("screen");
                float fWeight = (float)(FloatValue)fv.GetFactSlot("weight");
                int iMemory = (int)(IntegerValue)fv.GetFactSlot("memory");

                //Features
                String sOS = (String)(SymbolValue)fv.GetFactSlot("os");
                String sBluetooth = (String)(SymbolValue)fv.GetFactSlot("bluetooth");
                String sWifi = (String)(SymbolValue)fv.GetFactSlot("wifi");
                String sFM = (String)(SymbolValue)fv.GetFactSlot("fm");

                //camera
                int iCameraZoom = (int)(IntegerValue)fv.GetFactSlot("zoom");
                float fCameraPixel = (float)(FloatValue)fv.GetFactSlot("pixel");
                String sFlash = (String)(SymbolValue)fv.GetFactSlot("flash");
                String sVideoHD = (String)(SymbolValue)fv.GetFactSlot("videoHD");
                float fWeightage = (float)(FloatValue)fv.GetFactSlot("weightage");

                MobilePhoneRecommendation a = new MobilePhoneRecommendation();
                a.sModel = sModel;
                a.fPrice = fPrice;
                a.sBrand = sBrand;
                a.sColor = sColor;
                a.fScreen = fScreen;
                a.fWeight = fWeight;
                a.iMemory = iMemory;
                a.sOS = sOS;
                a.sBluetooth = sBluetooth;
                a.sWifi = sWifi;
                a.sFM = sFM;
                a.iZoom = iCameraZoom;
                a.fPixel = fCameraPixel;
                a.sFlash = sFlash;
                a.sVideoHD = sVideoHD;
                a.fWeightage = fWeightage;

                String sAttributeModel = "(model " + a.sModel +")";
                String sAttributePrice = "(price " + a.fPrice.ToString() + ")";
                String sAttributeBrand = "(brand " + a.sBrand + ")";
                String sAttributeColor = "(color " + a.sColor + ")";
                String sAttributeScreen = "(screen " + a.fScreen.ToString() + ")";
                String sAttributeWeight = "(weight " + a.fWeightage.ToString() + ")";
                String sAttributeMemory = "(memory " + a.iMemory.ToString() + ")";
                String sAttributeOS = "(os " + a.sOS +")";
                String sAttributeBluetooth = "(bluetooth " + a.sBluetooth + ")";
                String sAttributeWifi = "(wifi " + a.sWifi + ")";
                String sAttributeFM = "(fm " + a.sFM + ")";
                String sAttributeZoom = "(zoom " + a.iZoom.ToString() + ")";
                String sAttributePixel = "(pixel " + a.fPixel.ToString() + ")";
                String sAttributeFlash = "(flash " + a.sFlash + ")";
                String sAttributeVideoHD = "(videoHD " + a.sVideoHD + ")";
                String sAttributeWeightage = "(weightage " + a.fWeightage.ToString() + ")";

                String sFact = "(phone " + sAttributeModel + sAttributePrice + sAttributeBrand + sAttributeColor + sAttributeScreen + sAttributeWeight + sAttributeMemory + sAttributeOS + sAttributeBluetooth + sAttributeWifi + sAttributeFM + sAttributeZoom + sAttributePixel + sAttributeFlash + sAttributeVideoHD + sAttributeWeightage + ")";

                a.sFact = sFact;
            }
        }

        private void SetUIState(int iPhase)
        {
            if (iPhase == Defintions.PhaseStart)
            {
                panelPhase0.Visible = true;
                panelPhase0.BringToFront();
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
                this.buttonNext.Visible = true;
                panelPhase1.BringToFront();
            }
            else if (iPhase == Defintions.PhasePreferences)
            {
                
                panelPhase0.Visible = false;
                panelPhase1.Visible = false;
                panelPhase2.Visible = true;
                panelPhase3.Visible = false;
                panelPhase4.Visible = false;
                this.buttonNext.Visible = true;
                this.buttonRestart.Visible = false;
                panelPhase2.BringToFront();

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
                this.buttonPrev.Visible = true;
                panelPhase3.BringToFront();
                phase3Results.Clear();
            }
            else if (iPhase == Defintions.PhaseMobilePlan)
            {
                panelPhase0.Visible = false;
                panelPhase1.Visible = false;
                panelPhase2.Visible = false;
                panelPhase3.Visible = false;
                panelPhase4.Visible = true;
                this.buttonNext.Visible = false;
                this.buttonRestart.Visible = true;
                this.buttonPrev.Visible = true;
                ProcessPhase(Defintions.PhaseMobilePlan);
            }
        }




        


    }
}
