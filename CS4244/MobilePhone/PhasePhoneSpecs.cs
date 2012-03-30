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
            string evalStr = "(get_mobilephone_list)";
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

            //toString slightly different to retain float precision @kwanghock 18march2012
            for (int i = 0; i < listWeight.Count; i++)
                cbWeight.Items.Add((listWeight.ElementAt(i)).ToString("0.0") + " g");

            //toString slightly different to retain float precision @kwanghock 18march2012
            for (int i = 0; i < listPixel.Count; i++)
                cbCamPixel.Items.Add((listPixel.ElementAt(i)).ToString("0.0") + " px");

            for (int i = 0; i < listWifi.Count; i++)
                cbWifi.Items.Add(UpperCaseFirstChar(listWifi.ElementAt(i)));

            for (int i = 0; i < listZoom.Count; i++)
                cbZoom.Items.Add("x"+listZoom.ElementAt(i));

            for (int i = 0; i < listOS.Count; i++)
                cbOS.Items.Add(UpperCaseFirstChar(listOS.ElementAt(i)));
            
            //add an empty option to all the dropdown boxes
            cbColor.Items.Insert(0,"");
            cbScreen.Items.Insert(0, "");
            cbFM.Items.Insert(0, "");
            cbCamFlash.Items.Insert(0, "");
            cbMem.Items.Insert(0, "");
            cbWeight.Items.Insert(0, "");
            cbCamPixel.Items.Insert(0, "");
            cbWifi.Items.Insert(0, "");
            cbOS.Items.Insert(0, "");
            cbZoom.Items.Insert(0, "");
            cbVideoHD.Items.Insert(0, "");
        }
       
        //Convert the first letter of the string arugment to be of uppercase
        public String UpperCaseFirstChar(String sConvert)
        {
            if (sConvert == "")
                return "";
            //Set first letter to caps
           char[] letters = sConvert.ToCharArray();
           letters[0] = char.ToUpper(letters[0]);
           return new String(letters);
        }

        //Convert the first letter of the string arugment to be of lowercase
        public String LowerCaseFirstChar(String sConvert)
        {
            if (sConvert == "")
                return "";
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

            if (cbOS.SelectedItem != null && cbOS.SelectedItem != "")
            {
                sSelectedOS = LowerCaseFirstChar(cbOS.SelectedItem.ToString());
            }
            else sSelectedOS = "nil";

            if (cbScreen.SelectedItem != null && cbScreen.SelectedItem != "")
            {
                sSelectedScreen = LowerCaseFirstChar(cbScreen.SelectedItem.ToString());
            }
            else sSelectedScreen = "nil";

            if (cbFM.SelectedItem != null && cbFM.SelectedItem != "")
            {
                sSelectedFM = LowerCaseFirstChar(cbFM.SelectedItem.ToString());
            }
            else sSelectedFM = "nil";

            if (cbVideoHD.SelectedItem != null && cbVideoHD.SelectedItem != "")
            {
                sSelectedVideoHD = LowerCaseFirstChar(cbVideoHD.SelectedItem.ToString());
            }
            else sSelectedVideoHD = "nil";

            if (cbCamFlash.SelectedItem != null && cbCamFlash.SelectedItem != "")
            {
                sSelectedCamFlash = LowerCaseFirstChar(cbCamFlash.SelectedItem.ToString());
            }
            else sSelectedCamFlash = "nil";

            if (cbMem.SelectedItem != null && cbMem.SelectedItem != "")
            {
                sSelectedMem = cbMem.SelectedItem.ToString().Substring(0, cbMem.SelectedItem.ToString().IndexOf(" "));
            }
            else sSelectedMem = "nil";

            if (cbWeight.SelectedItem != null && cbWeight.SelectedItem != "")
            {
                sSelectedWeight = cbWeight.SelectedItem.ToString().Substring(0, cbWeight.SelectedItem.ToString().IndexOf(" "));
            }
            else sSelectedWeight = "nil";

            if (cbCamPixel.SelectedItem != null && cbCamPixel.SelectedItem != "")
            {
                sSelectedPixel = cbCamPixel.SelectedItem.ToString().Substring(0, cbCamPixel.SelectedItem.ToString().IndexOf("px"));
            }
            else sSelectedPixel = "nil";

            if (cbWifi.SelectedItem != null && cbWifi.SelectedItem != "")
            {
                sSelectedWifi = LowerCaseFirstChar(cbWifi.SelectedItem.ToString());
            }
            else sSelectedWifi = "nil";

            if (cbColor.SelectedItem!= null && cbColor.SelectedItem !="")
            {
                sSelectedColor = LowerCaseFirstChar(cbColor.SelectedItem.ToString());
            }
            else sSelectedColor = "nil";

            if (cbZoom.SelectedItem != null && cbZoom.SelectedItem != "")
            {
                //remove the x from the pixel value displayed @kwanghock 18march2012
                sSelectedZoom = LowerCaseFirstChar(cbZoom.SelectedItem.ToString().Substring(1));
            }
            else sSelectedZoom = "nil";

            environment.Run();

            UpdatePhoneGrid(sSelectedOS + " " + sSelectedScreen + " " + sSelectedFM + " " + sSelectedVideoHD + " " + sSelectedCamFlash + " " + sSelectedMem + " " + sSelectedWeight + " " + sSelectedPixel + " " + sSelectedColor + " " + sSelectedWifi + " " + sSelectedZoom);
        }

        public void UpdatePhoneGrid(String attribute)
        {
            string evalStr = "(update_mobilephone_list " + attribute + ")";
           // string evalStr = "(get_weightagephone_list)";
       
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
                 * @kwanghock
                 */
                try
                {
                    String sCehck = (String)(SymbolValue)fv.GetFactSlot("brand");
                    continue;
                }
                catch(Exception exception)
                {
                    if ((fv.GetFactSlot("model").GetType().ToString()).Equals("Mommosoft.ExpertSystem.SymbolValue"))
                        sModel = (String)(SymbolValue)fv.GetFactSlot("model");
                    else if ((fv.GetFactSlot("model").GetType().ToString()).Equals("Mommosoft.ExpertSystem.IntegerValue"))
                        sModel = ((int)(IntegerValue)fv.GetFactSlot("model")).ToString();

                    fWeightage = (float)(FloatValue)fv.GetFactSlot("weightage");
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
            // Debug purpose
            // MessageBox.Show(phase3Results.Count.ToString());
            testDataGrid();
            //dataGridView.Refresh();

           // for (int i = 0; i < phase3Results.Count; i++)
           // {
           //     if (phase3Results.ElementAt(i).fWeightage == 0)
            //        phase3Results.RemoveAt(i);
           // }
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
