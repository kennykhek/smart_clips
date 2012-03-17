using Mommosoft.ExpertSystem;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using System.Xml.XPath;
using System.Data;

namespace MobilePhone
{
    public partial class MainForm : Form
    {
        List<String> listModel;
        List<float> listPrice;
        List<String> listBrand;
        List<String> listColor;
        List<float> listScreen;
        List<float> listWeight;
        List<int> listMem;
        List<String> listOS;
        List<String> listBluetooth;
        List<String> listWifi;
        List<String> listFM;
        List<int> listZoom;
        List<String> listFlash;
        List<String> listVideoHD;
        List<float> listPixel;

        public void ProcessPhoneSpecs()
        {
        }

        public void LoadPhaseDetailsDropdown()
        {
            //Collects a list of attributes from the phone fact list
            listModel = new List<String>();
            listPrice = new List<float>();
            listBrand = new List<String>();
            listColor = new List<String>();
            listScreen = new List<float>();
            listWeight = new List<float>();
            listMem = new List<int>();
            listOS = new List<String>();
            listBluetooth = new List<String>();
            listWifi = new List<String>();
            listFM = new List<String>();
            listZoom = new List<int>();
            listFlash = new List<String>();
            listVideoHD = new List<String>();
            listPixel = new List<float>();

            //Evaluate each fact and input the corresponding attributes for each phone
            string evalStr = "(get-mobilephone-list)";
            MultifieldValue mv = (MultifieldValue)environment.Eval(evalStr);
            for (int i = 0; i < mv.Count; i++)
            {
                FactAddressValue fv = (FactAddressValue)mv[i];
                
                /*
                 * Because in the template in the clips file, type for model is not defined,
                 * Hence here when we check for model, we need to find what type it is.
                 */
                String sModel = "";
                if ((fv.GetFactSlot("model").GetType().ToString()).Equals("Mommosoft.ExpertSystem.SymbolValue"))
                    sModel = (String)(SymbolValue)fv.GetFactSlot("model");
                else if ((fv.GetFactSlot("model").GetType().ToString()).Equals("Mommosoft.ExpertSystem.IntegerValue"))
                    sModel = ((int)(IntegerValue)fv.GetFactSlot("model")).ToString();

                listModel.Add(sModel);

                float fPrice = (float)(FloatValue)fv.GetFactSlot("price");
                listPrice.Add(fPrice);

                String sBrand = (String)(SymbolValue)fv.GetFactSlot("brand");
                listBrand.Add(sBrand);

                String sColor = (String)(SymbolValue)fv.GetFactSlot("color");
                listColor.Add(sColor);

                float fScreen = (float)(FloatValue)fv.GetFactSlot("screen");
                listScreen.Add(fScreen);

                float fWeight = (float)(FloatValue)fv.GetFactSlot("weight");
                listWeight.Add(fWeight);

                int iMem = (int)(IntegerValue)fv.GetFactSlot("memory");
                listMem.Add(iMem);

                String sOS = (String)(SymbolValue)fv.GetFactSlot("os");
                listOS.Add(sOS);

                String sBluetooth = (String)(SymbolValue)fv.GetFactSlot("bluetooth");
                listBluetooth.Add(sBluetooth);

                String sWifi = (String)(SymbolValue)fv.GetFactSlot("wifi");
                listWifi.Add(sWifi);

                String sFM = (String)(SymbolValue)fv.GetFactSlot("fm");
                listFM.Add(sFM);

                int iCameraZoom = (int)(IntegerValue)fv.GetFactSlot("zoom");
                listZoom.Add(iCameraZoom);

                float fCameraPixel = (float)(FloatValue)fv.GetFactSlot("pixel");
                listPixel.Add(fCameraPixel);

                String sFlash = (String)(SymbolValue)fv.GetFactSlot("flash");
                listFlash.Add(sFlash);

                String sVideoHD = (String)(SymbolValue)fv.GetFactSlot("videoHD");
                listVideoHD.Add(sVideoHD);
            }

            /*.Distinct().ToList() remove duplicates. sort() sorts the float and int
            values in descending order @kwanghock 17March2012*/

            listModel = listModel.Distinct().ToList();

            listPrice = listPrice.Distinct().ToList();
            listPrice.Sort();

            listBrand = listBrand.Distinct().ToList();
            
            listColor = listColor.Distinct().ToList();
            
            listScreen = listScreen.Distinct().ToList();
            listScreen.Sort();

            listWeight = listWeight.Distinct().ToList();
            listWeight.Sort();

            listMem = listMem.Distinct().ToList();
            listMem.Sort();
            
            listOS = listOS.Distinct().ToList();
            
            listBluetooth = listBluetooth.Distinct().ToList();
            
            listWifi = listWifi.Distinct().ToList();
            
            listFM = listFM.Distinct().ToList();
            
            listZoom = listZoom.Distinct().ToList();
            listZoom.Sort();
            
            listFlash = listFlash.Distinct().ToList();
            
            listVideoHD = listVideoHD.Distinct().ToList();
            
            listPixel = listPixel.Distinct().ToList();
            listPixel.Sort();

            /*
             *  for all the attributes gathered, add them to the dropdown box to be
             *  chosen. those attributes that are of value type string. first letter
             *  is convert to uppercase. @kwanghock 17march2012
             */

            for (int i = 0; i < listColor.Count; i++)
                cbColor.Items.Add(UpperCaseFirstChar(listColor.ElementAt(i)));

            for (int i = 0; i < listScreen.Count; i++)
                cbScreen.Items.Add(listScreen.ElementAt(i));

            for (int i = 0; i < listFM.Count; i++)
                cbFM.Items.Add(UpperCaseFirstChar(listFM.ElementAt(i)));

            for (int i = 0; i < listVideoHD.Count; i++)
                cbVideoHD.Items.Add(UpperCaseFirstChar(listVideoHD.ElementAt(i)));

            for (int i = 0; i < listFlash.Count; i++)
                cbCamFlash.Items.Add(UpperCaseFirstChar(listFlash.ElementAt(i)));

            for (int i = 0; i < listMem.Count; i++)
                cbMem.Items.Add(listMem.ElementAt(i) + " gb");

            for (int i = 0; i < listWeight.Count; i++)
                cbWeight.Items.Add(listWeight.ElementAt(i) + " g");

            for (int i = 0; i < listPixel.Count; i++)
                cbCamPixel.Items.Add(listPixel.ElementAt(i)+" px");

            for (int i = 0; i < listWifi.Count; i++)
                cbWifi.Items.Add(UpperCaseFirstChar(listWifi.ElementAt(i)));

            for (int i = 0; i < listZoom.Count; i++)
                cbZoom.Items.Add("x"+listZoom.ElementAt(i));

            for (int i = 0; i < listOS.Count; i++)
                cbOS.Items.Add(UpperCaseFirstChar(listOS.ElementAt(i)));
            

        }
       
        //Convert the first letter of the string arugment to be of uppercase
        public String UpperCaseFirstChar(String sConvert)
        {
            //Set first letter to caps
           char[] letters = sConvert.ToCharArray();
           letters[0] = char.ToUpper(letters[0]);
           return new String(letters);
        }

        //Convert the first letter of the string arugment to be of lowercase
        public String LowerCaseFirstChar(String sConvert)
        {
            //Set first letter to caps
            char[] letters = sConvert.ToCharArray();
            letters[0] = char.ToLower(letters[0]);
            return new String(letters);
        }
        /*
         * If any of the dropdown box value changes. @kwanghock 17march2012
         */
        public void OnChange(object sender, EventArgs e)
        {
            String sSelectedOS = null;
             String sSelectedScreen = null;
             String sSelectedFM =null;
             String sSelectedVideoHD =null ;
            String sSelectedCamFlash =null;
            String sSelectedMem =null;
            String sSelectedWeight =null;
            String sSelectedPixel = null;
            String sSelectedWifi = null;
            String sSelectedColor =null;
            String sSelectedZoom = null;

            if (cbOS.SelectedItem != null)
            {
                sSelectedOS = LowerCaseFirstChar(cbOS.SelectedItem.ToString());
            }
            else sSelectedOS = "?os";

            if (cbScreen.SelectedItem != null)
            {
                sSelectedScreen = LowerCaseFirstChar(cbScreen.SelectedItem.ToString());
            }
            else sSelectedScreen = "?screen";

            if (cbFM.SelectedItem != null)
            {
                sSelectedFM = LowerCaseFirstChar(cbFM.SelectedItem.ToString());
            }
            else sSelectedFM = "?fm";

            if (cbVideoHD.SelectedItem != null)
            {
                sSelectedVideoHD = LowerCaseFirstChar(cbVideoHD.SelectedItem.ToString());
            }
            else sSelectedVideoHD = "?videoHD";

            if (cbCamFlash.SelectedItem != null)
            {
                sSelectedCamFlash = LowerCaseFirstChar(cbCamFlash.SelectedItem.ToString());
            }
            else sSelectedCamFlash = "?flash";

            if (cbMem.SelectedItem != null)
            {
                sSelectedMem = cbMem.SelectedItem.ToString().Substring(0, cbMem.SelectedItem.ToString().IndexOf(" "));
            }
            else sSelectedMem = "?memory";

            if (cbWeight.SelectedItem != null)
            {
                sSelectedWeight = cbWeight.SelectedItem.ToString().Substring(0, cbWeight.SelectedItem.ToString().IndexOf(" "));
            }
            else sSelectedWeight = "?weight";

            if (cbCamPixel.SelectedItem != null)
            {
                sSelectedPixel = cbCamPixel.SelectedItem.ToString().Substring(0, cbCamPixel.SelectedItem.ToString().IndexOf("px"));
            }
            else sSelectedPixel = "?pixel";

            if (cbWifi.SelectedItem != null)
            {
                sSelectedWifi = LowerCaseFirstChar(cbWifi.SelectedItem.ToString());
            }
            else sSelectedWifi = "?wifi";

            if (cbColor.SelectedItem!= null)
            {
                sSelectedColor = LowerCaseFirstChar(cbColor.SelectedItem.ToString());
            }
            else sSelectedColor = "?color";

            if (cbZoom.SelectedItem != null)
            {
                sSelectedZoom = LowerCaseFirstChar(cbZoom.SelectedItem.ToString());
            }
            else sSelectedZoom = "?zoom";

            environment.Run();

            UpdatePhoneGrid(sSelectedOS + " " + sSelectedScreen + " " + sSelectedFM + " " + sSelectedVideoHD + " " + sSelectedCamFlash + " " + sSelectedMem + " " + sSelectedWeight + " " + sSelectedPixel + " " + sSelectedColor + " " + sSelectedWifi + " " + sSelectedZoom);
        }

        public void UpdatePhoneGrid(String attribute)
        {
            //string evalStr = "(update-mobilephone-list " + attribute + ")";
            string evalStr = "(get-mobilephone-list)";
            MultifieldValue mv = (MultifieldValue)environment.Eval(evalStr);

            DataTable testdt = new DataTable();

            for (int i = 0; i < mv.Count; i++)
            {
                FactAddressValue fv = (FactAddressValue)mv[i];

                String sModel = "";
                if ((fv.GetFactSlot("model").GetType().ToString()).Equals("Mommosoft.ExpertSystem.SymbolValue"))
                    sModel = (String)(SymbolValue)fv.GetFactSlot("model");
                else if ((fv.GetFactSlot("model").GetType().ToString()).Equals("Mommosoft.ExpertSystem.IntegerValue"))
                    sModel = ((int)(IntegerValue)fv.GetFactSlot("model")).ToString();

                float fPrice = (float)(FloatValue)fv.GetFactSlot("price");

                //Specs
                String sBrand = (String)(SymbolValue)fv.GetFactSlot("brand");
                String sColor = (String)(SymbolValue)fv.GetFactSlot("color");
                float fScreen = (float)(FloatValue)fv.GetFactSlot("screen");
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

                String sAttributeModel = "(model " + a.sModel + ")";
                String sAttributePrice = "(price " + a.fPrice.ToString() + ")";
                String sAttributeBrand = "(brand " + a.sBrand + ")";
                String sAttributeColor = "(color " + a.sColor + ")";
                String sAttributeScreen = "(screen " + a.fScreen.ToString() + ")";
                String sAttributeWeight = "(weight " + a.fWeightage.ToString() + ")";
                String sAttributeMemory = "(memory " + a.iMemory.ToString() + ")";
                String sAttributeOS = "(os " + a.sOS + ")";
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

                MobileResultDisplay addon = new MobileResultDisplay();
                addon.fWeightage = a.fWeightage;
                addon.sModel = a.sModel;
                phase3Results.Add(addon);

            }
            
            testDataGrid();
            dataGridView.DataSource = phase3Results;
        }

        public void ResetDropDownDef()
        {
            cbOS.SelectedItem = "";
            cbScreen.SelectedItem = "";
            cbFM.SelectedItem = "";
            cbVideoHD.SelectedItem = "";
            cbCamFlash.SelectedItem = "";
            cbMem.SelectedItem = "";
            cbWeight.SelectedItem = "";
            cbCamPixel.SelectedItem = "";
            cbColor.SelectedItem = "";
            cbWifi.SelectedItem = "";
            cbZoom.SelectedItem = "";
        }

        public void testDataGrid()
        {
            MobilePhoneRecommendation test = new MobilePhoneRecommendation();
            test.fPixel = 1;
            test.fPrice = 1;
            test.fScreen = 1; 
            test.fWeight = 1;
            test.fWeightage = 1;
            test.iMemory = 1;
            test.iZoom = 1;
            test.sBluetooth = "test";
            test.sBrand = "testbrand";
            test.sFlash = "testflash";
            test.sFM="testfm";
            test.sModel = "testModel";
            test.sOS = "testOS";
            test.sVideoHD = "testVid";
            test.sWifi = "testwifi";
            results.Add(test);
        }
   
    }

 
}
