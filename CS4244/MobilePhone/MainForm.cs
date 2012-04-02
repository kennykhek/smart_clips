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

        private int UIState;

        //keep track of all the personality details at phase personality 
        private List<String> personalityDetails;
        private List<MobilePhoneRecommendation> personalityPhoneList;

        //keep track of the preferences at phase preferences 
        private List<String> preferencesDetails;
        private List<MobilePhoneRecommendation> preferencesPhoneList;

        //keep track of all the details at phase details 
        private List<String> phoneSpecsDetails;
        private List<MobilePhoneRecommendation> phoneSpecsPhoneList;

        //Results at the end
        private List<MobilePhoneRecommendation> results;
        int iResultIterate;

        private BindingList<MobileResultDisplay> phase3Results;
        private BindingList<PlanResultDisplay> phase4Results;

        private class MobileResultDisplay
        {

            public String sModel { get; set; }
            public float fWeightage { get; set; }
        }

        private class PlanResultDisplay
        {
            public String sModel { set; get; }
            public String sPlan { set; get; }
            public float fWeightagePlan { set; get; }
            public float fWeightagePhone { set; get; }
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
            phase4Results = new BindingList<PlanResultDisplay>();

            /*
             * Watching of facts is done in output window. So make sure when build output window is shown
             * WactchItem is an enum.
             */

            environment.Watch(WatchItem.Facts);
            environment.Reset();
            
            environment.Run();

            //Load the dropdown values for PhaseDetails
            LoadPhaseDetailsDropdown();

            //Load dropdown values for mobile plans
            LoadPhasePlanDropdown();
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
                    environment.Eval("(next_stage 1)");

                    ProcessPhase(Defintions.PhasePersonality);
                }
                if (panelPhase2.Visible)
                {
                    //Before processing modify the correct stage
                    environment.Eval("(next_stage 3)");

                    ProcessPhase(Defintions.PhasePreferences);
                }
                if (panelPhase3.Visible)
                {
                    //Before processing modify the correct stage
                    environment.Eval("(next_stage 5)");

                    ProcessPhase(Defintions.PhaseDetails);
                }
                if (panelPhase4.Visible) 
                {
                    ProcessPhase(Defintions.PhaseMobilePlan);
                    //Do a run to allow plan data grid to be populated  when onload
                    environment.Run();
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
                    environment.Eval("(prev_stage 3)");
                }
                else if (panelPhase3.Visible)
                {
                    ResetPhase(Defintions.PhaseDetails);
                    environment.Eval("(prev_stage 5)");
                }
                else if (panelPhase4.Visible)
                {
                    ResetPhase(Defintions.PhaseMobilePlan);
                    environment.Eval("(prev_stage 7)");

                }
                //Have to reset to the previous state
                SetUIState(--UIState);
               
            }
            else if (button.Name.CompareTo("buttonRestart") == 0)
            {
                environment.Eval("(restart_stage)");
                SetUIState(Defintions.PhaseStart);
                UIState = Defintions.PhaseStart;
                ResetPhase(Defintions.PhaseStart);
              
            }
            environment.Run();
        }

        private void ResetPhase(int iPhase)
        {
            switch (iPhase)
            {
                case Defintions.PhaseStart:
                    {
                        //Nothing to be done
                    }
                    break;
                case Defintions.PhasePersonality:
                    {
                        //Nothing to be done
                    }
                    break;
                case Defintions.PhasePreferences:
                    {
                        //Nothing to be done
                    }
                    break;
                case Defintions.PhaseDetails:
                    {
                        //Reset the dropdown and set all dropdown init values to nil
                        ResetDropDownDef();
                    }
                    break;
                case Defintions.PhaseMobilePlan:
                    {
                        //Nothing to be done
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
                      //Nothing to be done here
                }
                break;
                case Defintions.PhasePersonality:
                {
                    //personality questions
                    ProcessPersonality();
                }
                break;
                case Defintions.PhasePreferences:
                {
                    //Preferences questions
                    ProcessPhasePreferences();
                }
                break;
                case Defintions.PhaseDetails:
                {
                    //Nothing needs to be processed.
                }
                break;
                case Defintions.PhaseMobilePlan:
                {
                    //Nothing needs to be processed.
                }
                break;
            }
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
                float fWeightage = (float)(FloatValue)fv.GetFactSlot("normalizedWeightage");

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

                //Populate the datagrid results on load after do a clearing for safety 
                InitDataGrid();
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

                phase4Results.Clear();

                InitPlanDataGrid();
            }
        }

    }
}
